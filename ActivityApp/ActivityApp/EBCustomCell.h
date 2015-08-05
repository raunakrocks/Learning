//
//  EBCustomCell.h
//  Expedia
//
//  Created by Raunak Talwar on 8/3/15.
//  Copyright (c) 2015 Raunak Talwar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EBCustomCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *customImageView;
@property (weak, nonatomic) IBOutlet UILabel *customTitle;
@property (weak, nonatomic) IBOutlet UILabel *customFromPrice;

@end
