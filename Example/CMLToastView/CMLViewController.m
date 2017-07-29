//
//  CMLViewController.m
//  ToastView
//
//  Created by caomeili on 06/13/2017.
//  Copyright (c) 2017 caomeili. All rights reserved.
//

#import "CMLViewController.h"
#import <CMLToastView/ToastSupport.h>

@interface CMLViewController ()
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (nonatomic, strong) ToastSupport *toast;
@end

@implementation CMLViewController
    
- (void)viewDidLoad {
    self.segmentedControl.selectedSegmentIndex = 0;
    [super viewDidLoad];
}
- (IBAction)loading:(id)sender {
    
    switch (self.segmentedControl.selectedSegmentIndex) {
        case 0:
        {
            self.toast = [[ToastSupportFactory sharedInstance] createLoading];
            [self.toast show];
            //            self.toast = [[ToastSupportFactory sharedInstance] createLoading];
            //           self.toast.completionBlock = ^{
            //               NSLog(@"completion");
            //           };
            //            [self.toast show];
        }
        break;
        case 1:
        [[[ToastSupportFactory sharedInstance] createLoading] showInTime:2.0].completionBlock = ^{
            NSLog(@"toast结束");
        };
        //        [[[ToastSupportFactory sharedInstance] createLoading] showInTime:2.0].completionBlock = ^{
        //            NSLog(@"qqq");
        //        };
        break;
        case 2:
        [[[ToastSupportFactory sharedInstance] createLoading] showWithDuration:TOAST_DURATION_SHORT];
        //        [[[ToastSupportFactory sharedInstance] createLoading] showWithDuration:TOAST_DURATION_SHORT];
        break;
        default:
        break;
    }
    
}
- (IBAction)loadingWithMessage:(id)sender {
    switch (self.segmentedControl.selectedSegmentIndex) {
        case 0:
        {
            self.toast = [[ToastSupportFactory sharedInstance] createLoadingWithMesssage:@"loading..." context:(__bridge void *)(self)];
            [self.toast show];
        }
        break;
        case 1:
        [[[ToastSupportFactory sharedInstance] createLoadingWithMesssage:@"loading..." context:(__bridge void *)(self)] showInTime:2.0];
        break;
        case 2:
        [[[ToastSupportFactory sharedInstance] createLoadingWithMesssage:@"loading..."] showWithDuration:TOAST_DURATION_SHORT];
        break;
        default:
        break;
    }
}
- (IBAction)loadingWithDetail:(id)sender {
    switch (self.segmentedControl.selectedSegmentIndex) {
        case 0:
        {
            self.toast = [[ToastSupportFactory sharedInstance] createLoadingWithMessage:@"loading..." detial:@"loadingWithDetail"];
            [self.toast show];
        }
        break;
        case 1:
        [[[ToastSupportFactory sharedInstance] createLoadingWithMessage:@"loading" detial:@"loadingWithDetail"] showInTime:2.0];
        break;
        case 2:
        [[[ToastSupportFactory sharedInstance] createLoadingWithMessage:@"loading" detial:@"loadingWithDetail"] showWithDuration:TOAST_DURATION_SHORT];
        break;
        default:
        break;
    }
}
- (IBAction)success:(id)sender {
    switch (self.segmentedControl.selectedSegmentIndex) {
        case 0:
        {
            self.toast = [[ToastSupportFactory sharedInstance] createSuccessWithMessage:nil];
            [self.toast show];
        }
        break;
        case 1:
        [[[ToastSupportFactory sharedInstance] createSuccessWithMessage:@"success"] showInTime:2.0];
        break;
        case 2:
        [[[ToastSupportFactory sharedInstance] createSuccessWithMessage:@"success"] showWithDuration:TOAST_DURATION_SHORT];
        break;
        default:
        break;
    }
}
- (IBAction)error:(id)sender {
    switch (self.segmentedControl.selectedSegmentIndex) {
        case 0:
        {
            self.toast = [[ToastSupportFactory sharedInstance] createErrorWithMessage:nil];
            [self.toast show];
        }
        break;
        case 1:
        [[[ToastSupportFactory sharedInstance] createErrorWithMessage:@"network error"] showInTime:2.0];
        break;
        case 2:
        [[[ToastSupportFactory sharedInstance] createErrorWithMessage:@"error"] showWithDuration:TOAST_DURATION_SHORT];
        break;
        default:
        break;
    }
    
}
- (IBAction)message:(id)sender {
    switch (self.segmentedControl.selectedSegmentIndex) {
        case 0:
        {
            self.toast = [[ToastSupportFactory sharedInstance] createMessage:@"this is a message"];
            [self.toast show];
        }
        break;
        case 1:
        [[[ToastSupportFactory sharedInstance] createMessage:@"success" context:(__bridge void *)(self)] showInTime:2.0];
        break;
        case 2:
        [[[ToastSupportFactory sharedInstance] createMessage:@"success"] showWithDuration:TOAST_DURATION_SHORT];
        break;
        default:
        break;
    }
    
}
- (IBAction)messageAndDetail:(id)sender {
    switch (self.segmentedControl.selectedSegmentIndex) {
        case 0:
        {
            self.toast = [[ToastSupportFactory sharedInstance] createMessage:@"message and detail" detail:@"xxxxxx"];
            
            [self.toast show];
        }
        break;
        case 1:
        [[[ToastSupportFactory sharedInstance] createMessage:@"message and detail" detail:@"ssssssaaaaaaaaaaaaaaaaaaaaa"] showInTime:2.0];
        break;
        case 2:
        [[[ToastSupportFactory sharedInstance] createMessage:@"message and detail" detail:@"dddddd"] showWithDuration:TOAST_DURATION_SHORT];
        break;
        default:
        break;
    }
    
}
- (IBAction)customToastOnce:(id)sender {
    UIView *aView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) - 100)];
    aView.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.5];
    [[[ToastSupportFactory sharedInstance] createLoadingWithCustomView:aView] showInTime:3.0];
}
    
- (IBAction)dismiss:(id)sender {
    [self.toast dissmiss];
}
- (IBAction)segmentedControlAction:(id)sender {
}
    
    @end
