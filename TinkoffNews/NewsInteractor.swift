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
    
    init(apiService: APIService) {
        self.apiService = apiService
    }

    func fetchNews(completion: @escaping FetchCompletion) {
       apiService?.getNews(completion)
    }
    
}
