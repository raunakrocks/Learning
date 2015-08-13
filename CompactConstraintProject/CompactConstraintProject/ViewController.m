//
//  ViewController.m
//  CompactConstraintProject
//
//  Created by Raunak Talwar on 8/12/15.
//  Copyright (c) 2015 Raunak Talwar. All rights reserved.
//

#import "ViewController.h"
#import "CompactConstraint.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //Removing default added constraints
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    self.textLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.textLabel1.translatesAutoresizingMaskIntoConstraints = NO;
    self.textLabel2.translatesAutoresizingMaskIntoConstraints = NO;

    [self.view removeConstraints:self.view.constraints];
    [self.textLabel removeConstraints:self.textLabel.constraints];
    [self.textLabel1 removeConstraints:self.textLabel1.constraints];
    [self.textLabel2 removeConstraints:self.textLabel2.constraints];
    [self.myView removeConstraints:self.myView.constraints];
    NSDictionary *views = @{
                            @"textLabel" : self.textLabel,
                            @"textLabel1" : self.textLabel1,
                            @"textLabel2" : self.textLabel2,
                            @"myView" : self.myView,
                            };
    NSDictionary *metrics = @{
                              @"myViewHeight" : @(40),
                              @"myViewWidth" : @(120),
                              };
    [self.view addCompactConstraints:@[
                                      @"myView.height = myViewHeight",
                                      @"myView.width = myViewWidth",
                                      
                                      @"V:|-(16)-[textLabel]",
                                     
                                      @"V:[myView]-(>=8)-|",
                                      
                                      @"H:|-(8)-[textLabel]-(>=8)-[textLabel1]-(8)-|",
                                      @"H:|-(8)-[textLabel]-(>=8)-[textLabel2]-(8)-|",
                                      @"H:[myView]-(8)-|",
                                      
                                      @"textLabel1.firstBaseline = textLabel.firstBaseline",
                                      @"textLabel2.baseline = textLabel.lastBaseline",
                    
                                      ]
                             metrics:metrics views:views];


}

- (BOOL)prefersStatusBarHidden{
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
