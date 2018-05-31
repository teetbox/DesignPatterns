//
//  main.swift
//  Strategy
//
//  Created by Tong Tian on 2018/5/31.
//  Copyright © 2018 TeetBox. All rights reserved.
//

import Foundation

print("Hello, World!")

/*  The Strategy Pattern defines a family of algorithms, encapsulates each one, and makes them interchangeablr. Strategy lets the algorithm vary independently from clients that use it.
 */

protocol FlyBehavior {
    func fly()
}

protocol QuackBehavior {
    func quack()
}

class Duck {
    
    var flyBehavior: FlyBehavior
    var quackBehavior: QuackBehavior
    
    init(flyBehavior: FlyBehavior, quackBehavoir: QuackBehavior) {
        self.flyBehavior = flyBehavior
        self.quackBehavior = quackBehavoir
    }
    
    func display() {
        print("Duck looks like a duck")
    }
    
    func swim() {
        print("I can swim")
    }
    
    func fly() {
        flyBehavior.fly()
    }
    
    func quack() {
        quackBehavior.quack()
    }
}


class FlyWithWings: FlyBehavior {
    func fly() {
        print("I flying with my wings")
    }
}

class  FlyNoWay: FlyBehavior {
    func fly() {
        print("I can't fly")
    }
}

class Quack: QuackBehavior {
    func quack() {
        print("Duck quacking")
    }
}

class Squeak: QuackBehavior {
    func quack() {
        print("Rubber duckie squeak")
    }
}

class MuteQuack: QuackBehavior {
    func quack() {
        print("I can't quack")
    }
}

class MallardDuck: Duck {
    override init(flyBehavior fly: FlyBehavior = FlyWithWings(), quackBehavoir quack: QuackBehavior = Quack()) {
        super.init(flyBehavior: fly, quackBehavoir: quack)
    }
    
    override func display() {
        print("Looks like a mallard")
    }
}

let mallard = MallardDuck()
mallard.display()

class RedheadDuck: Duck {
    convenience init() {
        self.init(flyBehavior: FlyWithWings(), quackBehavoir: Quack())
    }
    
    override func display() {
        print("Looks like a redhead")
    }
}

let redhead = RedheadDuck()
redhead.display()
redhead.fly()
redhead.quack()

class RubberDuck: Duck {
    convenience init() {
        self.init(flyBehavior: FlyNoWay(), quackBehavoir: Squeak())
    }
    
    override func display() {
        print("Looks like a rubber duck")
    }
}

let rubber = RubberDuck()
rubber.display()
rubber.fly()
rubber.quack()

class DecoyDuck: Duck {
    convenience init() {
        self.init(flyBehavior: FlyNoWay(), quackBehavoir: MuteQuack())
    }
    
    override func display() {
        print("Looks like a decoy duck")
    }
}

let decoy = DecoyDuck()
decoy.display()
decoy.fly()
decoy.quack()
