//
//  ArticleInteractorIO.swift
//  TinkoffNews
//
//  Created by Станислав Сарычев on 06.07.17.
//  Copyright © 2017 Станислав Сарычев. All rights reserved.
//

import Foundation

protocol ArticleInteractorInput: class {
    typealias FetchCompletion = (_ article: ArticleItem?) -> ()
    
    func fetchArticleWithId(_ id: String, completion: @escaping FetchCompletion)
    
}

protocol ArticleInteractorOutput {}
