//
//  News.swift
//  yaprincevLab
//
//  Created by Максим Япринцев on 04.02.2023.
//

import Foundation

struct News: Codable {
    var articles: [Article]
}

// MARK: - Article
struct Article: Codable {
    let title: String
    let url: String
    let urlToImage: String?
    let description: String
    let source: Source
    let publishedAt: String
    
   
}

struct Source: Codable {
    let id: ID?
    let name: String
}

enum ID: String, Codable {
    case businessInsider = "business-insider"
    case reuters = "reuters"
}



