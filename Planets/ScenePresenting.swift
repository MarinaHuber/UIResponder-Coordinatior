//
//  ScenePresenting.swift
//  Planets
//
//  Created by Toomas Vahter on 03/05/2018.
//  Copyright © 2018 Augmented Code. All rights reserved.
//

import UIKit

protocol ScenePresenting {
    func presentDetailedInfo(for planet: Planet)
    func presentPlanetList()
    func presentURL(_ url: URL)
    func presentTabBar()
}
/* Assert for OBOE https://learnappmaking.com/off-by-one-errors-swift-programming/?utm_source=drip&utm_medium=email&utm_campaign=Off-by-one+errors+in+Swift
*/
extension UIResponder {
    var scenePresenter: ScenePresenting? {
        var current: UIResponder? = self
        repeat {
            if let presenter = current as? ScenePresenting {
                return presenter
            }
            current = current?.next
        } while current != nil
        
        return nil
    }
}
