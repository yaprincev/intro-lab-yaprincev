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
    
    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let url = URL(string: article?.url ?? "") else { return }
        let request = URLRequest(url: url)
        webView.load(request)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
