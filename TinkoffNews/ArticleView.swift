//
//  ArticleView.swift
//  TinkoffNews
//
//  Created by Станислав Сарычев on 06.07.17.
//  Copyright © 2017 Станислав Сарычев. All rights reserved.
//

import UIKit

class ArticleView: UIView {
    
    func setData(_ data: ArticleViewItem) {
        textView.text = data.content
    }
    
    fileprivate let textView = UITextView(frame: .zero)
    
    init() {
        super.init(frame: .zero)
        
        addSubview(textView)
        textView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        textView.textContainerInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.isEditable = false
        textView.dataDetectorTypes = .all
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


