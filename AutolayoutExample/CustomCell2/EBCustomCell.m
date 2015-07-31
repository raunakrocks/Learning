//
//  EBCustomCell.m
//  CustomCell2
//
//  Created by Raunak Talwar on 7/31/15.
//  Copyright (c) 2015 Raunak Talwar. All rights reserved.
//

#import "EBCustomCell.h"

@implementation EBCustomCell


-(instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
