//
//  DataBaseService.swift
//  FlashCards
//
//  Created by C4Q on 2/13/18.
//  Copyright © 2018 QI. All rights reserved.
//

import Foundation
import FirebaseDatabase
class DataBaseService{
    static let manager = DataBaseService()
    var dbRef: DatabaseReference
    var userRef: DatabaseReference
    var categoryRef: DatabaseReference
    var cardsRef: DatabaseReference
    private init() {
        // reference to the root of the Firebase database
        dbRef = Database.database().reference()
        //Children reference of the dataBase
        userRef = dbRef.child("users")
        categoryRef = dbRef.child("categories")
        cardsRef = dbRef.child("cards")
    }
    func getDataBaseRef()->DatabaseReference{return dbRef}
    func getUserRef()->DatabaseReference{return userRef}
    func getCategoryRef()->DatabaseReference{return categoryRef}
    func getCardsRef()->DatabaseReference{return cardsRef}
 
}
