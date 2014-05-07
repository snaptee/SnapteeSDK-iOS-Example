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
    
    UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 250, 40)];
    [button setCenter:self.view.center];
    [button setTitle:@"Design with Snaptee" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor redColor]];
    [button addTarget:self action:@selector(designWithSnaptee:) forControlEvents:UIControlEventTouchUpInside];
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
    STViewController * stViewController = [[STViewController alloc] initWithAffiliateID:@"my-camera-id"
                                                                               app_name:@"My Camera"
                                                                                  image:[UIImage imageNamed:@"sample.png"]
                                                                                caption:@"Testing Caption!"];
    
    [self presentViewController:stViewController animated:YES completion:nil];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
