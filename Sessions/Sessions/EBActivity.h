//
//  EBActivity.h
//  Expedia
//
//  Created by Raunak Talwar on 7/24/15.
//  Copyright (c) 2015 Raunak Talwar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EBActivity : NSObject

@property (nonatomic, strong) NSString *identifier;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *imageURL;
@property (nonatomic, strong) NSString *fromPrice;
@property (nonatomic, strong) NSString *fromPriceLabel;
@property (nonatomic, strong) NSNumber *durationInMillis;
@property (nonatomic, assign) BOOL freeCancellation;

@end
