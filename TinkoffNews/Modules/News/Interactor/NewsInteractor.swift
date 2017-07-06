//
//  NewsInteractor.swift
//  TinkoffNews
//
//  Created by Станислав Сарычев on 06.07.17.
//  Copyright © 2017 Станислав Сарычев. All rights reserved.
//

import Foundation

final class NewsInteractor: NewsInteractorInput {
    
    fileprivate let apiService: APIService?
    fileprivate let cacheService: CacheService?
    
    init(apiService: APIService, cacheService: CacheService) {
        self.apiService = apiService
        self.cacheService = cacheService
    }

    func fetchNews(useCache: Bool, completion: @escaping FetchCompletion) {
        if let newsItems = cacheService?.getNews(),
            newsItems.count > 0,
            useCache {
            completion(newsItems)
        } else {
            apiService?.getNews({ [weak self] newsItems in
                self?.cacheService?.saveNews(newsItems)
                completion(newsItems)
            })
        }
    }
    
}
