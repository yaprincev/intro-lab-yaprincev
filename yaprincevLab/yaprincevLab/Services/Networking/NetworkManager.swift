//
//  NetworkManager.swift
//  yaprincevLab
//
//  Created by Максим Япринцев on 04.02.2023.
//

import Foundation

class NetrworkManager {

    let sessionConfiguration = URLSessionConfiguration.default
    let decoder = JSONDecoder()
    let session = URLSession.shared

    func getNews(complition: @escaping(News) -> Void) {
       guard let url = URL(string: "https://newsapi.org/v2/everything?q=bitcoin&apiKey=991f987ca0904ab1bb3fd42bb5106383") else { return }
        session.dataTask(with: url) { data, response, error in
            if error != nil {
                print("Error \(error!.localizedDescription)")
                return
            }
            if let newsData = data {
                guard let news = try? self.decoder.decode(News.self, from: newsData) else {
                    return
                }

                complition(news)

                return

            }
            return

        }.resume()

    }

    
}

