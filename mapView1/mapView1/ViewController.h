//
//  ViewController.h
//  mapView1
//
//  Created by Raunak Talwar on 8/20/15.
//  Copyright (c) 2015 Raunak Talwar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
- (IBAction)setMap:(id)sender;

@end

