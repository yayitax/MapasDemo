//
//  MyAnnotation.swift
//  MapasDemo
//
//  Created by Hackathon19 on 3/22/19.
//  Copyright © 2019 treslab. All rights reserved.
//

import Foundation
import MapKit

class MyAnnotation: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    
    init (title: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
    }
    
}

