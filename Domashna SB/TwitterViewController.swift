//
//  TwitterViewController.swift
//  Domashna SB
//
//  Created by NBO AIR on 5/4/17.
//  Copyright © 2017 Ljubomir Jankovikj. All rights reserved.
//

import UIKit
import TwitterKit
import MMDrawerController

class TwitterViewController: UIViewController {
   
    let image = UIImage(named: "blue-button-hi") as UIImage?
    
    
    @IBAction func hamTap(_ sender: Any) {
       
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        appDelegate.centerContainer!.toggle(MMDrawerSide.left, animated: true, completion: nil)
    }
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
   
         //Add a button to the center of the view to show the timeline
    let button = UIButton(type: .system)
        button.setTitle("Прикажи твитер профил", for: [])
        button.frame = CGRect(x:view.bounds.minX + view.bounds.maxX / 3.8, y: 80, width: 200, height: 80)
        button.setBackgroundImage(image, for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 14)
        button.translatesAutoresizingMaskIntoConstraints = true
        button.addTarget(self, action: #selector(showTimeline), for: [.touchUpInside])
        view.addSubview(button)


        // Do any additional setup after loading the view.
    }

    func showTimeline() {
        // Create an API client and data source to fetch Tweets for the timeline
        let client = TWTRAPIClient()
        //TODO: Replace with your collection id or a different data source
        let dataSource = TWTRCollectionTimelineDataSource(collectionID: "539487832448843776", apiClient: client)
        // Create the timeline view controller
        let timelineViewControlller = TWTRTimelineViewController(dataSource: dataSource)
        // Create done button to dismiss the view controller
        let button = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissTimeline))
        timelineViewControlller.navigationItem.leftBarButtonItem = button
        // Create a navigation controller to hold the
        let navigationController = UINavigationController(rootViewController: timelineViewControlller)
        showDetailViewController(navigationController, sender: self)
    }
    func dismissTimeline() {
        dismiss(animated: true, completion: nil)
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
