//
//  ViewController.m
//  test
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
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    self.myView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view removeConstraints:self.view.constraints];
    [self.myView removeConstraints:self.myView.constraints];
    

    NSDictionary *views = @{
                            
                            @"myView" : self.myView,
                            };
    NSDictionary *metrics = @{
                              
                              };
    [self.view addCompactConstraints:@[
                                       @"V:|-(>=8)-[myView(==20)]-(>=8)-|",
                                       @"H:|-(>=8)-[myView(==20)]-(>=8)-|",
                                       ] metrics:nil views:views];



}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
