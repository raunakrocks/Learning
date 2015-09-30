//
//  ViewController.swift
//  Learn-Swift-1
//
//  Created by Raunak Talwar on 9/14/15.
//  Copyright © 2015 Raunak Talwar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBOutlet weak var myLabel: UILabel!
    @IBAction func buttonPressed(sender: AnyObject) {
        
        let title = sender.titleForState(.Normal)!
        
        myLabel.text = "You clicked \(title) button"
        
        c();
    }
    
    var c: () -> () = {
        print("Closure is called")
    }
}

