//
//  AccountViewController.swift
//  FlashCards
//
//  Created by C4Q on 2/19/18.
//  Copyright © 2018 QI. All rights reserved.
//

import UIKit
import SnapKit
import Firebase
class AccountViewController: UIViewController {
    let profileView = ProfileView()
    let signInView = SignInView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureViews()
    }
    func configureViews(){
            DataBaseService.manager.retrieveEndUser(completion: { (endUserFromFireBase) in
                self.setupProfileView(endUser: endUserFromFireBase, user: AuthenticationService.manager.getCurrentUser()!)
            }, errorHandler: { (error) in
                self.setupSignInView()
            })
    }
}
//MARK: sign in
extension AccountViewController: UITextFieldDelegate{
    func setupSignInView(){
        view.addSubview(signInView)
        signInView.snp.makeConstraints { (constraint) in
            constraint.edges.equalTo(self.view.safeAreaLayoutGuide.snp.edges)
        }
        self.signInView.createNewAccountButton.addTarget(self, action: #selector(createNewAccountAction(sender:)), for: .touchUpInside)
        self.signInView.submitButton.addTarget(self, action: #selector(submitAction(sender:)), for: .touchUpInside)
        self.signInView.emailTextField.delegate = self
        self.signInView.passwordTextField.delegate = self
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textField is entered")
        textField.resignFirstResponder()
        return true
    }
    //action for the submit button for signing in
    @objc func submitAction(sender: UIButton){
        guard let email = self.signInView.emailTextField.text, let password = self.signInView.passwordTextField.text else {
            print("Dev: email and password errror")
            let alertController = UIAlertController(title: "Please enter a valid email and password", message: nil, preferredStyle: .alert)
            let okAlertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertController.addAction(okAlertAction)
            present(alertController, animated: true, completion: nil)
            return
        }
        AuthenticationService.manager.signIn(email: email, password: password, completion: { (user) in
            //TODO remove the sign in view and add the profile view
            print("Sign in successful")
        self.signInView.removeFromSuperview()
            self.configureViews()
        }) { (error) in
            //
            print("sign in error \(error)")
            let alertController = UIAlertController(title: "There is an error with your sign in", message: "Please make sure you are connected to the interned or you have the righ access rights", preferredStyle: .alert)
            let okAlertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertController.addAction(okAlertAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    //action for create new account
    @objc func createNewAccountAction(sender: UIButton){
        let createNewAccountViewController = CreateAccountViewController()
        self.navigationController?.pushViewController(createNewAccountViewController, animated: true)
    }
}
//MARK: Profile 
extension AccountViewController{
    func setupProfileView(endUser: EndUser, user: User){
        view.addSubview(profileView)
        profileView.snp.makeConstraints { (constraint) in
            constraint.edges.equalTo(self.view.safeAreaLayoutGuide.snp.edges)
        }
        let signOutNavigationBarButton = UIBarButtonItem(title: "Sign Out", style: .done, target: self, action: #selector(signOutBarButtonAction(_:)))
        self.navigationItem.rightBarButtonItem  = signOutNavigationBarButton
        profileView.configureProfileView(from: endUser, user: user)
    }
    
    @objc func signOutBarButtonAction(_ sender: UIBarButtonItem){
        AuthenticationService.manager.signout { (error) in
            print("print error in signing out")
            return
        }
        self.signInView.removeFromSuperview()
        self.navigationItem.rightBarButtonItems = nil
        self.configureViews()
    }
}
