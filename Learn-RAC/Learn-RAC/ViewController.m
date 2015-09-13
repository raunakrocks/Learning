//
//  ViewController.m
//  Learn-RAC
//
//  Created by Raunak Talwar on 9/12/15.
//  Copyright © 2015 Raunak Talwar. All rights reserved.
//

#import "ViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.name = @"empty";
    // Do any additional setup after loading the view, typically from a nib.
    //----using subscribeNext and RACObserve to create a signal--------------------
    RACSignal *signal = RACObserve(self, name);
    [signal subscribeNext:^(id x) {
        NSLog(@"%@",self.name);
    }];
    self.name = @"raunsk";
    self.name = @"rajat";
    self.name = @"nitika";
    
    
    /////----------using map----------------------
    self.number = @5;
    RACSignal *signalOnNumber = RACObserve(self, number);
    [[signalOnNumber map:^id(NSNumber *value) {
        return [value stringValue];
    }]
    subscribeNext:^(NSString *string) {
        NSLog(@"%@",string);
    }];
    
    self.number = @10;
    
    //----------------using combineLatest ---------------------
    RAC(self,str1) = [RACSignal combineLatest:@[signal,signalOnNumber]
     reduce:^id(NSString *string,NSString *numberString){
         return [NSString stringWithFormat:@"%@:%@",string,numberString];
     }
     ];
    NSLog(@"%@",self.str1);
    
    //---using Filters---------
    self.num1= @5;
    self.num1= @18;
    RACSignal *numberSignal = RACObserve(self, num1);
    [[numberSignal filter:^BOOL(id value) {
        return value>5;
    }]
    subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
    self.num1 = @9;
    self.num1= @19;
    
    ///-----using Bindings------
    self.myTextFieldString = @"raunak";
    RACSignal *stingSignal = RACObserve(self, myTextFieldString);
    RAC(self.myTextField,text) = stingSignal;
    self.myTextFieldString = @"poonam";
    self.myTextFieldString = @"talwar";
    self.myTextFieldString = @"vandit";
    
    //-------using NSArray + rac_textSignal and enabling button example-----
    
    NSArray *signalArray = @[self.firstNameField.rac_textSignal,self.lastNameField.rac_textSignal];
    
    RAC(self.button,enabled) = [RACSignal combineLatest:signalArray reduce:^id(NSString *firstName, NSString *lastName){
        return @(firstName.length>0&&lastName.length>0);
    }];
    
    
    //using rac_signalForControlEvents
    
    [[self.myButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        NSLog(@"my button is getting pressed");
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
