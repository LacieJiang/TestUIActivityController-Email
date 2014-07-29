//
//  ViewController.m
//  testActivity
//
//  Created by liyinjiang on 7/29/14.
//  Copyright (c) 2014 liyinjiang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)action:(id)sender {

  NSArray *activityItems = @[@"test"];

  __block UIActivityViewController *activityController =
  [[UIActivityViewController alloc] initWithActivityItems:activityItems
                                    applicationActivities:nil];

  activityController.excludedActivityTypes = @[UIActivityTypePostToWeibo,
                                               UIActivityTypePrint,
                                               UIActivityTypeCopyToPasteboard,
                                               UIActivityTypeAssignToContact,
                                               UIActivityTypeSaveToCameraRoll,
                                               UIActivityTypeAddToReadingList,
                                               UIActivityTypePostToFlickr,
                                               UIActivityTypePostToVimeo,
                                               UIActivityTypePostToTencentWeibo,
                                               UIActivityTypeAirDrop];

  void (^CompletionBlock)(NSString *, BOOL) = ^(NSString *activityType, BOOL completed) {
    if (completed == NO) {
      NSLog(@"Share not complete, return.");
      return;
    }
    NSString *shareTarget = @"None";
    if ([activityType isEqualToString:UIActivityTypePostToFacebook]) {
      shareTarget = @"Facebook";
    } else if ([activityType isEqualToString:UIActivityTypePostToTwitter]) {
      shareTarget = @"Twitter";
    } else if ([activityType isEqualToString:UIActivityTypeMail]) {
      shareTarget = @"Mail";
    } else if ([activityType isEqualToString:UIActivityTypeMessage]) {
      shareTarget = @"Message";
    }
  };

  activityController.completionHandler = CompletionBlock;
  [self presentViewController:activityController animated:YES completion:^{
    activityController.excludedActivityTypes = nil;
    activityController = nil;
  }];

}

@end
