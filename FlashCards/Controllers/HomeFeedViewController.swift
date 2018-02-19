//
//  HomeFeedViewController.swift
//  FlashCards
//
//  Created by C4Q on 2/18/18.
//  Copyright © 2018 QI. All rights reserved.
//

import UIKit

class HomeFeedViewController: UIViewController {
    var categories = [Category](){
        didSet{
            self.homeFeedView.tableView.reloadData()
        }
    }
    let homeFeedView = HomeFeedView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        setupHomeFeedView()
        configNavBar()
        laodAllCategories()
    }
    func configNavBar(){
        let addPostNavBarButtonItem = UIBarButtonItem(title: "New Category", style: .done, target: self, action: nil)
        let logo = #imageLiteral(resourceName: "flashCard")
        let imageView = UIImageView(image:logo)
        imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = imageView
        navigationItem.rightBarButtonItems = [addPostNavBarButtonItem]
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Flash Cards"
    }
    
    func setupHomeFeedView(){
        view.addSubview(homeFeedView)
        homeFeedView.snp.makeConstraints { (constraint) in
            constraint.edges.equalTo(view.snp.edges)
        }
        homeFeedView.tableView.dataSource = self
        homeFeedView.tableView.delegate = self
    }
    func laodAllCategories(){
        DataBaseService.manager.retrieveAllCategories(completion: { [weak self](categoriesFromFireBase) in
            self?.categories =  categoriesFromFireBase
        }) { (error) in
            print("Dev: error loading Categories \(error)")
        }
    }

}


//MARK: TablView DataSource
extension HomeFeedViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let categorySetup = categories[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "customTableViewCell") else{
            return UITableViewCell()
        }
        cell.textLabel?.text = categorySetup.title
        return cell
    }
    
    
}
//MARK: TablView Delegate
extension HomeFeedViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let categorySetup = categories[indexPath.row]
        let categoryCardsViewController = CategoryCardsViewController(category: categorySetup)
        self.navigationController?.pushViewController(categoryCardsViewController, animated: true)
    }
}






