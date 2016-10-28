//
//  ProductCollectionCell.h
//  iOSCodingChallenge
//
//  Created by Kevin Zou on 10/27/16.
//  Copyright © 2016 Touch of Modern. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductCollectionCell : UICollectionViewCell

@property (strong, nonatomic) NSString * imageUrlString;
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UILabel * nameLabel;
@property (strong, nonatomic) UILabel * priceLabel;

- (void)loadImage:(NSURL *)imageURL;

@end
