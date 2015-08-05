//
//  EBCustomCell.m
//  CustomCell2
//
//  Created by Raunak Talwar on 7/31/15.
//  Copyright (c) 2015 Raunak Talwar. All rights reserved.
//

#import "EBCustomCell.h"

@interface EBCustomCell()



@end

@implementation EBCustomCell


-(instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
       
    
    
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // Make sure the contentView does a layout pass here so that its subviews have their frames set, which we
    // need to use to set the preferredMaxLayoutWidth below.
    [self.contentView setNeedsLayout];
    [self.contentView layoutIfNeeded];
    
    // Set the preferredMaxLayoutWidth of the mutli-line bodyLabel based on the evaluated width of the label's frame,
    // as this will allow the text to wrap correctly, and as a result allow the label to take on the correct height.
    self.customLabel1.preferredMaxLayoutWidth = CGRectGetWidth(self.textLabel.frame);
    self.customLabel2.preferredMaxLayoutWidth = CGRectGetWidth(self.textLabel.frame);
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
