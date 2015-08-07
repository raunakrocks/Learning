//
//  CustomCell.h
//  CollectionViewExample
//
//  Created by Raunak Talwar on 8/7/15.
//  Copyright (c) 2015 Raunak Talwar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *myImage;
@property (weak, nonatomic) IBOutlet UILabel *myDescriptionLabel;

@end
