//
//  HomeFeedViewController.swift
//  FlashCards
//
//  Created by C4Q on 2/18/18.
//  Copyright © 2018 QI. All rights reserved.
//

import UIKit

class HomeFeedViewController: UIViewController {
    let homeFeedView = HomeFeedView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        setupHomeFeedView()
        configNavBar()
    }
    func configNavBar(){
        let listNavBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "list"), style: .plain, target: self, action: nil)
        let addPostNavBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "plus-symbol"), style: .plain, target: self, action: nil)
        let logo = #imageLiteral(resourceName: "flashCard")
        let imageView = UIImageView(image:logo)
        imageView.contentMode = .scaleAspectFit
        
//        let tap = UITapGestureRecognizer(target: self, action: #selector(logoIconButtonItemAction))
//        tap.delegate = self
//        imageView.isUserInteractionEnabled = true
//        imageView.addGestureRecognizer(tap)
        self.navigationItem.titleView = imageView
        navigationItem.rightBarButtonItems = [addPostNavBarButtonItem]
        navigationController?.navigationBar.prefersLargeTitles = true
//        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor: Settings.manager.textColor]
        navigationItem.title = "Flash Cards"
//        navigationController?.navigationBar.barTintColor = .orange
    }
    
    func setupHomeFeedView(){
        view.addSubview(homeFeedView)
        homeFeedView.snp.makeConstraints { (constraint) in
            constraint.edges.equalTo(view.snp.edges)
        }
    }

}
