//
//  STViewController.h
//  SnapteeSDK 1.0
//
//  Created by Guy Sum on 8/4/14.
//  Copyright (c) 2014 Snaptee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "STAffiliateManager.h"

@class STOrderItem;

@protocol STViewControllerDelegate;

extern NSString * const STNotificationDidFinish;
extern NSString * const STNotificationDidSaveDesign;
extern NSString * const STNotificationWillCheckout;
extern NSString * const STNotificationDidCheckout;

@interface STViewController : UINavigationController

@property(nonatomic, weak) id<STViewControllerDelegate> ST_delegate;

typedef enum {
    STImageFileTypePNG=0,
    STImageFileTypeJPG=1
} STImageFileType;

/*
 image: UIImage passing to Snaptee
 fileType: JPG or PNG
 caption: Optional. Description of the image. Typically entered by users
 */

- (id)initWithImage:(UIImage *)image;

- (id)initWithImage:(UIImage*)image
            caption:(NSString*) caption;


#pragma mark - Deprecated Methods

- (id)initWithImage:(UIImage *)image
           fileType:(STImageFileType)fileType DEPRECATED_MSG_ATTRIBUTE("Use `initWithImage:` instead.");
- (id)initWithImage:(UIImage*)image
           fileType:(STImageFileType) fileType
            caption:(NSString*) caption DEPRECATED_MSG_ATTRIBUTE("Use `initWithImage:caption:` instead.");

@end


@protocol STViewControllerDelegate <NSObject>
@required
- (void)STViewControllerDidFinish:(STViewController *)viewController;
@optional
- (void)STViewControllerDidSaveDesign:(STViewController *)viewController;
- (void)STViewControllerWillCheckout:(STViewController *)viewController;
- (void)STViewControllerDidCheckout:(STViewController *)viewController
                               item:(STOrderItem*)orderItem;
@end
