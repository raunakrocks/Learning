//
//  ViewController.m
//  CustomCell2
//
//  Created by Raunak Talwar on 7/31/15.
//  Copyright (c) 2015 Raunak Talwar. All rights reserved.
//

#import "ViewController.h"
#import "EBCustomCell.h"
static NSString *identifier = @"tableViewIdentifierForCell";

@interface ViewController ()
@property (nonatomic,strong) NSArray *names;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    self.names=[[NSArray alloc] initWithObjects:@"India",@"Rio",@"China",@"USA",@"SA",@"SriLanka",@"Pakistan", nil ];
    [tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
//    [tableView setTableHeaderView:[[UIView alloc] initWithFrame:CGRectZero]];
    UINib *cellNib = [UINib nibWithNibName:@"EBCustomCell" bundle:[NSBundle mainBundle]];
    [tableView registerNib:cellNib forCellReuseIdentifier:@"tableViewIdentifierForCell"];
    tableView.dataSource = self;
    tableView.delegate = self;
    
    [self.view addSubview:tableView];
    

    
    

}


- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [_names count];
    
}
- (EBCustomCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    EBCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    //cell.primaryLabel.text = [_names objectAtIndex:indexPath.row];
    //cell.secondaryLabel.text = @"Secondary";
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Country App";
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
