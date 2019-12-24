//
//  BeaconDetector.swift
//  iBeacon
//
//  Created by Alexander Römer on 21.12.19.
//  Copyright © 2019 Alexander Römer. All rights reserved.
//

import Foundation
import Combine
import CoreLocation

class BeaconDecetor: NSObject, ObservableObject, CLLocationManagerDelegate  {
    var didChange           = ObservableObjectPublisher()
    var locationManager     : CLLocationManager?
    var lastDistance        = CLProximity.unknown
    
    override init() {
        super.init()
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestWhenInUseAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
                if CLLocationManager.isRangingAvailable() {
                    startScanning()
                }
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didRange beacons: [CLBeacon], satisfying beaconConstraint: CLBeaconIdentityConstraint) {
        if let beacon = beacons.first {
            update(distance: beacon.proximity)
        } else {
            update(distance: .unknown)
        }
    }
    
    func startScanning() {
        let uuid = UUID(uuidString: "5aec- 4f53- th54-89sd...")!
        let constraint = CLBeaconIdentityConstraint(uuid: uuid, major: 123, minor: 456)
        let beaconRegion = CLBeaconRegion(beaconIdentityConstraint: constraint, identifier: "MyBeacon")
        locationManager?.startMonitoring(for: beaconRegion)
        locationManager?.startRangingBeacons(satisfying: constraint)
    }
    
    
    func update(distance: CLProximity) {
        lastDistance = distance
        didChange.send()
    }
    
}
