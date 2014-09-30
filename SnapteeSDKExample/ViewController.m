//
//  ViewController.m
//  SnapteeSDKExample
//
//  Created by Guy Sum on 7/5/14.
//  Copyright (c) 2014 Snaptee. All rights reserved.
//

#import "ViewController.h"

// Import Snaptee View Controller
#import "STViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImageView* backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"affiliate.png"]];
    [backgroundView setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [backgroundView setCenter:self.view.center];
    [backgroundView setContentMode:UIViewContentModeScaleAspectFit];
    
    UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, backgroundView.frame.size.width, backgroundView.frame.size.height)];
    [button addTarget:self action:@selector(designWithSnaptee:) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:backgroundView];
    [self.view addSubview:button];
    
}

- (IBAction) designWithSnaptee:(id)sender{
    
    // Initialize Snaptee View Controller
    /*
    affiliateID: Assigned by Snaptee
    app_name: Optional. Will be shown in the action sheet when leaving Snaptee e.g. "Back to app_name"
    image: UIImage passing to Snaptee
    caption: Optional. Description of the image. Typically entered by users
    */
    
    STViewController * stViewController = [[STViewController alloc] initWithAffiliateID:@"sdk-demo"
                                                                                appName:@"Snaptee SDK Example"
                                                                                  image:[UIImage imageNamed:@"sample5.png"]
                                                                               fileType:STImageFileTypePNG
                                                                                caption:@"Goal!"];
    [stViewController setST_delegate:self];
    [stViewController setModalPresentationStyle:UIModalPresentationFormSheet]; // For iPad or iPhone 6+
    
    [self presentViewController:stViewController animated:YES completion:nil];
    
}

#pragma mark STViewController Delegate functions
- (void)STViewControllerDidFinish:(STViewController *)viewController{
    [viewController dismissViewControllerAnimated:YES completion:nil];
}


@end
