//
//  MainViewController.swift
//  yaprincevLab
//
//  Created by Максим Япринцев on 03.02.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    let idCell = "CellID"

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
    }

}

extension MainViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell(style: .default, reuseIdentifier: idCell)
        return cell
    }
}
