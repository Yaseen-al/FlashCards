//
//  CategoryCardsView.swift
//  FlashCards
//
//  Created by C4Q on 2/19/18.
//  Copyright © 2018 QI. All rights reserved.
//

import UIKit

class CategoryCardsView: UIView {
        lazy var tableView: UITableView = {
            let tView = UITableView()
            tView.register(UITableViewCell.self, forCellReuseIdentifier: "customTableViewCell")
            return tView
        }()
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupViews()
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        func setupViews(){
            setupTableView()
        }
        func setupTableView(){
            addSubview(tableView)
            tableView.snp.makeConstraints { (constraint) in
                constraint.edges.equalTo(snp.edges)
            }
        }
        
}
