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
enum AuthenticationServiceErrors: Error{
    case signInError
}
class AuthenticationService {
    private init(){}
    static let manager = AuthenticationService()
    //This function will get the current user
    func getCurrentUser()->User?{
        return Auth.auth().currentUser
    }
    //This function will create a new user
    func createUser(email: String, password: String, completion: @escaping (User)->Void, errorHandler: @escaping (Error)->Void){
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if let error = error{
                //TODO  handle the error
                print("Dev: ",error)
                errorHandler(error)
            }
            if let user = user{
                completion(user)
            }
        }
    }
    //this function will signn in using an email and password
    func signIn(email: String, password: String, completion: @escaping (User) -> Void, errorHandler: @escaping(Error)->Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if let error = error {
                print("Dev: \(error)")
                errorHandler(AuthenticationServiceErrors.signInError)
            } else if let user = user {
                completion(user)
            }
        }
    }
    //this function will sign the user out
    func signout(errorHandler: @escaping(Error)->Void) {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
            errorHandler(error)
        }
    }
    
}
