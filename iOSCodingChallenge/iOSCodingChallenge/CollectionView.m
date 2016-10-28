//
//  CollectionView.m
//  iOSCodingChallenge
//
//  Created by Kevin Zou on 10/27/16.
//  Copyright © 2016 Touch of Modern. All rights reserved.
//

#import "CollectionView.h"
#import "ProductCollectionCell.h"


@implementation CollectionView

static NSString * const reuseIdentifier = @"Cell";

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
        _collectionView=[[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
        
        UIColor * lightGray = [UIColor colorWithRed:239.0f/255.0f
                                          green:240.0f/255.0f
                                           blue:241.0f/255.0f
                                          alpha:1.0f];
        
        [_collectionView setBackgroundColor: lightGray];
        [self.collectionView registerClass:[ProductCollectionCell class] forCellWithReuseIdentifier:reuseIdentifier];
        [self addSubview:self.collectionView];
    }
    return self;
}

@end
