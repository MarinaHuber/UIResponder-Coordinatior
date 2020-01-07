//
//  Copyright © 2020 Code Bohemia. All rights reserved.
//

import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {

    private var sceneManager: SceneManager? = nil
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        guard let window = window else { fatalError() }
        sceneManager = SceneManager(window: window)
        return true
    }
    
    override var next: UIResponder? {
        return sceneManager
    }
}
