//
//  ViewController.m
//  RACApp2
//
//  Created by Raunak Talwar on 8/14/15.
//  Copyright (c) 2015 Raunak Talwar. All rights reserved.
//

#import "ViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
@interface ViewController ()<UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *username;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view,

    NSArray *numbers = @ [ @1, @2, @3];
    RACSequence *sequence = [ numbers.rac_sequence map:^id(NSNumber *number) {
        return @([number intValue] * [number intValue]);
    }];
    NSLog(@"%@",sequence.head);
    
    //Using RACObserve
    
    [self.username becomeFirstResponder];
    [RACObserve(self, username.text)
     subscribeNext:^(NSString *name) {
        NSLog(@"%@", name);
    }];


    self.username.text = @"Hi";

    
    
    
    
}
- (IBAction)doneButtonClicked:(id)sender {
    NSLog(@"self.textField.text =%@", self.username.text);

}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSLog(@"textFieldDidBeginEditing");
    
}

- (IBAction)touchUpInside:(id)sender {
    NSLog(@"self.touchupinside");
}

- (IBAction)valueChanged:(id)sender {
    NSLog(@"self.textField.text =%@", self.username.text);
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
