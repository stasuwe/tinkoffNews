//
//  BaseViewController.swift
//  TinkoffNews
//
//  Created by Станислав Сарычев on 06.07.17.
//  Copyright © 2017 Станислав Сарычев. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, ViewLifecycleObservable {
    
    //MARK: - ViewLifecycleObservable protocol
    var onViewDidLoad: (() -> ())?
    var onViewWillAppear: (() -> ())?
    
    
    //MARK: - base implementation
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        onViewDidLoad?()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        onViewWillAppear?()
    }
    
}
