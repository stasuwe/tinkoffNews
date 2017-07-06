//
//  APIService.swift
//  TinkoffNews
//
//  Created by Станислав Сарычев on 06.07.17.
//  Copyright © 2017 Станислав Сарычев. All rights reserved.
//

import Foundation

protocol APIService {
    func getNews(_ completion: @escaping (_ newsItems: [NewsItem]) -> ())
    func getArticle(withId id: String, completion: @escaping (_ articleItem: ArticleItem?) -> ())
}
