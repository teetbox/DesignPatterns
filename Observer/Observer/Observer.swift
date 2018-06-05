//
//  Observer.swift
//  Observer
//
//  Created by Tong Tian on 2018/6/5.
//  Copyright © 2018 TeetBox. All rights reserved.
//

import Foundation

class PullObserver: VehicleObserver {
    
    private var driver: String?
    private var connectionDate: Date?
    private var connectionState: ConnectionState?
    
    let vehicle: VehicleObservable
    
    init(vehicle: VehicleObservable) {
        self.vehicle = vehicle
        vehicle.addObserver(observer: self)
    }
    
    func notityChangedConnection(vehicle: VehicleObservable, event: ConnectionEvent?) {
        driver = vehicle.driver
        connectionDate = vehicle.eventDate
        connectionState = vehicle.connectionState
        
        print("Pull Observer: ", driver!, connectionDate!, connectionState!)
    }
    
    func unsubscribe() {
        vehicle.removeObserver(observer: self)
    }
    
}

class PushObserver: VehicleObserver {
    
    private var driver: String?
    private var connectionDate: Date?
    
    private weak var vehicle: VehicleObservable?
    
    init(vehicle: VehicleObservable) {
        self.vehicle = vehicle
        vehicle.addObserver(observer: self)
    }
    
    func notityChangedConnection(vehicle: VehicleObservable, event: ConnectionEvent?) {
        driver = event?.driver
        connectionDate = event?.date
        
        print("Push Observer: ", driver!, connectionDate!)
    }
    
    func unsubscribe() {
        vehicle?.removeObserver(observer: self)
    }
    
}
