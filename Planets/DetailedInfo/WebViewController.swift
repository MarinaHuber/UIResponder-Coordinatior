//
//  Copyright © 2020 Code Bohemia. All rights reserved.
//

import UIKit
import WebKit

final class WebViewController: UIViewController {
    
    // MARK: Managing the View
    
    @IBOutlet weak var webView: WKWebView!
    
    @IBAction func goToList(_ sender: Any) {
        scenePresenter?.presentPlanetList()
    }
    
    
    // MARK: Loading URLs
    
    func load(_ url: URL) {
        webView.load(URLRequest(url: url))
    }
}
