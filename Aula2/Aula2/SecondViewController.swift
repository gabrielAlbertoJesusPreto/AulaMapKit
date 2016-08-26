//
//  SecondViewController.swift
//  Aula2
//
//  Created by Gabriel Alberto de Jesus Preto on 25/08/16.
//  Copyright © 2016 MackMobile. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class SecondViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    var message: String? = ""
    var locationManager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Altera o valor do Label
        self.displayMessage()
        
        // Interface entre o app e o GPS
        self.locationManager = CLLocationManager()
        
        // Solicita ao usuário o uso da Localização
        self.locationManager.requestAlwaysAuthorization()
        
        // Precisão da localização
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        // Delegate
        self.locationManager.delegate = self
        
        // Começa a buscar a localização
        self.locationManager.stopUpdatingLocation()
        
        // Mostra localização do usuário no Mapa
        self.mapView.showsUserLocation = true

    }
    
    override func viewDidAppear(animated: Bool) {
        self.addPin()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayMessage() {
        if let m = message {
            messageLabel.text = m
        }
    }
    
    // MARK: MapKit
    
    func addPin() {
        let pin = MKPointAnnotation()
        pin.coordinate = CLLocationCoordinate2D(latitude: -23.548186, longitude: -46.650368)
        pin.title = "Universidade Presbiteriana Mackenzie"
        pin.subtitle = "Isso é Mackenzie"
        
        let camera = MKMapCamera(lookingAtCenterCoordinate: pin.coordinate, fromDistance: 1500, pitch: 0, heading: 0)
        mapView.setCamera(camera, animated: true)
        
        mapView.addAnnotation(pin)
        mapView.selectAnnotation(pin, animated: true)
        
    }
    
    // MARK: GO BACK
    
    @IBAction func goBack(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
