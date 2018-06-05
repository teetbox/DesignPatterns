//
//  main.swift
//  Observer
//
//  Created by Tong Tian on 2018/6/4.
//  Copyright © 2018 TeetBox. All rights reserved.
//

import Foundation

print("Hello, World!")

/*  The Observer Pattern defines a one-to-many dependency between objects so that when one object changes state, all of its dependents are notified and updated automatically.
 */

protocol Subject {
    func register(observer: Observer)
    func remove(observer: Observer)
    func notify()
}

protocol Observer {
    func update()
}

extension Observer {
    var uuid: String {
        return UUID().uuidString
    }
}

class WeatherStation: Subject {
    
    var observers: [Observer] = []
    
    var temperture: Float = 31.0 {
        didSet {
            notify()
        }
    }
    
    func register(observer: Observer) {
        observers.append(observer)
    }
    
    func remove(observer: Observer) {
        observers = observers.filter { $0.uuid != observer.uuid }
    }

    func notify() {
        observers.forEach { $0.update() }
    }
    
}

class MonitorOne: Observer {
    
    var observable: Subject
    
    init(subject: Subject) {
        observable = subject
        observable.register(observer: self)
    }
    
    func unregister() {
        observable.remove(observer: self)
    }
    
    func update() {
        print("Monitor One is notified.")
    }
    
}

class MonitorTwo: Observer {
    
    var observable: Subject
    
    init(subject: Subject) {
        observable = subject
        observable.register(observer: self)
    }
    
    func unregister() {
        observable.remove(observer: self)
    }
    
    func update() {
        print("Monitor Two is notified.")
    }
    
}

let subject = WeatherStation()
let monitorOne = MonitorOne(subject: subject)
let monitorTwo = MonitorTwo(subject: subject)

subject.temperture = 29.0

// Vehicle Observer

let vehicle = Vehicle()
let pullObserver = PullObserver(vehicle: vehicle)
let pushObserver = PushObserver(vehicle: vehicle)
vehicle.connect(driver: "Bruce")
vehicle.connect(driver: "Batman")

pullObserver.unsubscribe()
vehicle.connect(driver: "Matt")
pushObserver.unsubscribe()

 RunLoop.main.run(until: Date(timeIntervalSinceNow: 5))
