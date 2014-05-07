//
//  STViewController.h
//  SnapteeSDK 1.0
//
//  Created by Guy Sum on 8/4/14.
//  Copyright (c) 2014 Snaptee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface STViewController : UINavigationController

/*
 
 affiliateID: Assigned by Snaptee
 app_name: Optional. Will be shown in the action sheet when leaving Snaptee e.g. "Back to app_name"
 image: UIImage passing to Snaptee
 caption: Optional. Description of the image. Typically entered by users
 
 */

- (id)initWithAffiliateID:(NSString*) affiliateID
                 app_name:(NSString*) app_name
                    image:(UIImage*)image
                  caption:(NSString*) caption;
    

@end
