//
//  ViewController.swift
//  MapasDemo
//
//  Created by Hackathon19 on 3/22/19.
//  Copyright © 2019 treslab. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController,CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    var annotations: [MKAnnotation] = []
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        mapView.showsUserLocation = true
        locationManager.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
        
        locationManager.requestWhenInUseAuthorization()
        
        if let userCoordinates = locationManager.location?.coordinate {
            let region = MKCoordinateRegion(center: userCoordinates, latitudinalMeters: 2000, longitudinalMeters: 2000)
            mapView.setRegion(region, animated: false)
        }
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(addAnnotation(gestureRecognizer:)))
        
        mapView.addGestureRecognizer(tapGesture)
    }
    
    
    @objc func addAnnotation(gestureRecognizer: UITapGestureRecognizer) {
        let touchPoint = gestureRecognizer.location(in: mapView)
        let coordinate = mapView.convert(touchPoint, toCoordinateFrom: mapView)
        let annotation = MyAnnotation(title: String(annotations.count), coordinate: coordinate)
        annotations.append(annotation)
        mapView.addAnnotation(annotation)
    }
    
}

extension ViewController: MKMapViewDelegate {
    
}
