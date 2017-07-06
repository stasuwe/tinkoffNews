//
//  CachedNewsItem+CoreDataClass.swift
//  TinkoffNews
//
//  Created by Станислав Сарычев on 06.07.17.
//  Copyright © 2017 Станислав Сарычев. All rights reserved.
//

import Foundation
import CoreData


public class CachedNewsItem: NSManagedObject {

    func toNewsItem() -> NewsItem {
        guard let id = id,
            let text = text,
            let publicationDate = publicationDate else {
                return NewsItem(id: "undefind", text: "undefind", publicationDate: Date())
        }
        return NewsItem(id: id, text: text, publicationDate: publicationDate as Date)
    }
    
}
