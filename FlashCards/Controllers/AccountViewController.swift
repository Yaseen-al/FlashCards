//
//  AccountViewController.swift
//  FlashCards
//
//  Created by C4Q on 2/19/18.
//  Copyright © 2018 QI. All rights reserved.
//

import UIKit
import SnapKit
class AccountViewController: UIViewController {
    let signInView = SignInView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSignInView()
    }
    func setupSignInView(){
        view.addSubview(signInView)
        signInView.snp.makeConstraints { (constraint) in
            constraint.edges.equalTo(self.view.safeAreaLayoutGuide.snp.edges)
        }
        self.signInView.createNewAccountButton.addTarget(self, action: #selector(createNewAccountAction(sender:)), for: .touchUpInside)
    }
    //action for create new account
    @objc func createNewAccountAction(sender: UIButton){
        let createNewAccountViewController = CreateAccountViewController()
        self.navigationController?.pushViewController(createNewAccountViewController, animated: true)
    }
    
}
