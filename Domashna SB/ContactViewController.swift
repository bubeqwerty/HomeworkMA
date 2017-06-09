//
//  ContactViewController.swift
//  Domashna SB
//
//  Created by FINKI on 5/4/17.
//  Copyright © 2017 Ljubomir Jankovikj. All rights reserved.
//

import UIKit
import MMDrawerController
import MapKit
import UserNotifications
class ContactViewController: UIViewController {

    
    let location = CLLocationCoordinate2DMake(42.004733, 21.419335)
    
    @IBAction func hamAction(_ sender: Any) {
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        appDelegate.centerContainer!.toggle(MMDrawerSide.left, animated: true, completion: nil)
        
    }

    @IBAction func notificationTap(_ sender: AnyObject) {
        
        let notification = UNMutableNotificationContent()
        notification.title = "Потсетник"
        //notification.subtitle = "SUBTITLE"
        notification.body = "Јави се во општина Скопје бројот е 02/3297 207"
        
        let notificationTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "notification2", content: notification, trigger: notificationTrigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
    }
    func initNotificationSetupCheck() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert])
        { (success, error) in
            if success {
                print("Permission Granted")
            } else {
                print("There was a problem!")
            }
        }
    }
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.setRegion(MKCoordinateRegionMakeWithDistance(location, 1500, 1500), animated: true)
        
        let pin = PinAnnotation(title: "Општина Скопје", subtitle: "Тука се наоѓа седиштето на град Скопје.", coordinate: location)
        
        mapView.addAnnotation(pin)
        
       initNotificationSetupCheck()
        // Do any additional setup after loading the view.
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
