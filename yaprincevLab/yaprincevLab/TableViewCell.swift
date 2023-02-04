//
//  TableViewCell.swift
//  yaprincevLab
//
//  Created by Максим Япринцев on 03.02.2023.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet private weak var imageLabel: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var eyeImage: UIImageView!
    @IBOutlet private weak var visitorsCount: UILabel!
    
    
    // MARK: - Properties
    
    var imageUrl: String = "" {
        didSet {
            guard let url = URL(string: imageUrl) else {
                return
            }
                // willadd
        }
    }
    
    var title: String = "" {
        didSet {
            titleLabel.text = title
        }
    }
    
    var counter: String = "" {
        didSet {
            visitorsCount.text = counter
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        eyeImage.image = UIImage(named: "Eye")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}