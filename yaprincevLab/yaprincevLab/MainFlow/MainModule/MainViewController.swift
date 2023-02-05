//
//  MainViewController.swift
//  yaprincevLab
//
//  Created by Максим Япринцев on 03.02.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Private properties
    
    private let numberOfNews = 20
    private let network = NetrworkManager()
    private var dataSource = News(articles: [])
    private var counterOfViews = [Int](repeating: 0, count: 20)
    
    // MARK: - Views
    
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureApperance()
        
        network.getNews { news in
            self.dataSource = news
            print(self.dataSource.articles.count)
            self.dataSource.articles.removeSubrange(self.numberOfNews...)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

}

// MARK: - Private Methods

private extension MainViewController {
    func configureApperance() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "\(TableViewCell.self)")
    }
    

    
}


// MARK: - TableView

extension MainViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(TableViewCell.self)", for: indexPath) as! TableViewCell
        cell.title = dataSource.articles[indexPath.row].title
        if dataSource.articles[indexPath.row].urlToImage != nil {
            cell.imageUrl = dataSource.articles[indexPath.row].urlToImage!
        } else {
             cell.imageUrl = "nil"
        }
        cell.counter = counterOfViews[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        counterOfViews[indexPath.row] += 1
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        let article = dataSource.articles[indexPath.row]
        let deVC = DetailViewController()
        deVC.article = article
        show(deVC, sender: article)
    }
    
    
}

