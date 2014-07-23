//
//  STViewController.h
//  SnapteeSDK 1.0
//
//  Created by Guy Sum on 8/4/14.
//  Copyright (c) 2014 Snaptee. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol STViewControllerDelegate;

@interface STViewController : UINavigationController

/*
 affiliateID: Assigned by Snaptee
 app_name: Optional. Will be shown in the action sheet when leaving Snaptee e.g. "Back to app_name"
 image: UIImage passing to Snaptee
 caption: Optional. Description of the image. Typically entered by users
 */
@property(nonatomic, weak) id<STViewControllerDelegate> ST_delegate;

typedef enum {
    STImageFileTypePNG=0,
    STImageFileTypeJPG=1
} STImageFileType;

- (id)initWithAffiliateID:(NSString*) affiliateID
                  appName:(NSString*) appName
                    image:(UIImage*) image
                  caption:(NSString*) caption;

- (id)initWithAffiliateID:(NSString*) affiliateID
                  appName:(NSString*) appName
                    image:(UIImage*) image
                 fileType:(STImageFileType) fileType
                  caption:(NSString*) caption;

@end


@protocol STViewControllerDelegate <NSObject>
@optional
- (void)STViewControllerWillDismiss:(STViewController *)viewController;
- (void)STViewControllerDidDismiss:(STViewController *)viewController;
@end
