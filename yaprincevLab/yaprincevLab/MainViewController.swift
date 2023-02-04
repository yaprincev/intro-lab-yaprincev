//
//  MainViewController.swift
//  yaprincevLab
//
//  Created by Максим Япринцев on 03.02.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    let numberOfNews = 20
    let network = NetrworkManager()
    var dataSource = News(articles: [])
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureApperance()
        
        network.getNews { news in
            self.dataSource = news
            print(news.articles[1])
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        
        }
    }

}

private extension MainViewController {
    func configureApperance() {
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "\(TableViewCell.self)")
    }
}




extension MainViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(TableViewCell.self)", for: indexPath) as! TableViewCell
        cell.title = dataSource.articles[indexPath.row].title
        cell.imageUrl = dataSource.articles[indexPath.row].urlToImage
        return cell
    }
}

