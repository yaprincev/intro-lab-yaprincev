//
//  WebViewController.swift
//  yaprincevLab
//
//  Created by Максим Япринцев on 05.02.2023.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    
    var article: Article?
    
    // MARK: - Views
    
    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let url = URL(string: article?.url ?? "") else { return }
        let request = URLRequest(url: url)
        webView.load(request)
    }

}
