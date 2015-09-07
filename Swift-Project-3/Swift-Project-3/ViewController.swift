//
//  ViewController.swift
//  Swift-Project-3
//
//  Created by Raunak Talwar on 9/7/15.
//  Copyright © 2015 Raunak Talwar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        showMessage("Hello, World")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func showMessage(message: String){
        print(message)
    }
}

