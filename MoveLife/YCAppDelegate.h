//
//  YCAppDelegate.h
//  MoveLife
//
//  Created by gongliang on 13-9-5.
//  Copyright (c) 2013年 gongliang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YCWindow.h"
#import <CoreMotion/CoreMotion.h>

@interface YCAppDelegate : UIResponder <UIApplicationDelegate,UIAccelerometerDelegate>


@property (strong, nonatomic) UIWindow *window;


@property (nonatomic, strong) CMMotionManager *motionManager;

@property (nonatomic, strong) NSOperationQueue *operationQueue;

@property (nonatomic, assign) NSUInteger shakeNum;

+ (YCAppDelegate *)shareInstance;



@end
