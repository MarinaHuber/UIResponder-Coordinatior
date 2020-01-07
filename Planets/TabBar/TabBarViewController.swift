//
//  TabBarViewController.swift
//  Planets
//
//  Created by Marina Huber on 1/7/20.
//  Copyright © 2020 Augmented Code. All rights reserved.
//

import UIKit

/*
 ///GET TOP VIEWCONTROLLER https://stackoverflow.com/questions/6131205/how-to-find-topmost-view-controller-on-ios
*/

final class TabBarViewController: UITabBarController {
    
    
    // MARK: Managing the TabBar
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabBar()
        self.selectedIndex = 1

    }
    private func setUpTabBar() {
        let storyboard: UIStoryboard = UIStoryboard(name: "SavedTripsViewController", bundle: nil)
        let saveVC: SavedTripsViewController = SavedTripsViewController.instantiate(from: storyboard)
        saveVC.title = "Saved"
        let storyboardSurf: UIStoryboard = UIStoryboard(name: "SurfTripViewController", bundle: nil)
        let recommendVC: SurfTripViewController = SurfTripViewController.instantiate(from: storyboardSurf)
        recommendVC.title = "Recommend"
        recommendVC.view.backgroundColor = .blue
        let storyboardPrice: UIStoryboard = UIStoryboard(name: "PriceCalculatorViewController", bundle: nil)
        let priceVC: PriceCalculatorViewController = PriceCalculatorViewController.instantiate(from: storyboardPrice)
        priceVC.title = "History"
        priceVC.view.backgroundColor = .cyan
        saveVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        recommendVC.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 1)
        priceVC.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 2)
        let controllers = [saveVC, recommendVC, priceVC]
        self.viewControllers = controllers.map { UINavigationController(rootViewController: $0)}
        
    }
}


