//
//  EBCustomCell.m
//  Expedia
//
//  Created by Raunak Talwar on 8/3/15.
//  Copyright (c) 2015 Raunak Talwar. All rights reserved.
//

#import "EBCustomCell.h"

@implementation EBCustomCell
-(instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
   // self.customImageView.contentMode = UIViewContentModeScaleToFill;
    self.customImageView.contentMode = UIViewContentModeScaleAspectFit;
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void) prepareForReuse
{
    [super prepareForReuse];
    
    self.customImageView.image = nil;
}

@end
