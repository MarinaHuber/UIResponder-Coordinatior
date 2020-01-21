//
//  Copyright © 2020 Code Bohemia. All rights reserved.
//

import UIKit
import Presentr

final class PlanetTableViewController: UITableViewController {
    
    // MARK: Creating the View
    
     let presenter: Presentr = {

        let bounds = UIScreen.main.bounds
        let height = ModalSize.fluid(percentage: 0.45)
        let width = ModalSize.fluid(percentage: 0.90)
        let center = ModalCenterPosition.customOrigin(origin: CGPoint(x: bounds.minX + 20, y: bounds.minY + 200))
        let customType = PresentationType.custom(width: width, height: height, center: center)
        let customPresenter = Presentr(presentationType: customType)
           customPresenter.transitionType = .coverVerticalFromTop
           customPresenter.dismissTransitionType = .coverVerticalFromTop
           customPresenter.backgroundColor = .lightGray
           customPresenter.roundCorners = true
           customPresenter.cornerRadius = 13
           customPresenter.backgroundOpacity = 0.4
           customPresenter.dismissOnSwipe = true
           customPresenter.dismissOnSwipeDirection = .top
           return customPresenter
       }()
    
    
    let planets: [Planet]
    
    init(planets: [Planet]) {
        self.planets = planets
        super.init(nibName: "PlanetTableViewController", bundle: .main)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: Managing the View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let leftBtn: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(openTabBar))
        navigationItem.rightBarButtonItem = leftBtn
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "PlanetCellIdentifier")
        
        let viewController = AlertVC()
        customPresentViewController(presenter, viewController: viewController, animated: true, completion: nil)
        
    }
    
    @objc func openTabBar() {
        scenePresenter?.presentTabBar()
    }
    
    // MARK: Table View Data Source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return planets.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlanetCellIdentifier", for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = planets[indexPath.row].name
        return cell
    }
    
    
    // MARK: Table View Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        scenePresenter?.presentDetailedInfo(for: planets[indexPath.row])
    }
}
