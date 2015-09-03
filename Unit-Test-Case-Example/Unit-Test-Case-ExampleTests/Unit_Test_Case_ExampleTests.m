//
//  Unit_Test_Case_ExampleTests.m
//  Unit-Test-Case-ExampleTests
//
//  Created by Raunak Talwar on 9/2/15.
//  Copyright © 2015 Raunak Talwar. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"

@interface Unit_Test_Case_ExampleTests : XCTestCase

@property (nonatomic) ViewController *vcToTest;
@end

@implementation Unit_Test_Case_ExampleTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.vcToTest = [[ViewController alloc]init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testReverseString {
    NSString *originalString = @"raunak";
    NSString *reversedString = [self.vcToTest reverseString:originalString];
    NSString *expectedReversedString = @"kanuar";
    XCTAssertEqualObjects(reversedString,expectedReversedString,@"not equal");
    
}
- (void)testingReverseString {
    NSString *originalString = @"raunak";
    NSString *reversedString = [self.vcToTest reverseString:originalString];
    NSString *expectedReversedString = @"kanuar";
    XCTAssertEqualObjects(reversedString,expectedReversedString,@"not equal");
    
}

@end
