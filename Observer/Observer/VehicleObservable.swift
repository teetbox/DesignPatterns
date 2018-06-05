//
//  VehicleObservable.swift
//  Observer
//
//  Created by Tong Tian on 2018/6/5.
//  Copyright © 2018 TeetBox. All rights reserved.
//

import Foundation

protocol VehicleObservable: class {
    var driver: String? { get }
    var eventDate: Date? { get }
    var connectionState: ConnectionState { get }
    
    func addObserver(observer: VehicleObserver)
    func removeObserver(observer: VehicleObserver)
    func notifyObservers()
}

enum ConnectionState {
    case unknow
    case connected
    case disconnected
}

protocol VehicleObserver: class {
    func notityChangedConnection(vehicle: VehicleObservable, event: ConnectionEvent?)
}

protocol ConnectionEvent {
    var driver: String { get }
    var date: Date { get }
    var state: ConnectionState { get }
}
