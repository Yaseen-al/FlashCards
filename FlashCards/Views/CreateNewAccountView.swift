//
//  CreateNewAccountView.swift
//  FlashCards
//
//  Created by C4Q on 2/19/18.
//  Copyright © 2018 QI. All rights reserved.
//

import UIKit

class CreateNewAccountView: UIView {
    let padding = 20
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    ///Labels
    lazy var userErrorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.text = "  "
        label.isHidden = true
        return label
    }()
    lazy var emailErrorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.text = "  "
        label.isHidden = true
        return label
    }()
    lazy var invalidPasswordLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.text = "  "
        label.isHidden = true
        return label
    }()
    lazy var invalidConfirmLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.text = "  "
        label.isHidden = true
        return label
    }()
    
    ///TextFields
    lazy var userNameTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.placeholder = "Username"
        tf.layer.shadowOpacity = 0.8
        tf.layer.shadowOffset = CGSize(width: 2, height: 2)
        return tf
    }()
    lazy var emailTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.placeholder = "Email"
        tf.layer.shadowOpacity = 0.8
        tf.layer.shadowOffset = CGSize(width: 2, height: 2)
        tf.keyboardType = .emailAddress
        return tf
    }()
    lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.placeholder = "Password"
        tf.layer.shadowOpacity = 0.8
        tf.layer.shadowOffset = CGSize(width: 2, height: 2)
        tf.isSecureTextEntry = true
        return tf
    }()
    lazy var confirmPasswordTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.placeholder = "Confirm Password"
        tf.layer.shadowOpacity = 0.8
        tf.layer.shadowOffset = CGSize(width: 2, height: 2)
        tf.isSecureTextEntry = true
        return tf
    }()
    
    var submitButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.setTitle("   Submit   ", for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.8
        button.layer.shadowOffset = CGSize(width: 2, height: 2)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        setupViews()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupViews() {
        setupContainerView()
        setupUserNameTextField()
        setupErrorLabel()
        setupEmailTextField()
        setupeEmailErrorLabel()
        setupPassowordTextField()
        setupInvalidPasswordLabel()
        setupConfirmPasswordTextField()
        setupInvalidConfirmLabel()
        setupSubmitButton()
    }
    func setupContainerView(){
        addSubview(containerView)
        containerView.snp.makeConstraints { (constraint) in
            constraint.edges.equalTo(snp.edges)
        }
    }
    func setupUserNameTextField(){
        addSubview(userNameTextField)
        userNameTextField.snp.makeConstraints { (constraint) in
            constraint.top.equalTo(containerView).offset(padding + 10)
            constraint.centerX.equalTo(containerView)
            constraint.width.equalTo(containerView).multipliedBy(0.8)
        }
    }
    func setupErrorLabel(){
        addSubview(userErrorLabel)
        userErrorLabel.snp.makeConstraints { (constraint) in
            constraint.top.equalTo(userNameTextField.snp.bottom).offset(padding)
            constraint.centerX.equalTo(containerView)
        }
    }
    func setupEmailTextField(){
        addSubview(emailTextField)
        emailTextField.snp.makeConstraints { (constraint) in
            constraint.top.equalTo(userErrorLabel.snp.bottom).offset(padding - 10)
            constraint.centerX.equalTo(containerView)
            constraint.width.equalTo(userNameTextField)
        }
    }
    func setupeEmailErrorLabel(){
        addSubview(emailErrorLabel)
        emailErrorLabel.snp.makeConstraints { (constraint) in
            constraint.top.equalTo(emailTextField.snp.bottom).offset(padding)
            constraint.centerX.equalTo(containerView)
        }
    }
    func setupPassowordTextField(){
        addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { (constraint) in
            constraint.top.equalTo(emailErrorLabel.snp.bottom).offset(padding - 10)
            constraint.centerX.equalTo(containerView)
            constraint.width.equalTo(emailTextField)
        }
    }
    func setupInvalidPasswordLabel(){
        addSubview(invalidPasswordLabel)
        invalidPasswordLabel.snp.makeConstraints { (constraint) in
            constraint.top.equalTo(passwordTextField.snp.bottom).offset(padding)
            constraint.centerX.equalTo(containerView)
        }
    }
    func setupConfirmPasswordTextField() {
        addSubview(confirmPasswordTextField)
        confirmPasswordTextField.snp.makeConstraints { (constraint) in
            constraint.top.equalTo(invalidPasswordLabel.snp.bottom).offset(padding - 10)
            constraint.centerX.equalTo(containerView)
            constraint.width.equalTo(emailTextField)
        }
    }
    func setupInvalidConfirmLabel(){
        addSubview(invalidConfirmLabel)
        invalidConfirmLabel.snp.makeConstraints { (constraint) in
            constraint.top.equalTo(confirmPasswordTextField.snp.bottom).offset(padding - 10)
            constraint.centerX.equalTo(containerView)
        }
    }
    func setupSubmitButton(){
        addSubview(submitButton)
        submitButton.snp.makeConstraints { (constraint) in
            constraint.centerX.equalTo(containerView)
            constraint.top.equalTo(invalidConfirmLabel.snp.bottom).offset(padding + 20)
        }
    }
    
    
}

