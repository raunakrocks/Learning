//
//  ViewController.swift
//  SwiftApp1
//
//  Created by Raunak Talwar on 8/20/15.
//  Copyright (c) 2015 Raunak Talwar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       var myString = "hi"
        println(myString)
        
        var varA = 42
        println(varA)
    
        var varB:Float
        varB = 53.5
        println(varB)
        
        var 你好 = "你好世界"
        println(你好)
        
        println("hi the value of varB is \(varB)")
        
        //Using Optional Variables 
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

