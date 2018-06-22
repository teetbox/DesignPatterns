//
//  main.swift
//  Command
//
//  Created by Tong Tian on 2018/6/19.
//  Copyright © 2018 TeetBox. All rights reserved.
//

import Foundation

print("Hello, World!")

/*  The Command Pattern encapsulates a request as an object, thereby letting you parameterize other objects with different requests, queue or log requests, and support undoable operations.
 */

protocol Command {
    func execute()
    func undo()
}

struct Light {
    var isOn = false
    
    mutating func turnOn() {
        isOn = true
        print("Turn light on")
    }
    
    mutating func turnOff() {
        isOn = false
        print("Turn light off")
    }
}

class LightOnCommand: Command {
    
    var light: Light
    
    init(light: Light) {
        self.light = light
    }
    
    func execute() {
        light.turnOn()
    }
    
    func undo() {
        light.turnOff()
    }
    
}

class LightOffCommand: Command {
    
    var light: Light
    
    init(light: Light) {
        self.light = light
    }
    
    func execute() {
        light.turnOff()
    }
    
    func undo() {
        light.turnOn()
    }
    
}

struct Door {
    var isOpen = false
    
    mutating func open() {
        isOpen = true
        print("Open the door")
    }
    
    mutating func close() {
        isOpen = false
        print("Close the door")
    }
    
    
}

class DoorOpenCommand: Command {
    
    var door: Door
    
    init(door: Door) {
        self.door = door
    }
    
    func execute() {
        door.open()
    }
    
    func undo() {
        door.close()
    }
    
}

class DoorCloseCommand: Command {
    
    var door: Door
    
    init(door: Door) {
        self.door = door
    }
    
    func execute() {
        door.close()
    }
    
    func undo() {
        door.open()
    }
    
}

class RemoteController {
    var onCommands: [Command] = []
    var offCommands: [Command] = []
    var undoCommand: Command?
    
    func setCommand(on: Command, off: Command) {
        onCommands.append(on)
        offCommands.append(off)
    }
    
    func pressOn(index: Int) {
        guard index < onCommands.count else { return }
        onCommands[index].execute()
        undoCommand = onCommands[index]
    }
    
    func pressOff(index: Int) {
        guard index < offCommands.count else { return }
        offCommands[index].execute()
        undoCommand = offCommands[index]
    }
    
    func pressUndo() {
        undoCommand?.undo()
    }
}

let controller = RemoteController()
let light = Light()
let door = Door()
controller.setCommand(on: LightOnCommand(light: light), off: LightOffCommand(light: light))
controller.setCommand(on: DoorOpenCommand(door: door), off: DoorCloseCommand(door: door))
controller.pressOn(index: 0)
controller.pressOff(index: 0)
controller.pressOn(index: 1)
controller.pressUndo()
