//
//  UIImageView+ImageLoader.swift
//  yaprincevLab
//
//  Created by Максим Япринцев on 04.02.2023.
//

import Foundation
import UIKit

extension UIImageView {

    func loadImage(from url: URL) {
        ImageLoader().loadImage(from: url) { [weak self] result in
            if case let .success(image) = result {
                DispatchQueue.main.async {
                    self?.image = image
                }
            }
        }
    }
}
