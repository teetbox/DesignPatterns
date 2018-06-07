//
//  main.swift
//  Decorator
//
//  Created by Tong Tian on 2018/6/7.
//  Copyright © 2018 TeetBox. All rights reserved.
//

import Foundation

print("Hello, World!")

/*  The Decorator Pattern attaches additional responsibilities to an object dynamically. Decorators provide a flexible alternative to subclassing for extending functionality.
 */

protocol Beverage {
    func getDescription() -> String
    func cost() -> Double
}

struct HouseBlend: Beverage {
    func getDescription() -> String {
        return "House Blend"
    }
    
    func cost() -> Double {
        return 1.9
    }
}

struct DarkRoast: Beverage {
    func getDescription() -> String {
        return "Dark Roast"
    }
    
    func cost() -> Double {
        return 1.9
    }
}

struct Espresso: Beverage {
    func getDescription() -> String {
        return "Espresso"
    }
    
    func cost() -> Double {
        return 1.9
    }
}

struct Decaf: Beverage {
    func getDescription() -> String {
        return "Decaf"
    }
    
    func cost() -> Double {
        return 1.9
    }
}

protocol CondimentDecorator: Beverage {
//    associatedtype T: Beverage
//    init(value: T)
}

struct Milk<T: Beverage>: CondimentDecorator {
    
    let beverage: Beverage
    
    init(value: T) {
        beverage = value
    }
    
    func getDescription() -> String {
        return beverage.getDescription() + ", Milk"
        
    }
    
    func cost() -> Double {
        let cost = beverage.cost() + 0.1
        return cost
    }
}

struct Mocha<T: Beverage>: CondimentDecorator {
    
    let beverage: Beverage
    
    init(value: T) {
        beverage = value
    }
    
    func getDescription() -> String {
        return beverage.getDescription() + ", Mocha"
        
    }
    
    func cost() -> Double {
        let cost = beverage.cost() + 0.2
        return cost
    }
}

struct Soy<T: Beverage>: CondimentDecorator {
    
    let beverage: Beverage
    
    init(value: T) {
        beverage = value
    }
    
    func getDescription() -> String {
        return beverage.getDescription() + ", Soy"
        
    }
    
    func cost() -> Double {
        let cost = beverage.cost() + 0.3
        return cost
    }
}

struct Whip: CondimentDecorator {
    
    let beverage: Beverage
    
    func getDescription() -> String {
        return beverage.getDescription() + ", Whip"
        
    }
    
    func cost() -> Double {
        let cost = beverage.cost() + 0.2
        return cost
    }
}

var espresso: Beverage = Espresso()
print(espresso.getDescription())
print(espresso.cost())

espresso = Whip(beverage: espresso)
print(espresso.getDescription())
print(espresso.cost())

