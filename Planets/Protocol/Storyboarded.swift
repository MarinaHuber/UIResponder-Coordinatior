//
//  Copyright © 2020 Code Bohemia. All rights reserved.
//

import UIKit

/// Object, that adopts this protocol, will use identifier that matches name of its class.
protocol Storyboarded: AnyObject {
    static func instantiate(from storyboard: UIStoryboard) -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate(from storyboard: UIStoryboard) -> Self {
        let nameSpaceClassName: String = NSStringFromClass(self)

        guard let className: String = nameSpaceClassName.components(separatedBy: ".").last else {
            fatalError("Cannot find class name from: " + nameSpaceClassName)
        }

        guard let viewController: Self = storyboard.instantiateViewController(withIdentifier: className) as? Self else {
            fatalError("Cannot find UIViewController with identifier: " + className)
        }

        return viewController
    }

}
