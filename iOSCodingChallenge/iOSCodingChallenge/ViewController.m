//
//  ViewController.m
//  iOSCodingChallenge
//
//  Created by Administrator on 5/6/15.
//  Copyright (c) 2015 Touch of Modern. All rights reserved.
//

#import "ViewController.h"
#import "ProductResponse.h"
#import "ProductCollectionCell.h"
#import "ProductApiRequest.h"
#import "Constants.h"

@interface ViewController ()

@end

@implementation ViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)initVariables {
    _imageDictionary = [[NSMutableDictionary alloc] init];
    _productRepo = [[ProductRepo alloc] init];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(refreshCollectionView)
                                                 name:NSNotification_ProductSucceed
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(displayError)
                                                 name:NSNotification_ProductError
                                               object:nil];
}

- (void) initView {
    [self setTitle:@"Touch of Modern"];
    _collectionView = [[CollectionView alloc] initWithFrame:self.view.bounds];
    _collectionView.collectionView.delegate = self;
    _collectionView.collectionView.dataSource = self;
    [self.view addSubview:_collectionView];
}

- (void)loadView {
    [super loadView];
    [self initVariables];
    [self initView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [_productRepo getProductsFromServer];
}

- (NSMutableArray *) sortProductByPrice: (NSMutableArray *) products {
    
    NSSortDescriptor *sortDescriptor;
    sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"price" ascending:true];
    NSMutableArray *sortDescriptors = [NSMutableArray arrayWithObject:sortDescriptor];
    NSMutableArray *sortedArray = [products sortedArrayUsingDescriptors:sortDescriptors];
    
    return sortedArray;
}

- (void) displayError {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Connect Error" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
    dispatch_async(dispatch_get_main_queue(), ^{
        [alert show];
    });
}

- (void) refreshCollectionView {
 
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.collectionView.collectionView reloadData];
    });
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [_productRepo.products count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ProductCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    ProductResponse * response = _productRepo.products[indexPath.row];
    [cell.imageView setImage:nil];
    [cell.nameLabel setText:response.name];
    [cell.priceLabel setText:[NSString stringWithFormat:@"$%.2f", response.price]];
    [cell setImageUrlString:response.imageUrl];
    
    UIImage * cachedImage = self.imageDictionary[response.name];
    
    if (cachedImage) {
        cell.imageView.image = cachedImage;
    } else {
        dispatch_async(dispatch_get_global_queue(0,0), ^{
            NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: response.imageUrl]];
            UIImage * image = [UIImage imageWithData: data];
            self.imageDictionary[response.name] = image;

            dispatch_async(dispatch_get_main_queue(), ^{
                if (cell.imageUrlString == response.imageUrl){
                    cell.imageView.image = image;
                }
            });
        });
    }
    
    return cell;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                        layout:(UICollectionViewLayout*)collectionViewLayout
        insetForSectionAtIndex:(NSInteger)section {
    
    UIEdgeInsets insets = UIEdgeInsetsMake(5, 5, 5, 5);
    
    return insets;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGSize returnSize = CGSizeZero;
    
    double width = (self.view.bounds.size.width / 2) - 10;
    returnSize = CGSizeMake(width, width);
    
    return returnSize;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
