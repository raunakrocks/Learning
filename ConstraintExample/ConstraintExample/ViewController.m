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
                           };
    NSDictionary *metrics = @{
                                  @"buttonHeight" : @(36),
                                  @"labelHeight" : @(44),
                              };
    [self.view addCompactConstraints:@[
                                      @"V:|-(100)-[button]",
                                      @"H:|-(10)-[button]-(10)-|",
                                      @"V:|[label]|",
                                     // @"button.height = buttonHeight"
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
