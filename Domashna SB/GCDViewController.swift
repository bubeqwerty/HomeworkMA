//
//  GCDViewController.swift
//  Domashna SB
//
//  Created by Ljubomir Jankovikj on 4/26/17.
//  Copyright © 2017 Ljubomir Jankovikj. All rights reserved.
//

import UIKit
import MMDrawerController
class GCDViewController: UIViewController {
    var promenliva=0
    
    @IBOutlet weak var slika: UIImageView!
    @IBOutlet weak var labela: UILabel!
    
    
    let dateFormater = DateFormatter()
    
    
      override func viewDidLoad() {
        super.viewDidLoad()
        labela.text = dateFormater.string(from: Date())
        
        
        dateFormater.dateStyle = .none
        dateFormater.timeStyle = .medium
        
        Timer.scheduledTimer(timeInterval:0.1, target: self, selector: #selector(updateLabel), userInfo: nil, repeats: true)
        
        
      
        // Do any additional setup after loading the view.
    }
    
    
    func updateLabel() -> Void{
        
        labela.text = dateFormater.string(from: Date())
        
        
    }
    
    @IBAction func hamAction(_ sender: Any) {
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        appDelegate.centerContainer!.toggle(MMDrawerSide.left, animated: true, completion: nil)
        
    }

    
    override func viewDidAppear(_ animated: Bool) {
        DispatchQueue.global().async {
            let url="https://upload.wikimedia.org/wikipedia/commons/4/4c/GUP_Skopje_2002_mal.jpg"
            let data=NSData(contentsOf: URL(string: url)!)
            // UIImage photo =data
            
            
            DispatchQueue.main.sync{
                
                
                self.slika.image = UIImage(data:data! as Data)
                
    
            }
            
        }
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
