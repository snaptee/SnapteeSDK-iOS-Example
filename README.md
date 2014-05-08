SnapteeSDKExample
=================

iOS Snaptee SDK example project

To install:

1) Add Snaptee SDK static library to your project
- /Assets/
- /include/
- libSnapteeSDKLibrary.a

2) Add AFNetworking framework 
https://github.com/AFNetworking/AFNetworking

3) Add Stripe framework 
https://github.com/stripe/stripe-ios

4) In your app, add the following code to present Snaptee

- Import Snaptee View Controller
```objc
#import "STViewController.h"
```
    
- Initialize Snaptee View Controller
    - affiliateID: Assigned by Snaptee
    - app_name: Optional. Will be shown in the action sheet when leaving Snaptee e.g. "Back to app_name"
    - image: UIImage passing to Snaptee
    - caption: Optional. Description of the image. Typically entered by users
```objc
STViewController * stViewController = [[STViewController alloc] initWithAffiliateID:@"fuzel-testing"
                                                                           app_name:@"Fuzel"
                                                                              image:[UIImage imageNamed:@"sample.png"]
                                                                            caption:@"Testing Caption!"];
[self presentViewController:stViewController animated:YES completion:nil];
```
