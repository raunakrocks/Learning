//
//  ViewController.m
//  Sessions
//
//  Created by Raunak Talwar on 8/4/15.
//  Copyright (c) 2015 Raunak Talwar. All rights reserved.
//

#import "ViewController.h"
#import "EBCustomCell.h"
#import "EBActivity.h"
#import "EBParser.h"
static NSString *identifier = @"tableViewIdentifierForCell";
@interface ViewController ()
@property (nonatomic) NSInteger rowCount;
@property (nonatomic,strong) NSArray *activities;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

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

}

#pragma tableView Methods
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _rowCount;
    
}
- (EBCustomCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%d", [NSThread isMainThread]);
    EBCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    cell.tag = indexPath.row;
    
    EBActivity *activity = [_activities objectAtIndex:indexPath.row];
    dispatch_queue_t imageQueue = dispatch_queue_create("Image Queue", NULL);
    cell.customTitle.text = activity.title;
    cell.customFromPrice.text = activity.fromPrice;
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

- (CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    EBActivity *activity = [_activities objectAtIndex:indexPath.row];
    
    //for label1
    NSString *stringForCustomTitile = activity.title;
    CGSize size1 = CGSizeMake(tableView.frame.size.width-8-70-16-8, CGFLOAT_MAX);
    CGRect labelRect1 = [stringForCustomTitile boundingRectWithSize:size1 options:NSStringDrawingUsesLineFragmentOrigin attributes:nil context:nil];
    //for label2
    NSString *stringForFromPirce = activity.fromPrice;
    CGSize size2 = CGSizeMake(tableView.frame.size.width-8-70-16-8, CGFLOAT_MAX);
    CGRect labelRect2 = [stringForFromPirce boundingRectWithSize:size2 options:NSStringDrawingUsesLineFragmentOrigin attributes:nil context:nil];
    
    NSLog(@"height1=%f",labelRect1.size.height);
    NSLog(@"height2=%f",labelRect2.size.height);
    return labelRect1.size.height+ 100.0f+labelRect2.size.height;

    
    
    
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Activities App";
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
