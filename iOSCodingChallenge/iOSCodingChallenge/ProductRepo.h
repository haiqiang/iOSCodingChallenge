//
//  ProductRepo.h
//  iOSCodingChallenge
//
//  Created by Kevin Zou on 10/27/16.
//  Copyright © 2016 Touch of Modern. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProductRepo : NSObject

@property (strong, nonatomic) NSMutableArray * products;

- (void)getProductsFromServer;
- (NSMutableArray *) sortProductByPrice: (NSMutableArray *) products;
- (void) clear;

@end
