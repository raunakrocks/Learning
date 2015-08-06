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
    //--------
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:@"http://wwwexpediacom.trunk.sb.karmalab.net/lx/api/search?location=Rome&startDate=03%2F30%2F2015&endDate=03%2F31%2F2015"] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSArray *activities = [EBParser parseActivities:data];
        _activities = activities;
        _rowCount = [activities count];
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            //Code for custom table view cell
            UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.frame];
            [tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
            tableView.translatesAutoresizingMaskIntoConstraints = NO;
            UINib *cellNib = [UINib nibWithNibName:@"EBCustomCell" bundle:[NSBundle mainBundle]];
            [tableView registerNib:cellNib forCellReuseIdentifier:@"tableViewIdentifierForCell"];
            tableView.dataSource = self;
            tableView.delegate = self;
            
            [self.view addSubview:tableView];
            
            NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(tableView);
            NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[tableView]|" options:0   metrics:nil views:viewsDictionary];
            [self.view addConstraints:constraints];
            constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(0)-[tableView]-(0)-|" options:0   metrics:nil views:viewsDictionary];
            [self.view addConstraints:constraints];
        });
    }];
    
    [dataTask resume];
    
    //-----------
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
