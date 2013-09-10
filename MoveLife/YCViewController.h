//
//  YCViewController.h
//  MoveLife
//
//  Created by gongliang on 13-9-5.
//  Copyright (c) 2013年 gongliang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface YCViewController : UIViewController <CLLocationManagerDelegate,UIAccelerometerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *stepLabel;

@end
