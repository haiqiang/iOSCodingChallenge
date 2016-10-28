//
//  ProductResponse.h
//  iOSCodingChallenge
//
//  Created by Kevin Zou on 10/27/16.
//  Copyright © 2016 Touch of Modern. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProductResponse : NSObject

@property (strong, nonatomic, readwrite) NSString *name;
@property (strong, nonatomic, readwrite) NSString *imageUrl;
@property (strong, nonatomic, readwrite) NSString *desc;
@property (nonatomic, readwrite) double price;

+(instancetype)responseFromDictionary:(NSDictionary *) dictionary;

@end
