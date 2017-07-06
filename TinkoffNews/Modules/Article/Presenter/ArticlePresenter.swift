//
//  ArticlePresenter.swift
//  TinkoffNews
//
//  Created by Станислав Сарычев on 06.07.17.
//  Copyright © 2017 Станислав Сарычев. All rights reserved.
//

import Foundation

final class ArticlePresenter: ArticleModuleInput, ArticleViewOutput, ArticleInteractorOutput {
    //MARK: - ArticleModuleInput
    
    func setup(withArticleId id: String) {
        articleId = id
    }
    
    //MARK: - main
    weak var view: ArticleViewInput? {
        didSet {
            setupView()
        }
    }
    fileprivate let interactor: ArticleInteractorInput
    
    fileprivate var articleId: String?
    
    init(interactor: ArticleInteractorInput) {
        self.interactor = interactor
    }
    
    fileprivate func setupView() {
        
        view?.onViewDidLoad = { [weak self] in
            self?.view?.setTitle("Article")
            if let articleId = self?.articleId {
                self?.fetchArticleWithId(articleId)
            }
        }
    }
    
    
    fileprivate func fetchArticleWithId(_ id: String) {
        interactor.fetchArticleWithId(id, completion: { [weak self] articleItem in
            guard let articleItem = articleItem,
                let articleViewItem = self?.articleViewItemFromNewsItem(articleItem) else { return }
            self?.view?.setData(articleViewItem)
        })
    }
    
    fileprivate func articleViewItemFromNewsItem(_ articleItem: ArticleItem) -> ArticleViewItem {
        return ArticleViewItem(content: articleItem.content)
    }
    
}
