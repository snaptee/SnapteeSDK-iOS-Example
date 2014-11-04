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

@implementation ViewController{
    UIImageView * backgroundView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // UI elements
    backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"affiliate.png"]];
    [backgroundView setContentMode:UIViewContentModeScaleAspectFill];
    [backgroundView setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [backgroundView setCenter:self.view.center];
    
    UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(0, backgroundView.frame.size.height/2, backgroundView.frame.size.width, backgroundView.frame.size.height/2)];
    [button setBackgroundColor:[UIColor clearColor]];
    [button addTarget:self action:@selector(designWithSnaptee:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:backgroundView];
    [self.view addSubview:button];
    
}
- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
    [backgroundView setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
}
#pragma mark button action
- (IBAction) designWithSnaptee:(id)sender{
    
    // Initialize Snaptee
    
    /*
     affiliateID: Assigned by Snaptee
     app_name: Optional. Will be shown in the action sheet when leaving Snaptee e.g. "Back to app_name"
     language: force SDK to display in a specific language (STLanguageDefault means to use device's language setting)
     */
    
    [STAffiliateManager instance].affiliateId = @"sdk-demo";
    [STAffiliateManager instance].appName = @"Snaptee SDK Example"; // Optional
    [STAffiliateManager instance].language = STLanguageDefault; // Optional
    
    /*
     image: UIImage passing to Snaptee
     file type: PNG or JPG
     caption: Optional. Description of the image. Typically entered by users
     */
    STViewController * stViewController = [[STViewController alloc] initWithImage:[UIImage imageNamed:@"sample2.jpg"]
                                                                         fileType:STImageFileTypeJPG
                                                                          caption:@"Funny bear!"];
    [stViewController setST_delegate:self];
    [stViewController setModalPresentationStyle:UIModalPresentationFormSheet];
    
    [self presentViewController:stViewController animated:YES completion:nil];
    
}

#pragma mark STViewController Delegate functions
- (void)STViewControllerDidFinish:(STViewController *)viewController{
    [viewController dismissViewControllerAnimated:YES completion:nil];
    NSLog(@"Snaptee: Finished! All orders in this session: %@", [STAffiliateManager instance].orderedItems);
}

#pragma mark STViewController Delegate functions (optional)
- (void)STViewControllerDidSaveDesign:(STViewController *)viewController{
    NSLog(@"Snaptee: Design saved!");
}
- (void)STViewControllerWillCheckout:(STViewController *)viewController{
    NSLog(@"Snaptee: Ready to checkout!");
}
- (void)STViewControllerDidCheckout:(STViewController *)viewController
                               item:(STOrderItem*)orderItem{
    NSLog(@"Snaptee: Order completed, order ID = %@", orderItem.orderId);
    NSLog(@"Snaptee: trackingURL = %@", orderItem.trackingURL);
}

 


@end
