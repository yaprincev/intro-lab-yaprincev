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
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureApperance()
        
        network.getNews { news in
            print(news.articles.count)
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
        return numberOfNews
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(TableViewCell.self)", for: indexPath)
        
        return cell
    }
}

