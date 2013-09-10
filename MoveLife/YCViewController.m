//
//  YCViewController.m
//  MoveLife
//
//  Created by gongliang on 13-9-5.
//  Copyright (c) 2013年 gongliang. All rights reserved.
//

#import "YCViewController.h"
#import "YCLocationManager.h"
#import "YCAppDelegate.h"

@interface YCViewController ()

//@property (nonatomic, assign) NSInteger stepNum;//记录步数

@end

@implementation YCViewController

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:kYCShake
                                                  object:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(motionWasRecognized:)
                                                 name:kYCShake
                                            object:nil];

}

//-(BOOL)canBecomeFirstResponder {
//    return NO;
//}
//
//-(void)viewDidAppear:(BOOL)animated {
//    [super viewDidAppear:animated];
//    [self becomeFirstResponder];
//}
//
//- (void)viewWillDisappear:(BOOL)animated {
//    [self resignFirstResponder];
//    [super viewWillDisappear:animated];
//}
//
////Add the motionEnded method to your View Controller:
//- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
//{
//    if (motion == UIEventSubtypeMotionShake)
//    {
//        static int a = 0;
//        NSLog(@"摇晃了第 %04d 次",++a);
//        self.stepLabel.text = [NSString stringWithFormat:@"步数:%d",++self.stepNum];
//
//    }
//}

//添加一个摇晃事件
- (void)motionWasRecognized:(NSNotification *)notification
{
    self.stepLabel.text = [NSString stringWithFormat:@"步数:%d",[notification.userInfo[@"shake"]intValue]];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
