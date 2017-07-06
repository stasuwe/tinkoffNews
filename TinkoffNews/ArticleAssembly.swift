//
//  ArticleAssembly.swift
//  TinkoffNews
//
//  Created by Станислав Сарычев on 06.07.17.
//  Copyright © 2017 Станислав Сарычев. All rights reserved.
//

import UIKit

class ArticleAssembly {
    
    static func createModule() -> (UIViewController, ArticleModuleInput) {
        
        let interactor = ArticleInteractor(apiService: APIServiceImpl())
        let presenter = ArticlePresenter(interactor: interactor)
        let view = ArticleViewController()
        
        view.output = presenter
        presenter.view = view
        
        return (view, presenter)
    }
    
}
