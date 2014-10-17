//
//  STAffiliateManager.h
//  SnapteeSDK
//
//  Created by Guy Sum on 25/4/14.
//  Copyright (c) 2014 Snaptee. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "STViewController.h"

@interface STOrderItem : NSObject
@property (nonatomic, retain) NSString * orderId;
@property (nonatomic, retain) NSURL * trackingURL;
@end

@interface STAffiliateManager : NSObject

+ (STAffiliateManager *)instance;

typedef enum {
    STLanguageDefault=0,
    STLanguageEnglish=1,
    STLanguageGerman=2,
    STLanguageFrench=3,
    STLanguageIndonesian=4,
    STLanguageJapanese=5,
    STLanguageKorean=6,
    STLanguageThai=7,
    STLanguageTraditonalChinese=8,
    STLanguageSimplifiedChinese=9
} STLanguage;

// affiliateID: Assigned by Snaptee
@property (nonatomic, retain) NSString * affiliate_id;

// app_name: Optional. Will be shown in the action sheet when leaving Snaptee e.g. "Back to app_name"
@property (nonatomic, retain) NSString * app_name;

// language: Optional. Set if want to force the language.
@property (nonatomic) STLanguage language;

// ordered_items: Ordered items in this session. Array of STOrderItem object.
@property (nonatomic, retain, readonly) NSArray * ordered_items;

@end
