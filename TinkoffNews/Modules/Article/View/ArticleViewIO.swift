//
//  ArticleViewIO.swift
//  TinkoffNews
//
//  Created by Станислав Сарычев on 06.07.17.
//  Copyright © 2017 Станислав Сарычев. All rights reserved.
//

import Foundation

struct ArticleViewItem {
    let content: String
}


protocol ArticleViewInput: class, ViewLifecycleObservable {
    
    func setTitle(_ title: String)
    func setData(_ data: ArticleViewItem)
    
}

protocol ArticleViewOutput {}
