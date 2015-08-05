//
//  EBParser.m
//  Expedia
//
//  Created by Raunak Talwar on 7/27/15.
//  Copyright (c) 2015 Raunak Talwar. All rights reserved.
//

#import "EBParser.h"
#import "EBActivity.h"
@interface EBParser()

@property (nonatomic,strong) NSData *data;


@end

@implementation EBParser

+ (NSArray *) parseActivities:(NSData *)data
{
    NSMutableArray *parsedActivities =[[NSMutableArray alloc] init];
    id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];

    if ([json isKindOfClass:[NSDictionary class]])
    {
        NSDictionary *dictionary = (NSDictionary *)json;
        NSArray *activities  = dictionary[@"activities"];
        
        
        for (NSDictionary *object in activities)
        {
           
        NSString *identifier = object[@"id"];
        NSString *title = object[@"title"];
        NSString *imageURL = object[@"imageUrl"];
        NSString *fromPrice = object[@"fromPrice"];
        NSString *fromPriceLabel = object[@"fromPriceLabel"];
        NSNumber *durationInMillis = object[@"durationInMillis"];
            EBActivity *object = [[EBActivity alloc]init];
            object.identifier = identifier;
            object.title = title;
            object.imageURL = imageURL;
            object.fromPrice = fromPrice;
            object.fromPriceLabel = fromPriceLabel;
            object.durationInMillis = durationInMillis;
            [parsedActivities addObject:object];
        
        }
    
    }
  
    
    return  parsedActivities;
}

@end
