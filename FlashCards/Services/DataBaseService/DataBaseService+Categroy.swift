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
}
