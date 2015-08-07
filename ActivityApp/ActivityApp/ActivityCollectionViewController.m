//
//  ActivityCollectionViewController.m
//  ActivityApp
//
//  Created by Raunak Talwar on 8/7/15.
//  Copyright (c) 2015 Raunak Talwar. All rights reserved.
//

#import "ActivityCollectionViewController.h"
#import "CustomCollectionViewCell.h"

@interface ActivityCollectionViewController()
{
    NSArray *arrayOfImages;
    NSArray *arrayOfDescription;
}

@property (nonatomic, strong)UICollectionView *collectionView;
@end



@implementation ActivityCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    arrayOfImages = [[NSArray alloc] initWithObjects:@"1.png",@"1.png",@"1.png",@"1.png",@"1.png", nil];
    arrayOfDescription = [[NSArray alloc] initWithObjects:@"One",@"One",@"One",@"One",@"One",nil];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    self.collectionView.backgroundColor = [UIColor redColor];
    UINib *cellNib = [UINib nibWithNibName:@"CustomCollectionViewCell" bundle:[NSBundle mainBundle]];
    [self.collectionView registerNib:cellNib forCellWithReuseIdentifier:@"Cell"];

    [self.collectionView setDataSource:self];
    [self.collectionView setDelegate:self];
    
    [self.view addSubview:self.collectionView];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(200, 200);
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
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    [[cell myImage]setImage:[UIImage imageNamed:[arrayOfImages objectAtIndex:indexPath.item]]];
    [[cell myDescriptionLabel] setText:[arrayOfDescription objectAtIndex:indexPath.item]];
    return cell;
    
}

@end
