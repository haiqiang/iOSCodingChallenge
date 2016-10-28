//
//  ProductRepo.m
//  iOSCodingChallenge
//
//  Created by Kevin Zou on 10/27/16.
//  Copyright © 2016 Touch of Modern. All rights reserved.
//

#import "ProductRepo.h"
#import "ProductApiRequest.h"
#import "ProductResponse.h"
#import "Constants.h"

@implementation ProductRepo

static NSString *const iosCodingChallengeUrlString = @"https://public.touchofmodern.com/ioschallenge.json";

- (instancetype)init
{
    self = [super init];
    if (self) {
        _products = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)getProductsFromServer {
    [self clear];
    [ProductApiRequest makeRequest:iosCodingChallengeUrlString completionHandler:^(NSArray * data, NSError * error) {
        if (error) {
            NSLog(@"Error,%@", [error localizedDescription]);
            [[NSNotificationCenter defaultCenter] postNotificationName:NSNotification_ProductError object:nil];
        } else if (data) {
            for (NSDictionary *productDictionary in data) {
                ProductResponse * productResponse = [ProductResponse responseFromDictionary:productDictionary];
                [_products addObject:productResponse];
            }
            _products = [self sortProductByPrice:_products];
            [[NSNotificationCenter defaultCenter] postNotificationName:NSNotification_ProductSucceed object:nil];
        }
    }];
}

- (NSMutableArray *) sortProductByPrice: (NSMutableArray *) products {
    
    NSSortDescriptor *sortDescriptor;
    sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"price" ascending:true];
    NSMutableArray *sortDescriptors = [NSMutableArray arrayWithObject:sortDescriptor];
    NSMutableArray *sortedArray = [products sortedArrayUsingDescriptors:sortDescriptors];
    
    return sortedArray;
}

- (void) clear {
    [_products removeAllObjects];
}

- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
