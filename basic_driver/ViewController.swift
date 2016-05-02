//
//  ViewController.swift
//  basic_driver
//
//  Created by Nathan Poag on 5/1/16.
//  Copyright © 2016 Nathan Poag. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    @IBOutlet var activityState: UILabel!
    let activityManager = CMMotionActivityManager()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
            if(CMMotionActivityManager.isActivityAvailable()){
            self.activityManager.startActivityUpdatesToQueue(NSOperationQueue.mainQueue()){ data in if let data = data {
                dispatch_async(dispatch_get_main_queue()) {
                    if(data.stationary == true){
                        self.activityState.text = "Stationary"
                        
                    } else if (data.walking == true){
                        self.activityState.text = "Walking"
                        
                    } else if (data.running == true){
                        self.activityState.text = "Running"
                        
                    } else if (data.automotive == true){
                        self.activityState.text = "Automotive"
                    }
                }
                
                }
            }
        }
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

