//
//  CardViewController.swift
//  FlashCards
//
//  Created by C4Q on 2/19/18.
//  Copyright © 2018 QI. All rights reserved.
//

import UIKit
class CardViewController: UIViewController {
    var card: Card
    init(card: Card) {
        self.card = card
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    let cardView = CardView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupCardView()
        configNavBar()
    }
    func configNavBar(){
        let revealBarButtonItem = UIBarButtonItem(title: "Reveal", style: .done, target: self, action: #selector(revealBarButtonItem(_:)))
        let logo = #imageLiteral(resourceName: "flashCard")
        let imageView = UIImageView(image:logo)
        navigationItem.rightBarButtonItem = revealBarButtonItem
        imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = imageView
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = card.cardTitle
    }
    @objc func revealBarButtonItem(_ selector: UIBarButtonItem){
        self.cardView.cardBackBody.alpha = 0
        self.cardView.cardBackBody.isHidden = false
        UIView.animate(withDuration: 2.0, delay: 0.3, options: [.transitionCurlUp], animations: {
               self.cardView.cardBackBody.alpha = 1
        }, completion: nil)
        
    }
    func setupCardView(){
        view.addSubview(cardView)
        cardView.snp.makeConstraints { (cosntraint) in
            cosntraint.edges.equalTo(view.safeAreaLayoutGuide.snp.edges)
        }
        cardView.configureView(from: card)
    }

}
