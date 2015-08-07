//
//  ViewController.h
//  CollectionViewExample
//
//  Created by Raunak Talwar on 8/7/15.
//  Copyright (c) 2015 Raunak Talwar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;

@end

