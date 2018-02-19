//
//  CreateAccountViewController.swift
//  FlashCards
//
//  Created by C4Q on 2/19/18.
//  Copyright © 2018 QI. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {
    let createNewAccountView = CreateNewAccountView()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCreateNewAccountView()
    }
    func setupCreateNewAccountView(){
        view.addSubview(createNewAccountView)
        createNewAccountView.snp.makeConstraints { (constraint) in
            constraint.edges.equalTo(view.safeAreaLayoutGuide.snp.edges)
        }
    }

}
