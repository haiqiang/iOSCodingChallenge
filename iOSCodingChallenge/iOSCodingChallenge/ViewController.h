//
//  ViewController.h
//  iOSCodingChallenge
//
//  Created by Administrator on 5/6/15.
//  Copyright (c) 2015 Touch of Modern. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionView.h"
#import "ProductRepo.h"

@interface ViewController : UIViewController<UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong, nonatomic) NSMutableDictionary * imageDictionary;
@property (strong, nonatomic) CollectionView * collectionView;
@property (strong, nonatomic) ProductRepo * productRepo;

@end
