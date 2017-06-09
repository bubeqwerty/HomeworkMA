//
//  PopViewController.swift
//  Domashna SB
//
//  Created by NBO AIR on 5/6/17.
//  Copyright © 2017 Ljubomir Jankovikj. All rights reserved.
//

import UIKit
import CoreData
class PopViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

  
    @IBOutlet weak var tableView2: UITableView!
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var poplaki: [Entity] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        tableView2.delegate = self
        tableView2.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getData()
        tableView2.reloadData()
    }
    
    func getData() {
        do {
            poplaki = try context.fetch(Entity.fetchRequest())
        } catch {
            print("Fetching Failed")
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = poplaki[indexPath.row]
        cell.backgroundColor = .clear
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.numberOfLines = 0;
        cell.textLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping;

        if let myName = task.name {
            cell.textLabel?.text = myName
        }
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return poplaki.count
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let task = poplaki[indexPath.row]
            context.delete(task)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            do {
                poplaki = try context.fetch(Entity.fetchRequest())
            } catch {
                print("Fetching Failed")
            }
        }
        tableView.reloadData()
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
