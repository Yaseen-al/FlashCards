//
//  Category+Extension.swift
//  FlashCards
//
//  Created by C4Q on 2/13/18.
//  Copyright © 2018 QI. All rights reserved.
//

import Foundation
import Firebase
extension Category{
    convenience init?(from jsonDict: [String: Any]){
        self.init(context: CoreDataHelper.manager.managedObject)
        guard let title = jsonDict["title"] as? String else{return}
        guard let creatorId = jsonDict["creatorId"] as? String else{return}
        if let cardsDict = jsonDict["cards"] as? [String: String]{
            for key in cardsDict.keys{
                // convert the key into a card using the function from the card that takse cardId and returns card
                DataBaseService.manager.retrieveCard(from: key, completion: { (card) in
                    card.category = self
                }, errorHandler: {print($0)})
            }
        }
        if let categroyId = jsonDict["categoryId"] as? String{
            self.categoryId = categroyId
        }
        self.title = title
        self.creatorId = creatorId
    }
    
    convenience init(title: String, user: User){
        self.init(context: CoreDataHelper.manager.managedObject)
        self.title = title
        self.creatorId = user.uid
    }
    func intoJSON()->[String: Any]{
        var dectionary = [String: Any]()
        dectionary["title"] = title
        dectionary["creatorId"] = creatorId
        dectionary["categoryId"] = categoryId
        if let cards = cards{
            var cardsDictionary = [String:String]()
            for card in cards{
                let cardConversion = card as! Card
                cardsDictionary[cardConversion.cardId!] = cardConversion.cardTitle
            }
            dectionary["cards"] = cardsDictionary
        }
        return dectionary
    }
}
