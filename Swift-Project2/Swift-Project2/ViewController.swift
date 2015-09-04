//
//  ViewController.swift
//  Swift-Project2
//
//  Created by Raunak Talwar on 9/3/15.
//  Copyright © 2015 Raunak Talwar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

  

    @IBAction func buttonPressed(sender: AnyObject) {

    let alertController = UIAlertController(title: "Welcome to swift", message: "Hello World", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil));
        self.presentViewController(alertController, animated: true, completion: nil);
    
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true;
    }
}

