//
//  ModuleFactory.swift
//  TinkoffNews
//
//  Created by Станислав Сарычев on 06.07.17.
//  Copyright © 2017 Станислав Сарычев. All rights reserved.
//

import UIKit

protocol NewsModuleFactory {
    func createArticleModule() -> (view: UIViewController, input: ArticleModuleInput)
}

final class ModuleFactory: NewsModuleFactory {
    
    fileprivate let router: MainRouter
    
    init(mainRouter: MainRouter) {
        self.router = mainRouter
    }
    
    //MARK: - SourcesModuleFactory
    func createArticleModule() -> (view: UIViewController, input: ArticleModuleInput) {
        let module = ArticleAssembly.createModule()
        return module
    }
 
    
}
