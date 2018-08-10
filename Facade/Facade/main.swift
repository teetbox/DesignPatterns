//
//  main.swift
//  Facade
//
//  Created by Tong Tian on 2018/8/9.
//  Copyright © 2018 TeetBox. All rights reserved.
//

import Foundation

print("Hello, World!")

/*  The Facade Pattern provides a unified interface to a set of interfaces in a subsystem. Facade defines a higher-level interface that makes the subsystem easier to use.
 */

/*  Design Principle
    Principle of Least Knowledge talk only to your immediate friends.
 */

let maintenance = AutoMaintenance(engine: V6Engine(), tire: Bridgestone(), windshield: Murano(), coolant: BlueLongLife(), battery: NissanBattery())

print("# Facade for basic check #")
maintenance.basicCheck()

print("# Facade for full check #")
maintenance.fullCheck()
