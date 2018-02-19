//
//  CategoryCardsViewController.swift
//  FlashCards
//
//  Created by C4Q on 2/19/18.
//  Copyright © 2018 QI. All rights reserved.
//

import UIKit

class CategoryCardsViewController: UIViewController {
    var category: Category
    var categoryCards = [Card](){
        didSet{
            self.categoryCardsView.tableView.reloadData()
        }
    }
    let categoryCardsView = CategoryCardsView()
    init(category: Category) {
        self.category = category
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        configNavBar()
        setupCategoryCardsView()
        loadCategoryCards()
    }
    func setupCategoryCardsView(){
        view.addSubview(categoryCardsView)
        categoryCardsView.snp.makeConstraints { (constraint) in
            constraint.edges.equalTo(view.snp.edges)
        }
        categoryCardsView.tableView.dataSource = self
        categoryCardsView.tableView.delegate = self
    }
    func configNavBar(){
        let addPostNavBarButtonItem = UIBarButtonItem(title: "New Card", style: .done, target: self, action: nil)
        let logo = #imageLiteral(resourceName: "flashCard")
        let imageView = UIImageView(image:logo)
        imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = imageView
        navigationItem.rightBarButtonItems = [addPostNavBarButtonItem]
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = self.category.title
    }
    func loadCategoryCards() {
        DataBaseService.manager.retrieveCategory(from: self.category.categoryId!, completion: { (category) in
            guard let categoryCards = category.cards else {
                return
            }
            for card in categoryCards{
                let cardConversion = card as! Card
                self.categoryCards.append(cardConversion)
            }
        }) { (error) in
            print(error)
        }
    }

    
}

//MARK: TablView DataSource
extension CategoryCardsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryCards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cardSetup = categoryCards[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "customTableViewCell") else{
            return UITableViewCell()
        }
        cell.textLabel?.text = cardSetup.cardTitle
        return cell
    }
    


}
//MARK: TablView Delegate
extension CategoryCardsViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}
