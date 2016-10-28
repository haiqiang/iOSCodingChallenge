//
//  ProductCollectionCell.m
//  iOSCodingChallenge
//
//  Created by Kevin Zou on 10/27/16.
//  Copyright © 2016 Touch of Modern. All rights reserved.
//

#import "ProductCollectionCell.h"

@implementation ProductCollectionCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat cellSize = self.contentView.bounds.size.width;
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, cellSize, cellSize - 40)];
        [_imageView setClipsToBounds:YES];
        [_imageView setBackgroundColor:UIColor.grayColor];
        [self.contentView addSubview:_imageView];
        
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, cellSize - 40, cellSize, 20)];
        [self.contentView addSubview:_nameLabel];
        
        _priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, cellSize - 20, cellSize, 20)];
        [self.contentView addSubview:_priceLabel];
        
        _imageUrlString = [[NSString alloc] init];
        
    }
    return self;
}

- (void) prepareForReuse {
    [super prepareForReuse];
    self.imageView.image = nil;
}

@end
