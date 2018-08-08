//
//  Computer.swift
//  Adapter
//
//  Created by Tong Tian on 2018/8/8.
//  Copyright © 2018 TeetBox. All rights reserved.
//

import Foundation

class Computer {
    
    let monitor: String
    let vga: VGA
    
    init(monitor: String, vga: VGA) {
        self.monitor = monitor
        self.vga = vga
    }
    
    func watch(movie: String) {
        vga.transmitVideo()
        print("I am watching \(movie) on a \(monitor) display")
    }
    
}
