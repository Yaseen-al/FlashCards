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
        guard let categoryName = jsonDict["categoryName"] as? String else{return}
        guard let frontBody = jsonDict["frontBody"] as? String else{return}
        guard let cardTitle = jsonDict["title"] as? String else{return}
        guard let cardId = jsonDict["cardId"] as? String else{return}
        if let frontImageURL = jsonDict["frontImageURL"] as? String {self.frontImageURL = frontImageURL}
        if let backImageURL = jsonDict["backImageURL"] as? String {self.backImageURL = backImageURL}
        self.backBody = backBody
        self.categoryName = categoryName
        self.frontBody = frontBody
        self.cardTitle = cardTitle
        self.cardId = cardId
    }
    convenience init(backBody: String, backImageURL: String, categoryUID: String, frontBody: String, frontImage: String, title: String, cardId: String){
        self.init(context: CoreDataHelper.manager.managedObject)
        self.backBody = backBody
        self.backImageURL = backImageURL
        self.categoryName = categoryUID
        self.frontBody = frontBody
        self.frontImageURL = frontImage
        self.cardTitle = title
        self.cardId = cardId
    }
    func intoJSON() -> [String: Any] {
        var dectionary = [String: Any]()
        dectionary["title"] = cardTitle
        dectionary["backBody"] = backBody
        dectionary["backImageURL"] = backImageURL
        dectionary["categoryName"] = categoryName
        dectionary["frontBody"] = frontBody
        dectionary["frontImageURL"] = frontImageURL
        dectionary["cardId"] = cardId
        return dectionary
    }
}
