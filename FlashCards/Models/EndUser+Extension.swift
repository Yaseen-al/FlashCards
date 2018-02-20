//
//  EndUser+Extension.swift
//  FlashCards
//
//  Created by C4Q on 2/13/18.
//  Copyright © 2018 QI. All rights reserved.
//

import Foundation
import CoreData
extension EndUser{
    convenience init?(from jsonDict: [String: Any]){
        self.init(context: CoreDataHelper.manager.managedObject)
        guard let userName = jsonDict["userName"] as? String else{return}
        guard let userId = jsonDict["userId"] as? String else{return}
        self.userName = userName
        self.userId = userId
        
        if let userAge = jsonDict["age"] as? Int16{
            self.age = userAge
        }
        if let userNationality = jsonDict["nationality"] as? String{
            self.nationality = userNationality
        }
        if let categoriesDicts = jsonDict["categories"] as? [String:Any]{
            for key in categoriesDicts.keys{
                if let categoryDict  = categoriesDicts[key] as? [String:Any]{
                    if let category = Category.init(from: categoryDict){
                        category.user = self
                    }
                }
            }
        }
    }
    convenience init(userName: String, age: Int16, nationality: String, userId: String){
        self.init(context: CoreDataHelper.manager.managedObject)
        self.userName = userName
        self.age = age
        self.nationality = nationality
        self.userId = userId
    }
    func intoJSON()->[String: Any]{
        var dectionary = [String: Any]()
        dectionary["userName"] = userName
        dectionary["userId"] = userId
        dectionary["age"] = age
        dectionary["nationality"] = nationality
        if let userCategories = categories{
            var dictOfCategoryDict = [String: String]()
            for category in userCategories{
                let categoryConversion = category as! Category
                dictOfCategoryDict[categoryConversion.categoryId!] = categoryConversion.title
            }
            dectionary["categories"] = dictOfCategoryDict
        }
        return dectionary
    }
}
