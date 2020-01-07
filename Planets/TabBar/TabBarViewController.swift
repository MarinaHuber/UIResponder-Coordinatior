//
//  TabBarViewController.swift
//  Planets
//
//  Created by Marina Huber on 1/7/20.
//  Copyright © 2020 Augmented Code. All rights reserved.
//

import UIKit

final class TabBarViewController: UITabBarController {
    
    // MARK: Managing the TabBar
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let saveVC = SavedTripsViewController()
        saveVC.title = "Saved"
        saveVC.view.backgroundColor = .orange
        let recommendVC = SurfTripViewController()
        recommendVC.title = "Recommend"
        recommendVC.view.backgroundColor = .blue
        let priceVC = PriceCalculatorViewController()
        priceVC.title = "History"
        priceVC.view.backgroundColor = .cyan
        
        saveVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        recommendVC.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 1)
        priceVC.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 2)
        let controllers = [saveVC, recommendVC, priceVC]
        self.viewControllers = controllers.map { UINavigationController(rootViewController: $0)}
    }
}
