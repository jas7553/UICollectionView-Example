//
//  SimpleCollectionViewViewController.m
//  UICollectionView Example
//
//  Created by Jason A Smith on 11/15/14.
//  Copyright (c) 2014 Jason A. Smith. All rights reserved.
//

#import "SimpleCollectionViewViewController.h"

@interface SimpleCollectionViewViewController ()

/*
 * Number of cells to begin with.
 * This will be incremented and decremented when cells are added and deleted.
 */
@property NSInteger cellCount;

@end

@implementation SimpleCollectionViewViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.cellCount = 3;
    }
    return self;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.cellCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell"
                                                                           forIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor lightTextColor];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    // A cell has been tapped, so delete it
    [self removeItemAtIndex:indexPath];
}

#pragma mark - Private methods

- (void)removeItemAtIndex:(NSIndexPath *)indexPath {
    self.cellCount -= 1;
    
    [self.collectionView deleteItemsAtIndexPaths:@[indexPath]];
}

#pragma mark - IBActions

- (IBAction)addCell:(id)sender {
    self.cellCount += 1;
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:self.cellCount - 1 inSection:0];
    [self.collectionView insertItemsAtIndexPaths:@[indexPath]];
}

@end
