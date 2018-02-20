//
//  CreateNewCategoryView.swift
//  FlashCards
//
//  Created by C4Q on 2/19/18.
//  Copyright © 2018 QI. All rights reserved.
//

import UIKit

class CreateNewCategoryView: UIView {
    lazy var categoryTitleTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "ex, Science, Adventure, Space, under the sun"
        textField.layer.shadowOpacity = 0.1
        textField.layer.shadowOffset = CGSize(width: 2, height: 2)
        return textField
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupViews() {
        setupCategoryTitleTextField()
    }
    func setupCategoryTitleTextField(){
        addSubview(categoryTitleTextField)
        categoryTitleTextField.snp.makeConstraints { (constraint) in
            constraint.center.equalTo(snp.center)
            constraint.width.equalTo(snp.width).multipliedBy(0.85)
        }
    }
    
}
