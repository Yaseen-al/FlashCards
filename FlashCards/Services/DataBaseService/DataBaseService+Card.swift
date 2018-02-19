//
//  DataBaseService+Card.swift
//  FlashCards
//
//  Created by C4Q on 2/15/18.
//  Copyright © 2018 QI. All rights reserved.
//

import Foundation
extension DataBaseService{
    // this function will add a new card to the dataBase
    func addNewCard(card: Card, category: Category){
        guard let categoryId = category.categoryId else{return}
        card.category = category
        let childByAutoId = self.getCardsRef().childByAutoId()
        card.cardId = childByAutoId.key
        childByAutoId.setValue(card.intoJSON())
        //update the Categorie's cards
        DataBaseService.manager.retrieveCategory(from: categoryId, completion: { (categoryFromFireBase) in
            card.category = categoryFromFireBase
             //call the function that will updated the category on the dataBase
            DataBaseService.manager.updateCategory(for: categoryFromFireBase, errorHandler: {print($0)})
        }, errorHandler: {print($0)})
    }
    // this function will retrieve a card using a cardId
    func retrieveCard(from cardId: String, completion: @escaping(Card)->Void, errorHandler: @escaping(Error)->Void){
        let cardRef = self.getCardsRef().child(cardId)
        cardRef.observeSingleEvent(of: .value) { (snapshot) in
            if let jsonDict = snapshot.value as? [String:Any]{
                if let card = Card.init(from: jsonDict){
                    completion(card)
                }
            }else{
                errorHandler(UserDataBaseErrors.userDictError)
            }
        }
        
    }
}
