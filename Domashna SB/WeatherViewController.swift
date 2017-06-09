//
//  WeatherViewController.swift
//  Domashna SB
//
//  Created by NBO AIR on 5/2/17.
//  Copyright © 2017 Ljubomir Jankovikj. All rights reserved.
//

import UIKit
import Alamofire
import MMDrawerController
class WeatherViewController: UIViewController {

    @IBOutlet weak var Pozadina: UIImageView!
    @IBOutlet weak var labelaGrad: UILabel!
    @IBOutlet weak var descr: UILabel!
    @IBOutlet weak var labelaStepeni: UILabel!
    
    var name : String?
    var nizaPod = [AnyObject]()
    var ikona : String?
    @IBOutlet weak var slikaIkona: UIImageView!
    
    var centerContainer: MMDrawerController?
    var window: UIWindow?
    
    @IBAction func hamMenuTapped(_ sender: Any) {
        
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        appDelegate.centerContainer!.toggle(MMDrawerSide.left, animated: true, completion: nil)
        
    }
 

    override func viewDidLoad() {
        super.viewDidLoad()
        
       Pozadina.image = #imageLiteral(resourceName: "skopjeN")
        
        
        Alamofire.request("http://api.openweathermap.org/data/2.5/weather?q=Skopje,mk&units=metric&appid=59a0f6fb79500f1e6191fddfa66a9f54").responseJSON(completionHandler: {
            
            response in
            
            let result = response.result
            
            if let dict = result.value as? Dictionary<String,AnyObject> {
                
                // print()
                self.labelaGrad.text = dict["name"] as! String?
                
                if let innerDict = dict["main"] {
                    
                    self.labelaStepeni.text = String(describing: innerDict["temp"] as! NSNumber) + " °C"
                    self.ikona = innerDict["icon"] as? String
                    
                }
                
                
            }
            
            
            if let dict2 = result.value as? Dictionary<String,AnyObject> {
                
                if let innerDict2 = dict2["weather"] as! NSArray? {
                    
                    
                    if let dict3 = innerDict2[0] as? Dictionary<String,AnyObject> {
                        
                        self.ikona = dict3["icon"] as? String
                        self.descr.text = dict3["description"] as? String
                        DispatchQueue.global().async {
                            
                            let url="http://openweathermap.org/img/w/"+self.ikona!+".png"
                            let data=NSData(contentsOf: URL(string: url)!)
                            
                            DispatchQueue.main.sync{
                                self.slikaIkona.image = UIImage(data:data! as Data)
                            }
                        }
                        
                    }
                    
                }
            }
            
        })
        
        
        
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
