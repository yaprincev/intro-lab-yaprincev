//
//  News.swift
//  yaprincevLab
//
//  Created by Максим Япринцев on 04.02.2023.
//

import Foundation

struct News: Codable {
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable {
    let title: String
    let url: String
    let urlToImage: String
}



