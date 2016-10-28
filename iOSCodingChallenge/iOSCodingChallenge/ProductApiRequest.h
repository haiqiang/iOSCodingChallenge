//
//  ProductApiRequest.h
//  iOSCodingChallenge
//
//  Created by Kevin Zou on 10/27/16.
//  Copyright © 2016 Touch of Modern. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProductApiRequest : NSObject

+ (void)makeRequest:(NSString *) urlString completionHandler:(void (^)(NSArray *, NSError *)) completion;

@end
