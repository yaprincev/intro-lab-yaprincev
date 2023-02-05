//
//  DetailViewController.swift
//  yaprincevLab
//
//  Created by Максим Япринцев on 05.02.2023.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var describtionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var sourceLabel: UIButton!
    
    var article: Article?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = article?.title
        
        if article?.urlToImage != nil {
            let url = URL(string: article?.urlToImage! ?? " ")
            newsImage.loadImage(from: url!)
        } else {
            newsImage.image = UIImage(named: "Black")
        }
        
        describtionLabel.text = article?.description
        
        dateLabel.text = dateFormatter(date: article?.publishedAt)
        configureApperance()
    }
    
    @IBAction func sourceAction(_ sender: Any) {
        let destVC = WebViewController()
        destVC.article = article
        show(destVC, sender: article)
    }
    
}
private extension DetailViewController {
    func configureApperance() {
        sourceLabel.titleLabel?.text = "Source"
        titleLabel.font = UIFont(name:"System Bold" , size: 20)
        describtionLabel.font = UIFont(name:"System" , size: 15)
    }
    func dateFormatter(date: String?) -> String{
        if date == nil {
            return ""
        }
        var newDateString = ""
        for i in date! {
            if i == "T" {
                break
            }
            newDateString.append(i)
        }
        return newDateString
    }


}
