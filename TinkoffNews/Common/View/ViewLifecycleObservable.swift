//
//  ViewLifecycleObservable.swift
//  TinkoffNews
//
//  Created by Станислав Сарычев on 06.07.17.
//  Copyright © 2017 Станислав Сарычев. All rights reserved.
//

import Foundation

protocol ViewLifecycleObservable {
    var onViewDidLoad: (() -> ())? { get set }
    var onViewWillAppear: (() -> ())? { get set }
}
