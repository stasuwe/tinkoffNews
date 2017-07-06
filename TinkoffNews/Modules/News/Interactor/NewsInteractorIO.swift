//
//  NewsInteractorIO.swift
//  TinkoffNews
//
//  Created by Станислав Сарычев on 06.07.17.
//  Copyright © 2017 Станислав Сарычев. All rights reserved.
//

import Foundation

protocol NewsInteractorInput: class {
    typealias FetchCompletion = (_ news: [NewsItem]) -> ()
    
    func fetchNews(useCache: Bool, completion: @escaping FetchCompletion)
    
}

protocol NewsInteractorOutput {}
