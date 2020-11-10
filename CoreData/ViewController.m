//
//  ViewController.m
//  CoreData
//
//  Created by inaldo on 16/09/2018.
//  Copyright © 2018 InaldoRRibeiro. All rights reserved.
//

#import "ViewController.h"
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController ()

@property (nonatomic,strong) CLLocationManager *locationManager;
@property (weak, nonatomic) IBOutlet UILabel *latitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *longitudeLabel;

@end

@implementation ViewController

    - (void)viewDidLoad {
    [super viewDidLoad];
    
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
        
        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0 &&
            [CLLocationManager authorizationStatus] != kCLAuthorizationStatusAuthorizedWhenInUse
            //[CLLocationManager authorizationStatus] != kCLAuthorizationStatusAuthorizedAlways
            ) {
            // Will open an confirm dialog to get user's approval
            [_locationManager requestWhenInUseAuthorization];
            //[_locationManager requestAlwaysAuthorization];
        } else {
             [self.locationManager startUpdatingLocation];//Will update location immediately
        }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *location = [locations lastObject];
    self.latitudeLabel.text = [NSString stringWithFormat:@"%f", location.coordinate.latitude];
    self.longitudeLabel.text = [NSString stringWithFormat:@"%f", location.coordinate.longitude];
}




@end
