//
//  main.swift
//  FactoryMethod
//
//  Created by Tong Tian on 2018/6/14.
//  Copyright © 2018 TeetBox. All rights reserved.
//

import Foundation

print("Hello, World!")

/*  The Factory Method Pattern defines an interface for creating an object, but lets subclasses decide which class to instantiate. Factory Method lets a class defer instantiation to subclasses.
 */

protocol Pizza {
    var name: String { get }
    var price: Double { get }
    
    func prepare()
    func bake()
    func cut()
    func box()
}

extension Pizza {
    func prepare() {
        print("Preparing \(name)")
    }
    
    func bake() {
        print("Baking \(name)")
    }
    
    func cut() {
        print("Cuting \(name)")
    }
    
    func box() {
        print("Boxing \(name)")
    }
}

enum PizzaType {
    case cheese
    case meat
}

protocol PizzaFactory {
    func createPizza(type: PizzaType) -> Pizza
}

struct NYCheesePizza: Pizza {
    let name: String
    let price: Double
}

struct NYMeatPizza: Pizza {
    let name: String
    let price: Double
}

class NYPizzaFactory: PizzaFactory {
    func createPizza(type: PizzaType) -> Pizza {
        switch type {
        case .cheese:
            return NYCheesePizza(name: "NYCheesePizza", price: 19.9)
        case .meat:
            return NYMeatPizza(name: "NYMeatPizza", price: 19.9)
        }
        
    }
}

struct ChicagoCheesePizza: Pizza {
    let name: String
    let price: Double
}

struct ChicagoMeatPizza: Pizza {
    let name: String
    let price: Double
}

class ChicagoPizzaFactory: PizzaFactory {
    func createPizza(type: PizzaType) -> Pizza {
        switch type {
        case .cheese:
            return ChicagoCheesePizza(name: "ChicagoCheesePizza", price: 29.9)
        case .meat:
            return ChicagoMeatPizza(name: "ChicagoMeatPizza", price: 29.9)
        }
    }
}

protocol PizzaStore {
    init(factory: PizzaFactory)
    
    func orderPizza(type: PizzaType)
    func createPizza(type: PizzaType) -> Pizza
}

extension PizzaStore {
    func orderPizza(type: PizzaType) {
        let pizza = createPizza(type: type)
        pizza.prepare()
        pizza.bake()
        pizza.cut()
        pizza.box()
        print("Ready for: \(pizza.name), \(pizza.price)")
    }
}

class NYPizzaStore: PizzaStore {
    let factory: PizzaFactory
    
    required init(factory: PizzaFactory) {
        self.factory = factory
    }
    
    func createPizza(type: PizzaType) -> Pizza {
        return factory.createPizza(type: type)
    }
    
}

class ChicagoPizzaStore: PizzaStore {
    let factory: PizzaFactory
    
    required init(factory: PizzaFactory = ChicagoPizzaFactory()) {
        self.factory = factory
    }
    
    func createPizza(type: PizzaType) -> Pizza {
        return factory.createPizza(type: type)
    }
    
}

let nyPizzaStore = NYPizzaStore(factory: NYPizzaFactory())
nyPizzaStore.orderPizza(type: .cheese)

let chicagoPizzaStore = ChicagoPizzaStore()
chicagoPizzaStore.orderPizza(type: .meat)








