//
//  ViewController.h
//  Learn-RAC
//
//  Created by Raunak Talwar on 9/12/15.
//  Copyright © 2015 Raunak Talwar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *myButton;

@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSNumber *number;
@property (nonatomic,strong) NSString *str1;
@property (nonatomic,strong) NSNumber *num1;
@property (strong, nonatomic) IBOutlet UITextField *myTextField;
@property (nonatomic,strong) NSString *myTextFieldString;
@property (strong, nonatomic) IBOutlet UITextField *firstNameField;
@property (strong, nonatomic) IBOutlet UITextField *lastNameField;
@property (strong, nonatomic) IBOutlet UIButton *button;
@end

