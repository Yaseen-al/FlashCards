//
//  CreateAccountViewController.swift
//  FlashCards
//
//  Created by C4Q on 2/19/18.
//  Copyright © 2018 QI. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {
    let createNewAccountView = CreateNewAccountView()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCreateNewAccountView()
    }
    func setupCreateNewAccountView(){
        view.addSubview(createNewAccountView)
        createNewAccountView.snp.makeConstraints { (constraint) in
            constraint.edges.equalTo(view.safeAreaLayoutGuide.snp.edges)
        }
        self.createNewAccountView.userNameTextField.delegate = self
        self.createNewAccountView.emailTextField.delegate = self
        self.createNewAccountView.passwordTextField.delegate = self
        self.createNewAccountView.confirmPasswordTextField.delegate = self
        self.createNewAccountView.submitButton.addTarget(self, action: #selector(submitButtonAction(_:)), for: .touchUpInside)
    }
    //this function is to submit the new created user
    @objc func submitButtonAction(_ sender: UIButton){
        guard let userName = self.createNewAccountView.userNameTextField.text, let userEmail =   self.createNewAccountView.emailTextField.text, let password = self.createNewAccountView.passwordTextField.text, let confirmPass = self.createNewAccountView.confirmPasswordTextField.text else {
            print("Dev: textFields error")
            let alertController = UIAlertController(title: "Please enter a valid email, password, and userName", message: nil, preferredStyle: .alert)
            let okAlertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertController.addAction(okAlertAction)
            present(alertController, animated: true, completion: nil)
            return
        }
        guard password == confirmPass else {
            print("Dev: confirm Password error")
            let alertController = UIAlertController(title: "Please make sure the password and confirm Password are the same", message: nil, preferredStyle: .alert)
            let okAlertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertController.addAction(okAlertAction)
            present(alertController, animated: true, completion: nil)
            return
        }
        AuthenticationService.manager.createUser(email: userEmail, password: password, completion: { (user) in
            print("Dev: succesfully Created an account")
            //this will create a new EndUser and add it to the dataBase
            let endUser = EndUser(userName: userName, age: 21, nationality: "Sweeedy", userId: user.uid)
            let newEndUser = DataBaseService.manager.userRef.child(user.uid)
            newEndUser.setValue(endUser.intoJSON())
        }) { (error) in
            print("Dev: error creating an account\(error)")
        }
    }
    
}
extension CreateAccountViewController: UITextFieldDelegate{
    
    
}
