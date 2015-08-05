//
//  EBParser.h
//  Expedia
//
//  Created by Raunak Talwar on 7/27/15.
//  Copyright (c) 2015 Raunak Talwar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EBActivity.h"
@interface EBParser : NSObject

+ (NSArray *) parseActivities:(NSData *)data;

@end
