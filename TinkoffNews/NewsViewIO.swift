//
//  NewsViewIO.swift
//  TinkoffNews
//
//  Created by Станислав Сарычев on 06.07.17.
//  Copyright © 2017 Станислав Сарычев. All rights reserved.
//

import Foundation

struct NewsViewItem {
    let text: String
    let publicationDate: String
    var onSelect: () -> ()
}


protocol NewsViewInput: class, ViewLifecycleObservable {
    
    func setTitle(_ title: String)
    func showLoading()
    func setData(_ data: [NewsViewItem])
    
    var onRefresh: (() -> ())? { get set }
}

protocol NewsViewOutput {}
