//
//  NewsPresenter.swift
//  TinkoffNews
//
//  Created by Станислав Сарычев on 06.07.17.
//  Copyright © 2017 Станислав Сарычев. All rights reserved.
//

import Foundation

final class NewsPresenter: NewsViewOutput, NewsInteractorOutput {
    
    //MARK: - main
    weak var view: NewsViewInput? {
        didSet {
            setupView()
        }
    }
    fileprivate let interactor: NewsInteractorInput
    fileprivate let router: NewsRouterInput
    
    init(interactor: NewsInteractorInput, router: NewsRouterInput) {
        self.interactor = interactor
        self.router = router
    }
    
    fileprivate func setupView() {
        
        view?.onViewDidLoad = { [weak self] in
            self?.view?.setTitle("News")
            self?.fetchNews(useCache: true)
        }
        
        view?.onRefresh = { [weak self] in
            self?.fetchNews(useCache: false)
        }
    }
    
    
    fileprivate func fetchNews(useCache: Bool) {
        view?.showLoading()
        interactor.fetchNews(useCache: useCache, completion: { [weak self] newsItems in
            guard let newsViewItems = self?.newsViewItemsFromNewsItems(newsItems) else { return }
            self?.view?.setData(newsViewItems)
        })
        
    }
    
    fileprivate func newsViewItemsFromNewsItems(_ newsItems: [NewsItem]) -> [NewsViewItem] {
        return newsItems
            .sorted(by: { $0.0.publicationDate > $0.1.publicationDate })
            .map({ newsViewItemFromNewsItem($0) })
    }
    
    fileprivate func newsViewItemFromNewsItem(_ newsItem: NewsItem) -> NewsViewItem {
        
        return NewsViewItem(text: newsItem.text,
                            publicationDate: newsItem.publicationDate.longDateString,
                               onSelect: { [weak self] in
                                self?.router.openArticleWithId(newsItem.id)
        })
    }
    
}
