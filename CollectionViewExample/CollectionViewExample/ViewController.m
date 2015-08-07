//
//  ViewController.m
//  CollectionViewExample
//
//  Created by Raunak Talwar on 8/7/15.
//  Copyright (c) 2015 Raunak Talwar. All rights reserved.
//

#import "ViewController.h"
#import "CustomCell.h"

@interface ViewController ()
{
    NSArray *arrayOfImages;
    NSArray *arrayOfDescription;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.myCollectionView setDataSource:self];
    [self.myCollectionView setDelegate:self];
    
    arrayOfImages = [[NSArray alloc] initWithObjects:@"1.png",@"1.png",@"1.png",@"1.png",@"1.png", nil];
    arrayOfDescription = [[NSArray alloc] initWithObjects:@"One",@"One",@"One",@"One",@"One",nil];
    
    
    
}

//Delegate methods

- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [arrayOfDescription count];
}

- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    CustomCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    [[cell myImage]setImage:[UIImage imageNamed:[arrayOfImages objectAtIndex:indexPath.item]]];
    [[cell myDescriptionLabel] setText:[arrayOfDescription objectAtIndex:indexPath.item]];
    return cell;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
