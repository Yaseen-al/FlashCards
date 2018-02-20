//
//  DataBaseService+EndUser.swift
//  FlashCards
//
//  Created by C4Q on 2/15/18.
//  Copyright © 2018 QI. All rights reserved.
//

import Foundation
import Firebase
enum UserDataBaseErrors: Error{
    case userDictError
    case noSignedUser
    case categoryDictError
    case cardDictError
    case noCategoryId
    case categoryDataBaseError
}
extension DataBaseService{
    func retrieveEndUser(completion: @escaping (EndUser)->Void, errorHandler: @escaping (Error)->Void) {
        //this will make sure there is a signed in user and will handle it if there is no user signed in
        guard let user = AuthenticationService.manager.getCurrentUser() else{
            errorHandler(UserDataBaseErrors.noSignedUser)
            return
        }
        let endUsersRef = self.getUserRef().child(user.uid)
        endUsersRef.observeSingleEvent(of: .value) { (snapshot) in
            if let jsonDict = snapshot.value as? [String:Any]{
                if let endUser = EndUser(from: jsonDict){
                    completion(endUser)
                }
            }else{
                errorHandler(UserDataBaseErrors.userDictError)
            }
        }
    }
    //this function will update the user categories by accessing the user on the data base and seting the new values for it
    func updateEndUserCategories(endUser: EndUser, errorHandler: @escaping (Error)->Void){
        let endUsersRef = self.getUserRef().child(endUser.userId!)
        endUsersRef.setValue(endUser.intoJSON())
    }
}
