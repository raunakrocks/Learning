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
       var myString1 = "hi"
        println(myString1)
        
        var varA = 42
        println(varA)
    
        var varB:Float
        varB = 53.5
        println(varB)
        
        var 你好 = "你好世界"
        println(你好)
        
        println("hi the value of varB is \(varB)")
        
        //Using Optional Variables 
        var myString:String!
        
        myString = "Hello, Swift!"
        
        if myString != nil {
            println( myString )
        }else{
            println("myString has nil value")
        }
        if let yourString = myString {
            println("Your string has - \(yourString)")
        }else{
            println("Your string does not have a value")
        }
        //Using Constants 
        let constA = 42// 
        println(constA)
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

