//
//  MapViewController.swift
//  IMMessage
//
//  Created by ZhongMing on 13/10/16.
//  Copyright © 2016 ZhongMing. All rights reserved.
//

import UIKit
import GoogleMaps


class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    

    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    var manager = CLLocationManager()
    
    //var newl = CLLocationCoordinate2D(latitude: <#T##CLLocationDegrees#>, longitude: <#T##CLLocationDegrees#>)
    
    var newPin = PinAnnotation(coord: CLLocationCoordinate2D(latitude: -36.874, longitude: 174.757), title: "a", subtitle: "b")
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.mapView.delegate = self
        
        //Set the longitutde and lantitude
        var site = Site(Longtitude: 174.757, Lantitude: -36.874)
        var site1 = Site(Longtitude: 174.733, Lantitude: -36.75)
        var site2 = Site(Longtitude: 174.726, Lantitude: -36.895)
        
        
        
        
        
//        let camera = GMSCameraPosition.camera(withLatitude: (site.Lantitude), longitude: (site.Longtitude), zoom: 8.0)
//        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
//        mapView.isMyLocationEnabled = true
        //view = mapView
        
//        let marker = GMSMarker()
//        marker.position = CLLocationCoordinate2D(latitude: site.Lantitude, longitude: site.Longtitude)
//        marker.title = "Auckland"
//        marker.snippet = "New Zealand"
        //marker.map = mapView
        
        let aklLocation = CLLocationCoordinate2D(latitude: site.Lantitude, longitude: site.Longtitude)
        let akllocation1 = CLLocationCoordinate2D(latitude: site1.Lantitude, longitude: site1.Longtitude)
        let aklLocation2 = CLLocationCoordinate2D(latitude: site2.Lantitude, longitude: site2.Longtitude)
        let akl = MKPointAnnotation()
        let akl1 = MKPointAnnotation()
        let akl2 = MKPointAnnotation()
        
        
        var programList = [MKPointAnnotation]()
        
        var b = MKPinAnnotationView()
        
        
        var a = MKAnnotationView()
        a.canShowCallout = true
        
        
        akl.coordinate = aklLocation
        akl.title = "Holiday Program"
        akl.subtitle = "18 Honson Street"
        
        
        akl1.coordinate = akllocation1
        akl1.title = "After School Program"
        akl1.subtitle = "28 Constellation Drive"
        
        
        akl2.coordinate = aklLocation2
        akl2.title = "Before School Program"
        akl2.subtitle = "1 Tyburnia Ave"
        
        
        programList.append(akl)
        programList.append(akl1)
        programList.append(akl2)
        
        
        //mapView.addAnnotation(akl)
        
        
        
        mapView.addAnnotations(programList)
//        manager = CLLocationManager()
//        manager.delegate = self
//        manager.desiredAccuracy = kCLLocationAccuracyBest
//        manager.startUpdatingLocation()
        
        
        //set current location
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.startUpdatingLocation()
        self.mapView.showsUserLocation = true
    }
    
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        if annotation is PinAnnotation{
//            let pinAnnotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "myPin")
//            pinAnnotationView.pinTintColor = .blue
//            pinAnnotationView.isDraggable = true
//            pinAnnotationView.canShowCallout = true
//            pinAnnotationView.animatesDrop = true
//            return pinAnnotationView
//        }
//    }
    
    
    
    //Select pin points
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        var anView = mapView.dequeueReusableAnnotationView(withIdentifier: "")
        anView?.canShowCallout = true
        
    }
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
       let location = locations.last
        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 3, longitudeDelta: 3))
        
        self.mapView.setRegion(region, animated: true)
        
        self.locationManager.stopUpdatingLocation()
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error: " + error.localizedDescription)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
