//
//  ViewController.m
//  ConstraintExample
//
//  Created by Raunak Talwar on 8/11/15.
//  Copyright (c) 2015 Raunak Talwar. All rights reserved.
//

#import "ViewController.h"
#import "CompactConstraint/CompactConstraint.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    //[self.view setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self.view removeConstraints:self.view.constraints];
    [self.myLabel removeConstraints:self.myLabel.constraints];
    [self.myButton removeConstraints:self.myButton.constraints];
    
    NSDictionary *views = @{
                           @"button" : self.myButton,
                           @"label" : self.myLabel,
                           @"button1" : self.button1,
                           @"button2" :self.button2,
                           @"view" : self.view
                           };
    NSDictionary *metrics = @{
                                  @"buttonHeight" : @(136),
                                  @"labelHeight" : @(444),
                                                               };
    [self.view addCompactConstraints:@[
                                      @"V:|-(100)-[button]",
                                      @"H:|-(10)-[button]-(10)-|",
                                      @"label.height = labelHeight",
                                 
                                       ] metrics:metrics views:views];
    

   
    [self.view addCompactConstraints:@[
                                       @"H:|-(90)-[button1]-(50)-[button2]",
                                       @"V:|-(300)-[button1]",
                                       @"V:|-(300)-[button2]",
                                       @"H:[button1]-(50)-[button2(==button1)]",
                                       @"V:[button2(==button1)]",
                                       @"button1.height = buttonHeight",
                                       @"V:[label]-(30)-[button1]",
                                       @"V:[button1]-(>=40)-|",
                                      
                                       ] metrics:metrics views:views];

    
    
    
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
