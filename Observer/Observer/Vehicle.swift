//
//  Vehicle.swift
//  Observer
//
//  Created by Tong Tian on 2018/6/5.
//  Copyright © 2018 TeetBox. All rights reserved.
//

import Foundation

class Vehicle: VehicleObservable {
    
    var driver: String?
    var eventDate: Date?
    var connectionState: ConnectionState = .unknow
    
    private var observers: [VehicleObserver] = []
    
    func addObserver(observer: VehicleObserver) {
        if observers.contains(where: { $0 === observer }) == false {
            observers.append(observer)
        }
    }
    
    func removeObserver(observer: VehicleObserver) {
        if let index = observers.index(where: { $0 === observer }) {
            observers.remove(at: index)
        }
    }
    
    func notifyObservers() {
        let event = getConnectionEvent()
        observers.forEach { observer in
            observer.notityChangedConnection(vehicle: self, event: event)
        }
    }
    
    private func getConnectionEvent() -> ConnectionEvent? {
        var event: ConnectionEvent?
        if let driver = driver, let date = eventDate {
            event = ConnectionData(driver: driver, date: date, state: connectionState)
        }
        return event
    }
    
    func connect(driver: String) {
        self.driver = driver
        eventDate = Date()
        connectionState = .connected
        
        notifyObservers()
    }
    
    func disconnect() {
        eventDate = Date()
        connectionState = .disconnected
        
        notifyObservers()
    }
    
    func getObserverCount() -> Int {
        return observers.count
    }
    
}

fileprivate struct ConnectionData: ConnectionEvent {
    var driver: String
    var date: Date
    var state: ConnectionState
}
