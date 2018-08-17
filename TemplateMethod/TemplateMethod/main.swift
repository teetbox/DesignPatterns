//
//  main.swift
//  TemplateMethod
//
//  Created by Tong Tian on 2018/8/17.
//  Copyright © 2018 TeetBox. All rights reserved.
//

import Foundation

print("Hello, World!")

protocol Worker {
    func wakeup()
    func exercise()
    func eat()
    func work()
}

extension Worker {
    func startDay() {
        wakeup()
        exercise()
        eat()
        work()
    }
    
    func wakeup() {
        print("Wake up at 6:30")
    }
}

struct Programmer: Worker {
    func exercise() {
        print("Running for 15 minutes")
    }
    
    func eat() {
        print("Eat a sandwich")
    }
    
    func work() {
        print("Begin programming")
    }
}

struct Teacher: Worker {
    func exercise() {
        print("Walk for 30 minutes")
    }
    
    func eat() {
        print("Eat some bread and a glass of milk")
    }
    
    func work() {
        print("Teach a class")
    }
}

print("A Programmer's Day:")
let programmer = Programmer()
programmer.startDay()

print("A Teacher's Day:")
let teacher = Teacher()
teacher.startDay()
