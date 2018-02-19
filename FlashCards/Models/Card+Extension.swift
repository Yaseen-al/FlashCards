//
//  Card+Extension.swift
//  FlashCards
//
//  Created by C4Q on 2/13/18.
//  Copyright © 2018 QI. All rights reserved.
//

import Foundation
extension Card{
    //TODO make a convenience intializers as well as to JSON functions
    convenience init?(from jsonDict: [String: Any]){
        self.init(context: CoreDataHelper.manager.managedObject)
        guard let backBody = jsonDict["backBody"] as? String else{return}
        guard let backImageURL = jsonDict["backImageURL"] as? String else{return}
        guard let categoryName = jsonDict["categoryName"] as? String else{return}
        guard let frontBody = jsonDict["frontBody"] as? String else{return}
        guard let frontImageURL = jsonDict["frontImageURL"] as? String else{return}
        guard let cardTitle = jsonDict["title"] as? String else{return}
        self.backBody = backBody
        self.backImageURL = backImageURL
        self.categoryName = categoryName
        self.frontBody = frontBody
        self.frontImageURL = frontImageURL
        self.cardTitle = cardTitle
    }
    convenience init(backBody: String, backImageURL: String, categoryUID: String, frontBody: String, frontImage: String, title: String){
        self.init(context: CoreDataHelper.manager.managedObject)
        self.backBody = backBody
        self.backImageURL = backImageURL
        self.categoryName = categoryUID
        self.frontBody = frontBody
        self.frontImageURL = frontImage
        self.cardTitle = title
    }
    func intoJSON() -> [String: Any] {
        var dectionary = [String: Any]()
        dectionary["title"] = cardTitle
        dectionary["backBody"] = backBody
        dectionary["backImageURL"] = backImageURL
        dectionary["categoryName"] = categoryName
        dectionary["frontBody"] = frontBody
        dectionary["frontImageURL"] = frontImageURL
        return dectionary
    }
}
