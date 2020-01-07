//
//  Copyright © 2020 Code Bohemia. All rights reserved.
//

import UIKit

final class DetailedPlanetViewController: UIViewController {

    // MARK: Creating the View
    
    let planet: Planet
    
    init(planet: Planet) {
        self.planet = planet
        super.init(nibName: "DetailedPlanetViewController", bundle: .main)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: Managing the View
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = planet.name
    }
    
    @IBAction func show(_ sender: Any) {
        scenePresenter?.presentURL(planet.url)
    }
}
