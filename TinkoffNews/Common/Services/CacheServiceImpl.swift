//
//  CacheServiceImpl.swift
//  TinkoffNews
//
//  Created by Станислав Сарычев on 06.07.17.
//  Copyright © 2017 Станислав Сарычев. All rights reserved.
//

import Foundation
import CoreData

final class CacheServiceImpl: CacheService {
    
    fileprivate enum CachedEntities: String {
        case newsItem = "CachedNewsItem"
    }
    
    fileprivate lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CacheModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    
    //MARK: - CachedService
    func getNews() -> [NewsItem] {
        let request = NSFetchRequest<CachedNewsItem>(entityName: CachedEntities.newsItem.rawValue)
        let context = persistentContainer.viewContext
        var fetchResult = [CachedNewsItem]()
        
        do {
            fetchResult = try context.fetch(request)
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }

        return fetchResult.map({ $0.toNewsItem() })
    }
    
    func saveNews(_ news: [NewsItem]) {
        let context = persistentContainer.viewContext
        news.forEach({
            let cachedNewsItem = NSEntityDescription.insertNewObject(forEntityName: CachedEntities.newsItem.rawValue, into: context) as! CachedNewsItem
            cachedNewsItem.id = $0.id
            cachedNewsItem.text = $0.text
            cachedNewsItem.publicationDate = $0.publicationDate as NSDate
        })
        saveContext()
    }
    
    
    //MARK: - private methods
    fileprivate func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

    
}
