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
    
        showMessage("Hello, World" )
       
        print(power(2,b: 3))
        printMessage("Hello",times: 3)
        print(power1(base: 2, exponent: 3))
        print(<#T##items: Any...##Any#>)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func showMessage(message: String){
        print(message)
    }
    
    func printMessage(message: String, times: Int) {
        for i in 0..<times {
            print("\(i) \(message)")
        }
    }
    
    func power(a: Int, b: Int) -> Int {
        var result = a
        
        for _ in 1..<b {
            result = result * a
        }
        
        return result
    }
    
    func power1(base a: Int, exponent b: Int) -> Int {
        var result = a
        
        for _ in 1..<b {
            result = result * a
        }
        
        return result
    }
    
}

