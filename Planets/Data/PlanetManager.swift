//
//  Copyright © 2020 Code Bohemia. All rights reserved.
//

import Foundation

final class PlanetManager {
    
    let planets: [Planet]
    
    init() {
        planets = [
            Planet(name: "Mercury", url: URL(string: "https://en.wikipedia.org/wiki/Mercury_(planet)")!),
            Planet(name: "Venus", url: URL(string: "https://en.wikipedia.org/wiki/Venus")!),
            Planet(name: "Earth", url: URL(string: "https://en.wikipedia.org/wiki/Earth")!),
            Planet(name: "Mars", url: URL(string: "https://en.wikipedia.org/wiki/Mars")!),
            Planet(name: "Jupiter", url: URL(string: "https://en.wikipedia.org/wiki/Jupiter")!),
            Planet(name: "Saturn", url: URL(string: "https://en.wikipedia.org/wiki/Saturn")!),
            Planet(name: "Uranus", url: URL(string: "https://en.wikipedia.org/wiki/Uranus")!),
            Planet(name: "Neptune", url: URL(string: "https://en.wikipedia.org/wiki/Neptune")!)
        ]
    }
}

struct Planet {
    let name: String
    let url: URL
}
