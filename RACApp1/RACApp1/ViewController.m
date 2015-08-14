//
//  ViewController.m
//  RACApp1
//
//  Created by Raunak Talwar on 8/13/15.
//  Copyright (c) 2015 Raunak Talwar. All rights reserved.
//

#import "ViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import <CompactConstraint/CompactConstraint.h>

@interface ViewController ()

@end

@implementation ViewController

- (BOOL)isValidUsername:(NSString *)username
{
    if([ username isEqual:@"raunak" ])
    {
        return YES;
    }
    else
    {
        return NO;
    }
}
- (BOOL)isValidPassword:(NSString *)password
{
    if([ password isEqual:@"123" ])
    {
        return YES;
    }
    else
    {
        return NO;
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.


    RACSignal *validUsernameSignal =
    [self.userName.rac_textSignal
     map:^id(NSString *text) {
         return @([self isValidUsername:text]);
     }];
    
    RACSignal *validPasswordSignal =
    [self.password.rac_textSignal
     map:^id(NSString *text) {
         return @([self isValidPassword:text]);
     }];
    RAC(self.password, backgroundColor) =
    [validPasswordSignal
     map:^id(NSNumber *passwordValid) {
         return [passwordValid boolValue] ? [UIColor clearColor] : [UIColor yellowColor];
     }];
    
    RAC(self.userName, backgroundColor) =
    [validUsernameSignal
     map:^id(NSNumber *passwordValid) {
         return [passwordValid boolValue] ? [UIColor clearColor] : [UIColor yellowColor];
     }];
    RACSignal *signUpActiveSignal =
    [RACSignal combineLatest:@[validUsernameSignal, validPasswordSignal]
                      reduce:^id(NSNumber *usernameValid, NSNumber *passwordValid) {
                          return @([usernameValid boolValue] && [passwordValid boolValue]);
                      }];
    [signUpActiveSignal subscribeNext:^(NSNumber *signupActive) {
        self.signInButton.enabled = [signupActive boolValue];
    }];
    
//    [[self.signInButton
//      rac_signalForControlEvents:UIControlEventTouchUpInside]
//     subscribeNext:^(id x) {
//         NSLog(@"button clicked");
//     }];
    [[self.signInButton
      rac_signalForControlEvents:UIControlEventTouchUpInside]
     subscribeNext:^(id x) {
         NSLog(@"button clicked");
     }];
    
    
    
    
//    [[RACSignal merge:@[validUsernameSignal,validPasswordSignal ]
//      ]
//     subscribeNext:^(id x) {
//         NSLog(@"Tapped [%@]", x);
//     
//     }] ;
//    RACSignal *signal = [RACObserve(self, userName) ];
//    
    
    
}

- (BOOL)prefersStatusBarHidden{
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
