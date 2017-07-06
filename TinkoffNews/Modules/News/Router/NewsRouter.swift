//
//  NewsRouter.swift
//  TinkoffNews
//
//  Created by Станислав Сарычев on 06.07.17.
//  Copyright © 2017 Станислав Сарычев. All rights reserved.
//

import Foundation

final class NewsRouter: NewsRouterInput {
    
    fileprivate let root: MainRouter
    fileprivate let moduleFactory: NewsModuleFactory
    
    init(root: MainRouter, moduleFactory: NewsModuleFactory){
        self.root = root
        self.moduleFactory = moduleFactory
    }
    
    func openArticleWithId(_ id: String) {
        let articleModule = moduleFactory.createArticleModule()
        articleModule.input.setup(withArticleId: id)
        root.open(presentationStyle: .show(vc: articleModule.view), animated: true)
    }
    
}
