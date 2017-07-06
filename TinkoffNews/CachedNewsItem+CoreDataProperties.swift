//
//  CachedNewsItem+CoreDataProperties.swift
//  TinkoffNews
//
//  Created by Станислав Сарычев on 06.07.17.
//  Copyright © 2017 Станислав Сарычев. All rights reserved.
//

import Foundation
import CoreData


extension CachedNewsItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedNewsItem> {
        return NSFetchRequest<CachedNewsItem>(entityName: "CachedNewsItem")
    }

    @NSManaged public var id: String?
    @NSManaged public var text: String?
    @NSManaged public var publicationDate: NSDate?

}
