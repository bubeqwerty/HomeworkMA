//
//  InformaciiPoplakiViewController.swift
//  Domashna SB
//
//  Created by NBO AIR on 5/6/17.
//  Copyright © 2017 Ljubomir Jankovikj. All rights reserved.
//

import UIKit
import CoreData
import MMDrawerController

class InformaciiPoplakiViewController: UIViewController {

    @IBOutlet weak var TextBox: UITextView!
   
    
    
    @IBAction func Prikazhi(_ sender: Any) {
    }
    
    @IBAction func vnesiTapped(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let poplaka = Entity(context: context) // Link Task & Context
        poplaka.name = TextBox.text!
        
        // Save the data to coredata
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        let _ = navigationController?.popViewController(animated: true)
        
        TextBox.text = ""
        
    }
    
    @IBAction func hamT(_ sender: Any) {
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        appDelegate.centerContainer!.toggle(MMDrawerSide.left, animated: true, completion: nil)

    }
    override func viewDidLoad() {
       
        super.viewDidLoad()
       
        
      
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
