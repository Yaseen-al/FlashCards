//
//  CreateNewCardViewController.swift
//  FlashCards
//
//  Created by C4Q on 2/19/18.
//  Copyright © 2018 QI. All rights reserved.
//

import UIKit

class CreateNewCardViewController: UIViewController {
    let createNewCardView = CreateNewCardView()
    var category: Category
    var cardTitle = ""
    var cardFrontBody = ""
    var cardBackBody = ""
    
    init(category: Category) {
        self.category = category
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupCreateCardView()
        configNavBar()
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
        navigationItem.title = "New Card"
    }
    @objc func createBarButtonItemAction(_ sender: UIBarButtonItem){
        guard let backBody = self.createNewCardView.cardBackBody.text, let frontBody = self.createNewCardView.cardFrontBody.text, self.createNewCardView.cardBackBody.text != "", self.createNewCardView.cardBackBody.text != "Back text: ex, the third note is a major third and has the perfect fifth", self.createNewCardView.cardFrontBody.text != "", self.createNewCardView.cardFrontBody.text != "Front text: ex, what is the relation between the root note and the third and fith in a major scale", cardTitle != "" else{
            let alertController = UIAlertController(title: "Please enter a valid Card title, front body and back body", message: nil, preferredStyle: .alert)
            let okAlertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertController.addAction(okAlertAction)
            present(alertController, animated: true, completion: nil)
            return
        }
        let newCard = Card(backBody: backBody, backImageURL: "not yet", categoryUID: self.category.categoryId!, frontBody: frontBody, frontImage: "not yet", title: self.cardTitle, cardId: "cardId")
        DataBaseService.manager.addNewCard(card: newCard, category: category)
        navigationController?.popViewController(animated: true)
    }
    func setupCreateCardView(){
        view.addSubview(createNewCardView)
        createNewCardView.snp.makeConstraints { (constraint) in
            constraint.edges.equalTo(view.safeAreaLayoutGuide.snp.edges)
        }
        self.createNewCardView.cardFrontBody.delegate = self
        self.createNewCardView.cardBackBody.delegate = self
        self.createNewCardView.cardTitle.delegate = self
    }
}

//textField delegate
extension CreateNewCardViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard textField.text != "", textField.text != " " else {
            let alertController = UIAlertController(title: "Please enter a valid Category title", message: nil, preferredStyle: .alert)
            let okAlertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertController.addAction(okAlertAction)
            present(alertController, animated: true, completion: nil)
            return false
        }
        self.cardTitle = textField.text!
        textField.resignFirstResponder()
        return true
    }
}

//textView delegate
extension CreateNewCardViewController: UITextViewDelegate{
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.tag == 1{
            if textView.text == "Front text: ex, what is the relation between the root note and the third and fith in a major scale"{
                textView.text = ""
                textView.textColor = .black
            }
            guard let text = textView.text else{
                return
            }
            self.cardFrontBody = text
        }
        if textView.tag == 2{
            if textView.text == "Back text: ex, the third note is a major third and has the perfect fifth"{
                textView.text = ""
                textView.textColor = .black
            }
            guard let text = textView.text else{
                return
            }
            self.cardBackBody = text
        }
        
    }
    func textViewDidBeginEditing(_ textView: UITextView)
    {
        if textView.tag == 1{
            if textView.text == "Front text: ex, what is the relation between the root note and the third and fith in a major scale"{
                textView.text = ""
                textView.textColor = .black
            }
        }
        if textView.tag == 2{
            if textView.text == "Back text: ex, the third note is a major third and has the perfect fifth"{
                textView.text = ""
                textView.textColor = .black
            }
        }
        textView.becomeFirstResponder() //Optional
    }
//    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
//        if (textView.text == "")
//        {
//            textView.text = "Add a tip, e.g: Best Tacos in town"
//            textView.textColor = .lightGray
//        }
//        textView.resignFirstResponder()
//        return true
//    }
}










