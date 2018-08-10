//
//  AutoMaintenance.swift
//  Facade
//
//  Created by Tong Tian on 2018/8/9.
//  Copyright © 2018 TeetBox. All rights reserved.
//

import Foundation

struct AutoMaintenance {
    
    let engine: Engine
    let tire: Tire
    let windshield: Windshield
    let coolant: Coolant
    let battery: Battery
    
    func basicCheck() {
        engine.check()
        tire.check()
        windshield.clean()
    }
    
    func fullCheck() {
        engine.check()
        battery.check()
        coolant.check()
        tire.check()
        windshield.clean()
    }
    
}

protocol Engine {
    func check()
}

protocol Tire {
    func check()
}

protocol Windshield {
    func clean()
}

protocol Coolant {
    func check()
}

protocol Battery {
    func check()
}

struct V6Engine: Engine {
    func check() {
        print("Check V6 engine")
    }
}

struct Bridgestone: Tire {
    func check() {
        print("Check Bridgestone tire pressure")
    }
}

struct Murano: Windshield {
    func clean() {
        print("Clean Murano windshield")
    }
}

struct BlueLongLife: Coolant {
    func check() {
        print("Check Blue Long Life coolant")
    }
}

struct NissanBattery: Battery {
    func check() {
        print("Check Nissan battery")
    }
}
