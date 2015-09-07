//
//  ViewController.swift
//  Swift-Unit-Test-Example
//
//  Created by Raunak Talwar on 9/4/15.
//  Copyright © 2015 Raunak Talwar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        let arr = [3,4,1,10]
        
        for num in arr{
            print(num)
        }
        sortArrayOfNums(arr)
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func sortArrayOfNums(var nums: [Int])
    {
        for var i=0; i<4; i++ {
            for var j=i; j<4; j++ {
                if(nums[i] > nums[j]){
                    let tmp = nums[i];
                    nums[i] = nums[j];
                    nums[j] = tmp;
                }
            }
        }
        for num in nums {
            print(num);
        }
    }

    

}

