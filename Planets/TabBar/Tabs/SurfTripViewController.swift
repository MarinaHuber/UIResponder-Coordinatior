//
//  BuyTipsViewController.swift
//  TradeMySurf
//
//  Created by Marina Huber on 10/5/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Foundation
import UIKit

class SurfTripViewController: UIViewController, Storyboarded {
    
    lazy var leftBtn: UIBarButtonItem = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "arrow.turn.up.left"), for: .normal)
        button.sizeToFit()
        button.addTarget(self,
                         action: #selector(self.popToRoot(_:)),
                         for: .touchUpInside)
        return UIBarButtonItem(customView: button)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = leftBtn

    }
 
    @objc func popToRoot(_ sender: UIBarButtonItem) {
        scenePresenter?.presentURL(URL(string: "https://en.wikipedia.org/wiki/Mercury_(planet)")!)
    }
}

