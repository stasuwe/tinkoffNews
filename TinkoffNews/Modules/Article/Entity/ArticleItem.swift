//
//  ArticleItem.swift
//  TinkoffNews
//
//  Created by Станислав Сарычев on 06.07.17.
//  Copyright © 2017 Станислав Сарычев. All rights reserved.
//

import Foundation

struct ArticleItem {
    let content: String
    
    init?(json: [String: Any]) {
        
        guard
            let _content = json["content"] as? String
            else { return nil }
        
        self.content = String(htmlEncodedString: _content)
    }
    
}
