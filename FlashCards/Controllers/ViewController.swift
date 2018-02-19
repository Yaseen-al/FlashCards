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
            let card = Card(backBody: "it is a school", backImageURL: "image", categoryUID: category.creatorId!, frontBody: "Schule", frontImage: "image", title: "German Words")
            card.cardId = "adsfsdf23125"
            DataBaseService.manager.addNewCard(card: card, category: category)
//            category.user = endUser
//            category2.user = endUser
//            category2.user = endUser
//            DataBaseService.manager.updateEndUserCategories(endUser: endUser!, errorHandler: {print($0)})
            
            DataBaseService.manager.addNewCategory(user: user, category: category)
//            DataBaseService.manager.updateEndUserCategories(endUser: endUser!, errorHandler: {print($0)})
        }
    }
    
    @IBAction func createNewCategory(_ sender: UIButton) {
        guard let user = AuthenticationService.getCurrentUser() else {
            print("Dev: No user signed in please sign in")
            return
        }
        DataBaseService.manager.retrieveAllCategories(completion: { (categoriesFromDataBase) in
            for category in categoriesFromDataBase{
                print(category)
            }
        }, errorHandler: {print($0)})

    }
    @IBAction func createTestUser(_ sender: UIButton) {
        //retrieveCardTest
//        DataBaseService.manager.retrieveCard(from: "-L5Qg2cSN6c45DZOV-Lg", completion: {print($0.cardTitle)}, errorHandler: {print($0)})
        //retrieveCategoryTest
        var category: Category?{
            didSet{
                let card = Card(backBody: "it is a school", backImageURL: "image", categoryUID: (category?.creatorId!)!, frontBody: "Schule", frontImage: "image", title: "German Words")
                DataBaseService.manager.addNewCard(card: card, category: category!)
            }
        }
        
        DataBaseService.manager.retrieveCategory(from: "-L5Qg2cSN6c45DZOV-Lh", completion: {category = $0}, errorHandler: {print($0)})
        
//        AuthenticationService.createUser(email: "newSmile@sunshine.com", password: "wegwowego", completion: { (user) in
//
//        }) { (error) in
//
//        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

