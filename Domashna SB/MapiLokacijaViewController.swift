//
//  MapiLokacijaViewController.swift
//  Domashna SB
//
//  Created by Ljubomir Jankovikj on 4/26/17.
//  Copyright © 2017 Ljubomir Jankovikj. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import MMDrawerController

class MapiLokacijaViewController: UIViewController, CLLocationManagerDelegate {
    var lat=41.9973
    var lon=21.4280
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var kompas: UILabel!
    var locationManager: CLLocationManager!
     var lm:CLLocationManager!

    @IBAction func hamTapped(_ sender: Any) {
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        appDelegate.centerContainer!.toggle(MMDrawerSide.left, animated: true, completion: nil)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let location = CLLocationCoordinate2DMake(lat,lon)
        
        //Ova e da go podesi vo Mapata kade da prikaze
        mapView.setRegion(MKCoordinateRegionMakeWithDistance(location,1500,1500),animated: true)
    
        
        
        //Location manager za da dovieme koordinati
        locationManager = CLLocationManager();
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation();
        
        mapView.showsUserLocation=true
        
        
        lm = CLLocationManager()
        lm.delegate = self
        
        lm.startUpdatingHeading()
        
    }
    
    
    
    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation]){
        var currentLocation = CLLocation()
        
        currentLocation = locationManager.location!
        
        lon=currentLocation.coordinate.longitude
        lat=currentLocation.coordinate.latitude
        
        
        let location = CLLocationCoordinate2DMake(lat,lon)
        
        //Ova e da go podesi vo Mapata kade da prikaze
        mapView.setRegion(MKCoordinateRegionMakeWithDistance(location,1500,1500),animated: true)
        
        let theLocation: MKUserLocation = mapView.userLocation
        let st1=String(lat)
        let st2=String(lon)
        var st=""
        st.append("Lat:")
        st.append(st1)
        st.append(", Lon:")
        st.append(st2)
        theLocation.title = st

       
        
        
    }
    
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        print(newHeading.magneticHeading)
        kompas.text=String(newHeading.magneticHeading)
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
