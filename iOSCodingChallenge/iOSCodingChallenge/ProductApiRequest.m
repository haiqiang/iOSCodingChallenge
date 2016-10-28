//
//  ProductApiRequest.m
//  iOSCodingChallenge
//
//  Created by Kevin Zou on 10/27/16.
//  Copyright © 2016 Touch of Modern. All rights reserved.
//

#import "ProductApiRequest.h"

@implementation ProductApiRequest

+ (void)makeRequest:(NSString *) urlString completionHandler:(void (^)(NSArray *, NSError *)) completion {
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [NSURLConnection sendAsynchronousRequest:urlRequest queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
     {
         if (error)
         {
             NSLog(@"Error,%@", [error localizedDescription]);
             completion(nil, error);
         }
         else
         {
             NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
             NSArray *jsonObject = [NSJSONSerialization JSONObjectWithData:[ret dataUsingEncoding:NSUTF8StringEncoding] options:0 error:NULL];
             completion(jsonObject, error);
         }
     }];
}

@end
