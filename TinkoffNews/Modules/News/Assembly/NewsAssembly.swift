//
//  NewsAssembly.swift
//  TinkoffNews
//
//  Created by Станислав Сарычев on 06.07.17.
//  Copyright © 2017 Станислав Сарычев. All rights reserved.
//

import UIKit

class NewsAssembly {
    
    static func createModule(root: MainRouter) -> UIViewController {
        
        let interactor = NewsInteractor(apiService: APIServiceImpl(), cacheService: CacheServiceImpl())
        let router = NewsRouter(root: root, moduleFactory: ModuleFactory(mainRouter: root))
        let presenter = NewsPresenter(interactor: interactor, router: router)
        let view = NewsViewController(style: .plain)
        
        view.output = presenter
        presenter.view = view
        
        return view
    }
    
}

