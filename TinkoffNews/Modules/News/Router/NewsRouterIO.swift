//
//  NewsRouterIO.swift
//  TinkoffNews
//
//  Created by Станислав Сарычев on 06.07.17.
//  Copyright © 2017 Станислав Сарычев. All rights reserved.
//

import Foundation

protocol NewsRouterInput {
    
    func openArticleWithId(_ id: String)
}

protocol NewsRouterOutput {}
