//
//  ActivityCollectionViewController.m
//  ActivityApp
//
//  Created by Raunak Talwar on 8/7/15.
//  Copyright (c) 2015 Raunak Talwar. All rights reserved.
//

#import "ActivityCollectionViewController.h"
#import "CustomCollectionViewCell.h"
#import "EBActivity.h"
#import "EBParser.h"
@interface ActivityCollectionViewController()
@property (nonatomic,strong) NSArray *activities;
@end



@implementation ActivityCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor orangeColor];
    collectionView.translatesAutoresizingMaskIntoConstraints = NO;
    UINib *cellNib = [UINib nibWithNibName:@"CustomCollectionViewCell" bundle:[NSBundle mainBundle]];
    [collectionView registerNib:cellNib forCellWithReuseIdentifier:@"Cell"];

    [collectionView setDataSource:self];
    [collectionView setDelegate:self];
    [self.view addSubview:collectionView];
    
    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(collectionView);
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[collectionView]|" options:0   metrics:nil views:viewsDictionary];
    [self.view addConstraints:constraints];
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[collectionView]|" options:0   metrics:nil views:viewsDictionary];
    [self.view addConstraints:constraints];
    UIActivityIndicatorView *loadingActivityIndicatorView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    loadingActivityIndicatorView.frame = CGRectMake(175, 280, 20, 20);
    [collectionView addSubview:loadingActivityIndicatorView];
    [loadingActivityIndicatorView startAnimating];

    // Do any additional setup after loading the view.
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:@"http://wwwexpediacom.trunk.sb.karmalab.net/lx/api/search?location=Rome&startDate=03%2F30%2F2015&endDate=03%2F31%2F2015"] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        NSArray *activities = [EBParser parseActivities:data];
        self.activities = activities;
        dispatch_async(dispatch_get_main_queue(), ^{
            [loadingActivityIndicatorView stopAnimating];
            [collectionView reloadData];
        });
        
    }];
    [dataTask resume];
    
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(180,180);
}

//Delegate methods

- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
 
    return [self.activities count];
}

- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
 
     static NSString *cellIdentifier = @"Cell";
     CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
     cell.tag = indexPath.row;
     EBActivity *activity = [_activities objectAtIndex:indexPath.row];
     dispatch_queue_t imageQueue = dispatch_queue_create("Image Queue", NULL);
    [[cell customTitle] setText:activity.title];
    [[cell priceLabel] setText:activity.fromPrice];
    dispatch_async(imageQueue, ^{
        
        NSLog(@"%d", [NSThread isMainThread]);
        NSString *imageURL = [NSString stringWithFormat:@"http:%@",activity.imageURL];
        NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageURL]];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if(cell.tag == indexPath.row)
            {
                cell.customImageView.image = [UIImage imageWithData:imageData];
            }
            else
            {
                NSLog(@"GFauled match");
            }
        });
        
    });

    return cell;
   
    
}

@end
