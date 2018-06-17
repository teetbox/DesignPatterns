//
//  main.swift
//  AbstractFactory
//
//  Created by Tong Tian on 2018/6/15.
//  Copyright © 2018 TeetBox. All rights reserved.
//

import Foundation

print("Hello, World!")

/*  The Abstract Factory Pattern provides an interface for creating families of related or dependent objects without specifying their concrete classes.
 */

protocol Pizza {
    var name: String { get }
    var price: Double { get }
    
    var dough: Dough? { get }
    var sauce: Sauce? { get }
    var cheese: Cheese? { get }
    var veggies: [Veggie]? { get }
    
    var ingredientFactory: PizzaIngredientFactory { get }
    
    mutating func prepare()
    func bake()
    func cut()
    func box()
}

protocol Dough {}
protocol Sauce {}
protocol Cheese {}
protocol Veggie {}

protocol PizzaIngredientFactory {
    var factoryName: String { get }
    func createDough() -> Dough
    func createSauce() -> Sauce
    func createCheese() -> Cheese
    func createVeggies() -> [Veggie]
}

struct ThinCrustDough: Dough {}
struct MarinaraSauce: Sauce {}
struct ReggianoCheese: Cheese {}
struct Gralic: Veggie {}
struct Onion: Veggie {}
struct Mushroom: Veggie {}
struct RedPepper: Veggie {}

struct NYPizzaIngredientFactory: PizzaIngredientFactory {
    let factoryName: String = "NY"
    
    func createDough() -> Dough {
        return ThinCrustDough()
    }
    
    func createSauce() -> Sauce {
        return MarinaraSauce()
    }
    
    func createCheese() -> Cheese {
        return ReggianoCheese()
    }
    
    func createVeggies() -> [Veggie] {
        return [Mushroom(), RedPepper(), Onion()]
    }
}

struct ChicagoPizzaIngredientFactory: PizzaIngredientFactory {
    let factoryName: String = "Chicago"
    
    func createDough() -> Dough {
        return ThinCrustDough()
    }
    
    func createSauce() -> Sauce {
        return MarinaraSauce()
    }
    
    func createCheese() -> Cheese {
        return ReggianoCheese()
    }
    
    func createVeggies() -> [Veggie] {
        return [Mushroom(), RedPepper(), Gralic()]
    }
}

extension Pizza {
    
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
    var ingredientFactory: PizzaIngredientFactory { get }
    init(ingredientFactory: PizzaIngredientFactory)
    
    func createPizza(type: PizzaType) -> Pizza
}

struct CheesePizza: Pizza {
    let name: String
    let price: Double
    let ingredientFactory: PizzaIngredientFactory
    
    var dough: Dough?
    var sauce: Sauce?
    var cheese: Cheese?
    var veggies: [Veggie]?
    
    init(ingredientFactory: PizzaIngredientFactory) {
        self.ingredientFactory = ingredientFactory
        self.name = ingredientFactory.factoryName + " Cheese Pizza"
        self.price = 19.9
    }
    
    mutating func prepare() {
        print("Preparing \(name)")
        dough = ingredientFactory.createDough()
        sauce = ingredientFactory.createSauce()
        cheese = ingredientFactory.createCheese()
        veggies = ingredientFactory.createVeggies()
    }
}

struct MeatPizza: Pizza {
    let name: String
    let price: Double
    let ingredientFactory: PizzaIngredientFactory
    
    var dough: Dough?
    var sauce: Sauce?
    var cheese: Cheese?
    var veggies: [Veggie]?
    
    init(ingredientFactory: PizzaIngredientFactory) {
        self.ingredientFactory = ingredientFactory
        self.name = ingredientFactory.factoryName + " Meat Pizza"
        self.price = 29.9
    }
    
    mutating func prepare() {
        print("Preparing \(name)")
        dough = ingredientFactory.createDough()
        sauce = ingredientFactory.createSauce()
        cheese = ingredientFactory.createCheese()
        veggies = ingredientFactory.createVeggies()
    }
}

class NYPizzaFactory: PizzaFactory {
    let ingredientFactory: PizzaIngredientFactory
    
    required init(ingredientFactory: PizzaIngredientFactory = NYPizzaIngredientFactory()) {
        self.ingredientFactory = ingredientFactory
    }
    
    func createPizza(type: PizzaType) -> Pizza {
        switch type {
        case .cheese:
            return CheesePizza(ingredientFactory: ingredientFactory)
        case .meat:
            return MeatPizza(ingredientFactory: ingredientFactory)
        }
        
    }
}

class ChicagoPizzaFactory: PizzaFactory {
    let ingredientFactory: PizzaIngredientFactory
    
    required init(ingredientFactory: PizzaIngredientFactory = ChicagoPizzaIngredientFactory()) {
        self.ingredientFactory = ingredientFactory
    }
    
    func createPizza(type: PizzaType) -> Pizza {
        switch type {
        case .cheese:
            return CheesePizza(ingredientFactory: ingredientFactory)
        case .meat:
            return MeatPizza(ingredientFactory: ingredientFactory)
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
        var pizza = createPizza(type: type)
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
















