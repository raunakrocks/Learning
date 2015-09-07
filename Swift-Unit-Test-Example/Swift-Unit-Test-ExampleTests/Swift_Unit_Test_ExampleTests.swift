//
//  Swift_Unit_Test_ExampleTests.swift
//  Swift-Unit-Test-ExampleTests
//
//  Created by Raunak Talwar on 9/4/15.
//  Copyright © 2015 Raunak Talwar. All rights reserved.
//

import XCTest

@testable import Swift_Unit_Test_Example

class Swift_Unit_Test_ExampleTests: XCTestCase {
    
    var myviewController:ViewController!;
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        myviewController = ViewController();
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func sortArrayOfNumstest(){
        
        let expectedArr = [1,3,4,10]
        let arr = [3,4,1,10]
        myviewController.sortArrayOfNums(arr)
        XCTAssertEqual(arr, expectedArr);

        
    }
    
}
