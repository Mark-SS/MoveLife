//
//  YDViewController.m
//  MoveLife
//
//  Created by gongliang on 13-9-5.
//  Copyright (c) 2013年 gongliang. All rights reserved.
//

#import "YDViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface YDViewController ()

@end

@implementation YDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(motionWasRecognized:) name:@"CPDeviceShaken" object:nil];
    
}

//添加一个摇晃事件
- (void)motionWasRecognized:(NSNotification *)notification {
    CABasicAnimation *shake = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
