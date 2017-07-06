//
//  APIServiceImpl.swift
//  TinkoffNews
//
//  Created by Станислав Сарычев on 06.07.17.
//  Copyright © 2017 Станислав Сарычев. All rights reserved.
//

import Foundation

final class APIServiceImpl: APIService {
        
    fileprivate enum APIMethods: String {
        case news = "https://api.tinkoff.ru/v1/news"
        case newsContent = "https://api.tinkoff.ru/v1/news_content?id="
    }
    fileprivate let urlSession = URLSession(configuration: URLSessionConfiguration.default)
    
    
    //MARK: - APIService
    func getNews(_ completion: @escaping (_ newsItems: [NewsItem]) -> ()) {
        
        guard let requestUrl = URL(string: APIMethods.news.rawValue) else { completion([]); return }
        
        urlSession.dataTask(with: requestUrl, completionHandler: { data, response, error in
            if error != nil {
                completion([]); return
            }
            
            guard let data = data,
                let jsonResponse = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: Any],
                let jsonArray = jsonResponse["payload"] as? [[String: Any]]
                else { completion([]); return }
            
            var newsItems = [NewsItem]()
            for json in jsonArray {
                guard let item = NewsItem(json: json) else {
                    newsItems.removeAll()
                    break
                }
                newsItems.append(item)
            }
            completion(newsItems)
        }).resume()

    }
    
    func getArticle(withId id: String, completion: @escaping (_ articleItem: ArticleItem?) -> ()) {
        
        guard let requestUrl = URL(string: APIMethods.newsContent.rawValue + id) else { completion(nil); return }
        
        urlSession.dataTask(with: requestUrl, completionHandler: { data, response, error in
            if error != nil {
                completion(nil); return
            }
            
            guard let data = data,
                let jsonResponse = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: Any],
                let json = jsonResponse["payload"] as? [String: Any]
                else { completion(nil); return }
            
            completion(ArticleItem(json: json))
        }).resume()
        
    }
    
    
    
}
