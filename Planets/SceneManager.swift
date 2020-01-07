//
//  Copyright © 2020 Code Bohemia. All rights reserved.
//

import UIKit

final class SceneManager: UIResponder, ScenePresenting {
    
    // MARK: Creating the Scene Manager
    
    let window: UIWindow
    
    
    init(window: UIWindow) {
        self.window = window
    }
    
    
    
    
    
    // MARK: Managing the Dependencies
    
    private let dependencies = DependencyStore()
    
    
    // MARK: Presenting Scenes
    
    @IBAction func presentPlanetList() {
        let planets = dependencies.planetManager.planets
        let listViewController = PlanetTableViewController(planets: planets)
        let navigationController = UINavigationController(rootViewController: listViewController)
        window.rootViewController = navigationController
    }
    
    func presentURL(_ url: URL) {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "webview") as? WebViewController else { fatalError() }
        window.rootViewController?.dismiss(animated: true, completion: nil)
        window.rootViewController?.present(viewController, animated: true, completion: nil)
        viewController.load(url)
    }
    
    func presentDetailedInfo(for planet: Planet) {
        let viewController = DetailedPlanetViewController(planet: planet)
        guard let navigationController = window.rootViewController as? UINavigationController else { fatalError() }
        navigationController.pushViewController(viewController, animated: true)
    }
    func presentTabBar() {
        let viewController = TabBarViewController()
        guard let navigationController = window.rootViewController as? UINavigationController else { fatalError() }
        ///removes the double nav bar
        navigationController.setNavigationBarHidden(true, animated: true)
        navigationController.pushViewController(viewController, animated: true)
    }

}

fileprivate final class DependencyStore {
    lazy var planetManager = PlanetManager()
}
