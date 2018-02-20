//
//  CardView.swift
//  FlashCards
//
//  Created by C4Q on 2/19/18.
//  Copyright © 2018 QI. All rights reserved.
//

import UIKit

class CardView: UIView {
    lazy var cardFrontBody: UITextView = {
        let textView = UITextView()
        textView.tag = 1
        textView.layer.cornerRadius = 1
        textView.textColor = .gray
        textView.layer.shadowOpacity = 0.1
        textView.layer.cornerRadius = 5
        textView.backgroundColor = UIColor(displayP3Red: 238/255, green: 242/255, blue: 245/255, alpha: 1 )
        textView.layer.shadowOffset = CGSize(width: 2, height: 2)
        return textView
    }()
    lazy var cardBackBody: UITextView = {
        let textView = UITextView()
        textView.tag = 2
        textView.layer.cornerRadius = 1
        textView.isHidden = true
        textView.textColor = .gray
        textView.layer.shadowOpacity = 0.1
        textView.layer.cornerRadius = 5
        textView.backgroundColor = UIColor(displayP3Red: 238/255, green: 242/255, blue: 245/255, alpha: 1 )
        textView.layer.shadowOffset = CGSize(width: 2, height: 2)
        return textView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupViews() {
        setupCardFrontBody()
        setupCardBackBody()
    }
    private func setupCardFrontBody(){
        addSubview(cardFrontBody)
        cardFrontBody.snp.makeConstraints { (constraint) in
            constraint.centerX.equalTo(snp.centerX)
            constraint.top.equalTo(snp.top).offset(5)
            constraint.width.equalTo(snp.width).multipliedBy(0.90)
            constraint.height.equalTo(snp.height).multipliedBy(0.25)
        }
    }
    private func setupCardBackBody(){
        addSubview(cardBackBody)
        cardBackBody.snp.makeConstraints { (constraint) in
            constraint.centerX.equalTo(snp.centerX)
            constraint.top.equalTo(cardFrontBody.snp.bottom).offset(5)
            constraint.width.equalTo(snp.width).multipliedBy(0.90)
            constraint.height.equalTo(snp.height).multipliedBy(0.25)
        }
    }
    func configureView(from card: Card){
        self.cardBackBody.text = card.backBody
        cardFrontBody.text = card.frontBody
    }
    
}
