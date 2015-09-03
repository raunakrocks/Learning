//
//  ViewController.swift
//  Swift-Learn-Project-1
//
//  Created by Raunak Talwar on 9/1/15.
//  Copyright (c) 2015 Raunak Talwar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var outputLabel: UILabel!
    var counter:Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func buttonPressed(sender: AnyObject) {
        counter = counter + 1;
        outputLabel.text = "Button Pressed \(counter) times";
        
    
    }
}

