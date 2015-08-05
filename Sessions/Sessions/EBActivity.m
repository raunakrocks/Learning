//
//  EBActivity.m
//  Expedia
//
//  Created by Raunak Talwar on 7/24/15.
//  Copyright (c) 2015 Raunak Talwar. All rights reserved.
//

#import "EBActivity.h"

@implementation EBActivity

-(instancetype) initWithIdentifier:(NSString *)identifier title:(NSString *)title imageURL:(NSString *)imageURL fromPrice:(NSString *)fromPrice fromPriceLabel:(NSString *)fromPriceLabel durationInMillis:(NSNumber *)durationInMillis
{
    self = [super init];
    if(self)
    {
        _identifier = identifier;
        _title = title;
        _imageURL = imageURL;
        _fromPrice = fromPrice;
        _fromPriceLabel = fromPriceLabel;
        _durationInMillis = durationInMillis;
     
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"identifier=%@ title=%@ imageURL=%@ fromPrice=%@ fromPriceLabel=%@ durationInMillis=%@",_identifier,_title,_imageURL,_fromPrice,_fromPriceLabel,_durationInMillis];
}
       
@end
