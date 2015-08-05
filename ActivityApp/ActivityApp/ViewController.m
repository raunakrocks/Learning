//
//  ViewController.m
//  ActivityApp
//
//  Created by Raunak Talwar on 8/5/15.
//  Copyright (c) 2015 Raunak Talwar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *tableViewButton;

@property (weak, nonatomic) IBOutlet UIButton *collectionViewButton;
@end

@implementation ViewController
- (IBAction)tableViewButtonPressed:(id)sender {
    
    NSLog(@"Table View Button Pressed");

    UIViewController *viewController = [[UIViewController alloc] init];
    viewController.view.backgroundColor = [UIColor blueColor];
    UITableView *tableView = [[UITableView alloc] initWithFrame:viewController.view.frame];
    [viewController.view addSubview:tableView];
    [self.navigationController pushViewController:viewController animated:YES];
    
    
    

}
- (IBAction)collectionViewButtonPressed:(id)sender {

    NSLog(@"Collection View Button Pressed");
    UIViewController *viewController = [[UIViewController alloc] init];
    viewController.view.backgroundColor = [UIColor blueColor];
    UICollectionViewLayout *layout = [[UICollectionViewLayout alloc]init];
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:viewController.view.frame collectionViewLayout:layout];
    [viewController.view addSubview:collectionView];
    [self.navigationController pushViewController:viewController animated:YES];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
