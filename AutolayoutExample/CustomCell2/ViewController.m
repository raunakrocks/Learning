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
@property (nonatomic,strong) UITableView *tableView;

#define kTextContentString1 @"This is label1 This is label1 This is label1 This is label1 This is label1 This is label1 This is label1 This is label1 This is label1 This is label1This is label1 This is label1 This is label1 This is label1 This is label1This is label1 This is label1 This is label1 This is label1 This is label1This is label1 This is label1 This is label1 This is label1 This is label1This is label1 This is label1 This is label1 This is label1 This is label1This is label1 This is label1 This is label1 This is label1 This is label1This is label1 This is label1 This is label1 This is label1 This is label1This is label1 This is label1 This is label1 This is label1 This is label1This is label1 This is label1 This is label1 This is label1 This is label1This is label1 This is label1 This is label1 This is label1 This is label1"
#define kTextContentString2 @"This is label2 This is label2 This is label2 This is label2 This is label1 This is label1 This is label1 This is label1 This is label1 This is label1 This is label1 This is label1 This is label1 This is label1This is label1 This is label1 This is label1 This is label1 This is label1This is label1 This is label1 This is label1 This is label1 This is label1This is label1 This is label1 This is label1 This is label1 This is label1This is label1 This is label1 This is label1 This is label1 This is label1This is label1 This is label1 This is label1 This is label1 This is label1This is label1 This is label1 This is label1 This is label1 This is label1This is label1 This is label1 This is label1 This is label1 This is label1This is label1 This is label1 This is label1 This is label1 This is label1This is label1 This is label1 This is label1 This is label1 This is label1"
#define kImageContent  [UIImage imageNamed:@"image.png"]

@property (nonatomic,strong) EBCustomCell *prototypeCell;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   self.tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    self.names=[[NSArray alloc] initWithObjects:@"India",@"Rio",@"China",@"USA",@"SA",@"SriLanka",@"Pakistan", nil ];
    [self.tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    
    UINib *cellNib = [UINib nibWithNibName:@"EBCustomCell" bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:@"tableViewIdentifierForCell"];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.view addSubview:self.tableView];
    UITableView *tableView = self.tableView;
    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(tableView);
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(0)-[tableView]-(0)-|" options:0   metrics:nil views:viewsDictionary];
    [self.view addConstraints:constraints];
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(0)-[tableView]-(0)-|" options:0   metrics:nil views:viewsDictionary];
    [self.view addConstraints:constraints];
    
  
    
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [_names count];
    
}
- (EBCustomCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    EBCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    cell.customLabel1.text = kTextContentString1;
    cell.customLabel2.text = kTextContentString2;
    cell.customImageView.image = kImageContent;
    return cell;
}



- (CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //for label1
    NSString *stringForLabel1 = kTextContentString1;
    CGSize size1 = CGSizeMake(tableView.frame.size.width-8-70-16-8, CGFLOAT_MAX);
    CGRect labelRect1 = [stringForLabel1 boundingRectWithSize:size1 options:NSStringDrawingUsesLineFragmentOrigin attributes:nil context:nil];
    //for label2
    NSString *stringForLabel2 = kTextContentString2;
    CGSize size2 = CGSizeMake(tableView.frame.size.width-8-70-16-8, CGFLOAT_MAX);
    CGRect labelRect2 = [stringForLabel2 boundingRectWithSize:size2 options:NSStringDrawingUsesLineFragmentOrigin attributes:nil context:nil];
    
    NSLog(@"height1=%f",labelRect1.size.height);
    NSLog(@"height2=%f",labelRect2.size.height);
    return labelRect1.size.height+ 200.0f+labelRect2.size.height;
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Custom TableView App";
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
