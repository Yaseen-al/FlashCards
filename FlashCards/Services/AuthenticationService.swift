//
//  AuthenticationService.swift
//  FlashCards
//
//  Created by C4Q on 2/13/18.
//  Copyright © 2018 QI. All rights reserved.
//

import Foundation
import Firebase
import CoreData

class AuthenticationService {
    //This function will get the current user
    static func getCurrentUser()->User?{
        return Auth.auth().currentUser
    }
    //This function will create a new user
    static func createUser(email: String, password: String, completion: (User)->Void, errorHandler: (Error)->Void){
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if let error = error{
                //TODO  handle the error
            }
            if let user = user{
                //TODO handle the user
                let newEndUser = DataBaseService.manager.userRef.child(user.uid)
                let managedObjectContext = CoreDataHelper.manager.managedObject
                let endUser = EndUser(userName: "Sweedy", age: 12, nationality: "Hamayan", managedObjectContext: managedObjectContext)
                newEndUser.setValue(endUser.intoJSON())
            }
        }
    }
    
}
