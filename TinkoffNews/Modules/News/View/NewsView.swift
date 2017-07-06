//
//  NewsView.swift
//  TinkoffNews
//
//  Created by Станислав Сарычев on 06.07.17.
//  Copyright © 2017 Станислав Сарычев. All rights reserved.
//

import UIKit

class NewsView: UITableView, UITableViewDataSource, UITableViewDelegate {
    
    func setData(_ data: [NewsViewItem]) {
        viewData = data
        tableFooterView = UIView()
        reloadData()
        if data.count == 0 {
            showEmptyView()
        }
    }
    
    
    fileprivate let cellReuseIdentifier = "NewsCellIdentifier"
    fileprivate var viewData = [NewsViewItem]()
    
    init() {
        super.init(frame: .zero, style: .plain)
        dataSource = self
        delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - UITableViewDatasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier)
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellReuseIdentifier)
        }
        cell!.textLabel?.text = viewData[indexPath.row].text
        cell!.textLabel?.numberOfLines = 0
        cell!.detailTextLabel?.text = viewData[indexPath.row].publicationDate
        return cell!
    }
    
    //MARK: - UITableviewdelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewData[indexPath.row].onSelect()
    }
    
}

