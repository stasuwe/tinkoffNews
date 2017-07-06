//
//  ArticleInteractor.swift
//  TinkoffNews
//
//  Created by Станислав Сарычев on 06.07.17.
//  Copyright © 2017 Станислав Сарычев. All rights reserved.
//

import Foundation

final class ArticleInteractor: ArticleInteractorInput {
    
    fileprivate let apiService: APIService?
    
    init(apiService: APIService) {
        self.apiService = apiService
    }
    
    func fetchArticleWithId(_ id: String, completion: @escaping FetchCompletion) {
       apiService?.getArticle(withId: id, completion: completion)
    }
    
}
