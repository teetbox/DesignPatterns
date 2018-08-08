//
//  main.swift
//  Singleton
//
//  Created by Tong Tian on 2018/6/18.
//  Copyright © 2018 TeetBox. All rights reserved.
//

import Foundation

print("Hello, World!")

/*  The Singleton Pattern ensures a class has only one instance, and provides a global point of access to it.
 */

class ChocolateBoiler {
    
    static let instance = ChocolateBoiler()
    
    private var empty: Bool
    private var boiled: Bool
    
    private init() {
        empty = true
        boiled = false
    }
    
}

let boiler = ChocolateBoiler.instance

class ChocolateComplicatedBoler {
    
    static var instance: ChocolateComplicatedBoler = {
        let shared = ChocolateComplicatedBoler()
        // Complicated Configuration
        // ...
        return shared
    }()
    
    private var empty: Bool
    private var boiled: Bool
    
    private init() {
        empty = true
        boiled = false
    }
    
}

let complicatedBoiler = ChocolateComplicatedBoler.instance
