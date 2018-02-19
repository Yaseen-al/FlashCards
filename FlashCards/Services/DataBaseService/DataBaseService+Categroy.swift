//
//  DataBaseService+Categroy.swift
//  FlashCards
//
//  Created by C4Q on 2/15/18.
//  Copyright © 2018 QI. All rights reserved.
//

import Foundation
import Firebase
extension DataBaseService{
    //this function will retrieve all categories from the dataBas
    func retrieveAllCategories(completion: @escaping ([Category])->Void, errorHandler: @escaping (Error)->Void){
        let categoryRef = DataBaseService.manager.getCategoryRef()
        categoryRef.observe(.value) { (snapshot) in
            guard let snapshots = snapshot.children.allObjects as? [DataSnapshot] else {
                errorHandler(UserDataBaseErrors.categoryDictError)
                print("category node has no children")
                return}
            var allCategories = [Category]()
            for snap in snapshots {
                //convert to json
                guard let jsonDict = snap.value as? [String:Any] else {continue}
                if let category = Category(from: jsonDict){
                allCategories.append(category)
                }
            }
            completion(allCategories)
        }
    }
    //this function will retrieve a category from a category ID
    func retrieveCategory(from categoryId: String, completion: @escaping (Category)->Void, errorHandler: @escaping (Error)->Void){
        let categoryRef = DataBaseService.manager.getCategoryRef().child(categoryId)
        //notice that the convenience init has a function that is on another thread which I need to wait till it finishes loading the cards to make the category
        categoryRef.observeSingleEvent(of: .value) { (snapshot) in
                if let jsonDict = snapshot.value as? [String:Any]{
                    var cards = [Card](){
                        didSet{
                            if let category = Category.init(from: jsonDict) {
                                cards.forEach({ (card) in
                                    card.category = category
                                })
                                completion(category)
                            }
                        }
                    }
                    if let cardsDict = jsonDict["cards"] as? [String: String]{
                        for key in cardsDict.keys{
                        DataBaseService.manager.retrieveCard(from: key, completion: { (card) in
                            cards.append(card)
                        }, errorHandler: {print($0)})
                    }
                    }else{
                        //this will return a category that doesn't have any cards
                        if let category = Category.init(from: jsonDict) {
                            completion(category)
                        }
                    }
                }else{
                    errorHandler(UserDataBaseErrors.userDictError)
                }
        }
    }
    //this function will add a new category and update the users categories too
    func addNewCategory(user: User, category: Category){
        let childByAutoId = self.getCategoryRef().childByAutoId()
        //this will save the category
        category.categoryId = childByAutoId.key
        DataBaseService.manager.retrieveEndUser(completion: { (endUser) in
             category.user = endUser
            DataBaseService.manager.updateEndUserCategories(endUser: endUser, errorHandler: {print($0)})
        }, errorHandler: {print($0)})
        childByAutoId.setValue(category.intoJSON())
    }
    //this function will update the category on the dataBase
    func updateCategory(for category: Category, errorHandler: @escaping (Error)->Void){
        guard let categoryId = category.categoryId else{
            errorHandler(UserDataBaseErrors.noCategoryId)
            return
        }
        let categoryRef = self.getCategoryRef().child(categoryId)
        categoryRef.setValue(category.intoJSON())
    }
}



