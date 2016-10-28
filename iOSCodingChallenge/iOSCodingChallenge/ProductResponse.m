//
//  ProductResponse.m
//  iOSCodingChallenge
//
//  Created by Kevin Zou on 10/27/16.
//  Copyright © 2016 Touch of Modern. All rights reserved.
//

#import "ProductResponse.h"

@implementation ProductResponse

+(instancetype)responseFromDictionary:(NSDictionary *) dictionary {
    
    ProductResponse *response = [[ProductResponse alloc] init];
    
    NSString *nameString = [dictionary objectForKey:@"name"];
    response.name = nameString;
    
    NSString *imageUrl = [dictionary objectForKey:@"image"];
    response.imageUrl = imageUrl;
    
    NSString *desc = [dictionary objectForKey:@"description"];
    response.desc = desc;
    
    NSString * price = [dictionary objectForKey:@"price"];
    response.price = [price doubleValue];
    
    return response;
}


@end
