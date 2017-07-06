//
//  NewsViewController.swift
//  TinkoffNews
//
//  Created by Станислав Сарычев on 06.07.17.
//  Copyright © 2017 Станислав Сарычев. All rights reserved.
//

import UIKit

class NewsViewController: BaseTableViewController, NewsViewInput {
    
    //MARK: - NewsViewInput
    @nonobjc func setTitle(_ title: String) {
        self.title = title
    }
    
    func setData(_ data: [NewsViewItem]) {
        DispatchQueue.main.async {
            if self.refreshCtrl.isRefreshing {
                self.refreshCtrl.endRefreshing()
            }
            self.newsView.setData(data)
        }
    }
    
    func showLoading() {
        newsView.showLoadingView()
    }
    
    var onRefresh: (() -> ())?
    
    
    //MARK: - main
    var output: NewsViewOutput?
    
    fileprivate let newsView = NewsView()
    fileprivate let refreshCtrl = UIRefreshControl()

    override func loadView() {
        view = newsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newsView.rowHeight = UITableViewAutomaticDimension
        newsView.estimatedRowHeight = 50

        refreshCtrl.attributedTitle = NSAttributedString(string: "Refreshing")
        refreshCtrl.addTarget(self, action: #selector(refreshHandler(_:)), for: .valueChanged)
        newsView.refreshControl = refreshCtrl
        
    }
    
    @objc fileprivate func refreshHandler(_ sender: UIRefreshControl) {
        onRefresh?()
    }
}

