//
//  YCLocationManager.m
//  MoveLife
//
//  Created by gongliang on 13-9-6.
//  Copyright (c) 2013年 gongliang. All rights reserved.
//

#import "YCLocationManager.h"

@implementation YCLocationManager

+ (id)sharedInstance
{
    static dispatch_once_t onceToken;
    static YCLocationManager *_locationManager;
    dispatch_once(&onceToken, ^{
        _locationManager = [YCLocationManager new];
    });
    return _locationManager;
}

- (CLLocationManager *)locationManager
{
    if (!_locationManager) {
        self.executingInBackgroud = NO;
        _locationManager = [[CLLocationManager alloc]init];
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest; //set best precision
        _locationManager.delegate = self;
        _locationManager.distanceFilter = 0.0f;
        [_locationManager startUpdatingLocation];
    }
    return _locationManager;
}

#pragma mark -
#pragma mark location delegate
//方向变化的回调函数
- (void)locationManager:(CLLocationManager *)manager
       didUpdateHeading:(CLHeading *)newHeading
{
    
}

//方向变化的回调函数
- (BOOL)locationManagerShouldDisplayHeadingCalibration:(CLLocationManager *)manager
{
    return YES;
}

//位置变化的回调
- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations {
    NSLog(@"self.executingInBackgroud = %d",self.executingInBackgroud);
    if (self.executingInBackgroud) {
        NSLog(@"后台定位");
    }
    else 
    {
        NSLog(@"前台定位");
    }
//    NSLog(@"------->  %d  ,locations = %@",a++,locations);
    
}

//定位出错
- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error {
    NSLog(@"error = %@",error);
}


@end
