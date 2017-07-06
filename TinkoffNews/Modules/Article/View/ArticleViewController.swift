//
//  ArticleViewController.swift
//  TinkoffNews
//
//  Created by Станислав Сарычев on 06.07.17.
//  Copyright © 2017 Станислав Сарычев. All rights reserved.
//

import UIKit

class ArticleViewController: BaseViewController, ArticleViewInput {
    
    //MARK: - ArticleViewInput
    @nonobjc func setTitle(_ title: String) {
        self.title = title
    }
    
    func setData(_ data: ArticleViewItem) {
        DispatchQueue.main.async {
            self.articleView.setData(data)
        }
    }
    
    //MARK: - main
    var output: ArticleViewOutput?
    
    fileprivate let articleView = ArticleView()
    
    override func loadView() {
        view = articleView
    }
    
}



