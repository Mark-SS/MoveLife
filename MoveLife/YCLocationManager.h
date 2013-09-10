//
//  YCLocationManager.h
//  MoveLife
//
//  Created by gongliang on 13-9-6.
//  Copyright (c) 2013年 gongliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface YCLocationManager : NSObject <CLLocationManagerDelegate,UIAccelerometerDelegate>

@property (nonatomic, strong) CLLocationManager *locationManager;

@property (nonatomic, assign) BOOL executingInBackgroud;// 是否属于后台定位

+ (YCLocationManager *)sharedInstance;

- (CLLocationManager *)locationManager;

@end
