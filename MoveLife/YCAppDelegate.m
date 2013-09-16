//
//  YCAppDelegate.m
//  MoveLife
//
//  Created by gongliang on 13-9-5.
//  Copyright (c) 2013年 gongliang. All rights reserved.
//

#import "YCAppDelegate.h"
#import "YCLocationManager.h"

@implementation YCAppDelegate

+ (YCAppDelegate *)shareInstance
{
    return (YCAppDelegate *)[UIApplication sharedApplication].delegate;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[[YCLocationManager sharedInstance] locationManager]startUpdatingLocation];
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard"
                                                         bundle:nil];
    self.window.rootViewController = [storyboard instantiateInitialViewController];
    [self.window makeKeyAndVisible];
    [self initShake];
    return YES;
}

- (CMMotionManager *)motionManager
{
    if (!_motionManager) {
        _motionManager = [[CMMotionManager alloc]init];
        _motionManager.accelerometerUpdateInterval = 0.5f;//告诉 manager,更新频率是100Hz
        _operationQueue = [[NSOperationQueue alloc]init];
    }
    return _motionManager;
}

- (void)initShake {

    [self.motionManager startAccelerometerUpdatesToQueue:_operationQueue
                                             withHandler:^(CMAccelerometerData *latestAcc, NSError *error) {
        dispatch_sync(dispatch_get_main_queue(), ^(void) {
            // 所有操作进行同步
            @synchronized(self.motionManager) {
                BOOL _isShake = [self isShake:_motionManager.accelerometerData];
                if (_isShake) {
                    NSLog(@"摇晃次数 %04u",++self.shakeNum);
                    [[NSNotificationCenter defaultCenter] postNotificationName:kYCShake
                                                                        object:nil
                                                                      userInfo:@{@"shake":@(self.shakeNum)}];
                }
            }
            
        });
        
    }];
    
}


- (BOOL)isShake:(CMAccelerometerData *)newestAccel {
    
    BOOL isShake = NO;
          // 三个方向任何一个方向的加速度大于1.5就认为是处于摇晃状态，当都小于1.5时认为摇奖结束。
    if (ABS(newestAccel.acceleration.x) > 1.5 || ABS(newestAccel.acceleration.y) > 1.5 || ABS(newestAccel.acceleration.z) > 1.5) {
        isShake = YES;
    }
    return isShake;
    
}

							
- (void)applicationWillResignActive:(UIApplication *)application
{
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [YCLocationManager sharedInstance].executingInBackgroud = YES;
    [[YCLocationManager sharedInstance].locationManager setDesiredAccuracy:kCLLocationAccuracyHundredMeters];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    [YCLocationManager sharedInstance].executingInBackgroud = NO;
    [[YCLocationManager sharedInstance].locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    
}

- (void)applicationDidFinishLaunching:(UIApplication *)application
{
    application.applicationSupportsShakeToEdit = YES;
}

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (void)aa
{
    NSLog(@"11");
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    
}

@end
