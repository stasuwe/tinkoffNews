//
//  NewsItem.swift
//  TinkoffNews
//
//  Created by Станислав Сарычев on 06.07.17.
//  Copyright © 2017 Станислав Сарычев. All rights reserved.
//

import Foundation

struct NewsItem {
    let id: String
    let text: String
    let publicationDate: Date
    
    init(id: String, text: String, publicationDate: Date) {
        self.id = id
        self.text = text
        self.publicationDate = publicationDate
    }
    
    init?(json: [String: Any]) {
        
        guard
            let _id = json["id"] as? String,
            let _text = json["text"] as? String,
            let _publicationDate = json["publicationDate"] as? [String: Any],
            let _timeInterval = _publicationDate["milliseconds"] as? Double
            else { return nil }
        
        self.init(id: _id,
                  text: String(htmlEncodedString: _text),
                  publicationDate: Date(timeIntervalSince1970: _timeInterval/1000))
    }
    

    
}
