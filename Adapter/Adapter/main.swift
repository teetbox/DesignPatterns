//
//  main.swift
//  Adapter
//
//  Created by Tong Tian on 2018/8/8.
//  Copyright © 2018 TeetBox. All rights reserved.
//

import Foundation

print("Hello, World!")

/*  The Adapter Pattern converts the interface of a class into another interface the clients expect. Adapter lets classes work together that couldn't otherwise because of incompatible interfaces.
 */

protocol VGA {
    func transmitVideo()
}

protocol HDMI {
    func transmitHD()
}

struct VGACable: VGA {
    func transmitVideo() {
        print("# transmitting via VGA #")
    }
}

struct HDMICable: HDMI {
    func transmitHD() {
        print("# transmitting via HDMI #")
    }
}

struct HDMIAdapter: VGA {
    
    let hdmi: HDMI
    
    func transmitVideo() {
        hdmi.transmitHD()
    }
    
}

let vgaCable = VGACable()
var computer = Computer(monitor: "23 Inch", vga: vgaCable)
computer.watch(movie: "Con Air")

let hdmlCable = HDMICable()
let hdmlAdpater = HDMIAdapter(hdmi: hdmlCable)
computer = Computer(monitor: "27 Inch", vga: hdmlAdpater)
computer.watch(movie: "Brave Heart")
