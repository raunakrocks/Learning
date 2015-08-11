//
//  ActivityTableViewController.h
//  ActivityApp
//
//  Created by Raunak Talwar on 8/6/15.
//  Copyright (c) 2015 Raunak Talwar. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ButtonPressedProtocolDelegate<NSObject>

- (void)backButtonPressed;

@end

@interface ActivityTableViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>



@end
