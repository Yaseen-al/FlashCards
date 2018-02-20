//
//  CreateNewCategoryViewController.swift
//  FlashCards
//
//  Created by C4Q on 2/19/18.
//  Copyright © 2018 QI. All rights reserved.
//

import UIKit

class CreateNewCategoryViewController: UIViewController {
    let createNewCategoryView = CreateNewCategoryView()
    var newCategoryTitle = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configNavBar()
        setupCreateNewCategoryView()
        // Do any additional setup after loading the view.
    }
    func configNavBar(){
        let createBarButtonItem = UIBarButtonItem(title: "Create", style: .done, target: self, action: #selector(createBarButtonItemAction(_:)))
        let logo = #imageLiteral(resourceName: "flashCard")
        let imageView = UIImageView(image:logo)
        navigationItem.rightBarButtonItem = createBarButtonItem
        imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = imageView
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "New Category"
    }
    @objc func createBarButtonItemAction(_ sender: UIBarButtonItem){
        guard let title = self.createNewCategoryView.categoryTitleTextField.text, self.createNewCategoryView.categoryTitleTextField.text != "" else{
            let alertController = UIAlertController(title: "Please enter a valid Category title", message: nil, preferredStyle: .alert)
            let okAlertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertController.addAction(okAlertAction)
            present(alertController, animated: true, completion: nil)
            return
        }
        
        guard let user = AuthenticationService.manager.getCurrentUser() else {
            return
        }
        let category = Category.init(title: title, user: user)
        DataBaseService.manager.addNewCategory(user: user, category: category)
        self.navigationController?.popToRootViewController(animated: true)
    }
    func setupCreateNewCategoryView(){
        view.addSubview(createNewCategoryView)
        createNewCategoryView.snp.makeConstraints { (constraint) in
            constraint.edges.equalTo(view.safeAreaLayoutGuide.snp.edges)
        }
        createNewCategoryView.categoryTitleTextField.delegate = self
    }
}
//TextField Delegate
extension CreateNewCategoryViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard textField.text != "", textField.text != " " else {
            let alertController = UIAlertController(title: "Please enter a valid Category title", message: nil, preferredStyle: .alert)
            let okAlertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertController.addAction(okAlertAction)
            present(alertController, animated: true, completion: nil)
            return false
        }
        self.newCategoryTitle = textField.text!
        textField.resignFirstResponder()
        return true
    }
    
    
}
