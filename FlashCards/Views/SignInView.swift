//
//  SignInView.swift
//  FlashCards
//
//  Created by C4Q on 2/19/18.
//  Copyright © 2018 QI. All rights reserved.
//

import UIKit

class SignInView: UIView {
    var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.isHidden = true
        return label
    }()
    
    var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your Email"
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.layer.shadowOpacity = 0.1
        textField.layer.shadowOffset = CGSize(width: 2, height: 2)
        textField.keyboardType = .emailAddress
        return textField
    }()
    
    var passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.isHidden = true
        return label
    }()
    
    var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your Password"
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.layer.shadowOpacity = 0.1
        textField.layer.shadowOffset = CGSize(width: 2, height: 2)
        textField.isSecureTextEntry = true
        return textField
    }()
    
    var forgotPasswordButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.setTitle("Forgot password?", for: .normal)
        return button
    }()
    
    var submitButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.setTitle("   Login   ", for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.shadowOpacity = 0.1
        button.layer.shadowOffset = CGSize(width: 2, height: 2)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        return button
    }()
    
    var createNewAccountButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.setTitle("Create new account", for: .normal)
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
        setupUserNameLabel()
        setupUserNameTextField()
        setupPasswordLabel()
        setupPasswordTextField()
        setupForgotPasswordButton()
        setupSubmitButton()
        setupCreateNewAccountButton()
    }
// MARK: - Setup Views
    private func setupContainerView() {
        addSubview(containerView)
        containerView.snp.makeConstraints { (constraint) in
            constraint.edges.equalTo(snp.edges)
        }
    }
    
    private func setupUserNameLabel() {
        containerView.addSubview(emailLabel)
        emailLabel.snp.makeConstraints { (constraint) in
            constraint.leading.equalTo(containerView.snp.leading).offset(16)
            constraint.top.equalTo(containerView.snp.top).offset(16)
            constraint.trailing.equalTo(containerView.snp.trailing).offset(-16)
        }
    }
    
    private func setupUserNameTextField() {
        containerView.addSubview(emailTextField)
        emailTextField.snp.makeConstraints { (constraint) in
            constraint.top.equalTo(emailLabel.snp.bottom).offset(4)
            constraint.leading.equalTo(emailLabel.snp.leading)
            constraint.width.equalTo(emailLabel.snp.width)
        }
    }
    
    private func setupPasswordLabel() {
        containerView.addSubview(passwordLabel)
        passwordLabel.snp.makeConstraints { (constraint) in
            constraint.top.equalTo(emailTextField.snp.bottom).offset(8)
            constraint.leading.equalTo(emailLabel.snp.leading)
            constraint.width.equalTo(emailLabel.snp.width)
        }
    }
    
    private func setupPasswordTextField() {
        containerView.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { (constraint) in
            constraint.top.equalTo(passwordLabel.snp.bottom).offset(4)
            constraint.leading.equalTo(emailLabel.snp.leading)
            constraint.width.equalTo(emailLabel.snp.width)
        }
    }
    
    private func setupForgotPasswordButton() {
        containerView.addSubview(forgotPasswordButton)
        forgotPasswordButton.snp.makeConstraints { (constraint) in
            constraint.top.equalTo(passwordTextField.snp.bottom).offset(2)
            constraint.leading.equalTo(emailLabel.snp.leading)
        }
    }
    
    private func setupSubmitButton() {
        containerView.addSubview(submitButton)
        submitButton.snp.makeConstraints { (constraint) in
            constraint.centerX.equalTo(containerView.snp.centerX)
            constraint.top.equalTo(forgotPasswordButton.snp.bottom).offset(40)
        }
    }
    
    private func setupCreateNewAccountButton() {
        containerView.addSubview(createNewAccountButton)
        createNewAccountButton.snp.makeConstraints { (constraint) in
            constraint.leading.equalTo(emailLabel.snp.leading)
            constraint.bottom.equalTo(containerView.snp.bottom).offset(-8)
        }
    }
    
    
}
