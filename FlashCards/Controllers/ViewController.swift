//
//  ViewController.swift
//  FlashCards
//
//  Created by C4Q on 2/13/18.
//  Copyright © 2018 QI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var endUser: EndUser?{
        didSet{
            guard let user = AuthenticationService.getCurrentUser() else {
                print("Dev: No user signed in please sign in")
                return
            }
            let category = Category(title: "Adventure", user: user)
            let category2 = Category(title: "science", user: user)
//            category.user = endUser
//            category2.user = endUser
//            category2.user = endUser
//            DataBaseService.manager.updateEndUserCategories(endUser: endUser!, errorHandler: {print($0)})
            
            DataBaseService.manager.addNewCategory(user: user, category: category)
//            DataBaseService.manager.updateEndUserCategories(endUser: endUser!, errorHandler: {print($0)})
        }
    }
    
    @IBAction func createNewCategory(_ sender: UIButton) {
    
        DataBaseService.manager.retrieveEndUser(completion: { [weak self](endUser) in
            self?.endUser = endUser
        }, errorHandler: {print($0)})
    }
    @IBAction func createTestUser(_ sender: UIButton) {
        
        AuthenticationService.createUser(email: "newSmile@sunshine.com", password: "wegwowego", completion: { (user) in
            
        }) { (error) in
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

