//
//  ViewController.swift
//  Swift-Project-4
//
//  Created by Raunak Talwar on 9/8/15.
//  Copyright © 2015 Raunak Talwar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        var str = "hellop"
        print(str)
        var tmp = 5
        print("This number is \(tmp)");
        
        let one = 1
        let two = 0.30
        typealias blue = Int
        let three = one + blue(two)
        print(three)
        
        let i = 2
        if i == 1 {
            print("i is \(i)")
        }
        else
        {
            print("this is else")
        }
        
        var flag  = true
        
        if flag == true {
            print("flag is \(flag)")
        }
        
        let chk = 12
        assert(chk>=10 ,"chk is less than 20")
        
        var myarr: [String] = ["Raunak","Ravi","Manish"]
        print(myarr[0])
        print(myarr[2])
        print(myarr.count)
        
        if !myarr.isEmpty {
            print("myarr is not empty")
        }
        myarr.append("Vandit")
        
        //Dictionary 
        var house: Dictionary = ["a": "Apple","b": "Boy"];
        print(house["a"]!)
        
        house.removeValueForKey("b")
        
        for red in 1...6 {
            print(red)
        }
        
        for i in myarr {
            print(i)
        }
        for _ in myarr {
            print("test")
        }
        
        for var num = 0; num < 6; ++num {
            print(num)
        }
        
        //functions
        print(name("USER"))
        print(add(1, num2: 2))
        
        //nested functions 
        
        
        //closures
        var tmpo: () -> () = {
            print("helo")
        }
        tmpo()
        
        
        var addit: (Int, Int) -> Int = {
            a,b -> Int in
            return a + b
        }
        print(addit(2,4))
        
    }

    func name(myname: String) -> String {
        return "hello " + myname
    }
    
    func add(num1 : Int, num2 : Int) -> Int {
        return num1 + num2;
    }

}

