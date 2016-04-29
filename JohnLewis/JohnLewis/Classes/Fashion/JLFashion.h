//
//  JLFashion.h
//  JohnLewis
//
//  Created by Hayden Young on 26/04/2016.
//  Copyright © 2016 Nimbletank. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JLFashion : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *rating;
@property (nonatomic, strong) NSNumber *categoryIdentifier; // integer
@property (nonatomic, strong) NSNumber *score; // float
@property (nonatomic, strong) NSString *parentProductIdentifier;
@property (nonatomic, strong) NSString *categoryBreadcrumb;
@property (nonatomic, strong) NSNumber *identifier; // integer
@property (nonatomic, strong) NSString *availability;
@property (nonatomic, strong) NSString *size;
@property (nonatomic, strong) NSString *promoMessage;
@property (nonatomic, strong) NSString *color;
@property (nonatomic, strong) NSString *wasPrice;
@property (nonatomic, strong) NSString *itemIdentifier;
@property (nonatomic, strong) NSString *brandName;
@property (nonatomic, strong) NSString *currentPrice;
@property (nonatomic, strong) NSString *gender;
@property (nonatomic, strong) NSURL *imageURL;
@property (nonatomic, strong, readonly) NSURL *imageURLThumbnail;

- (instancetype)initWithInfo:(NSDictionary *)info;
- (void)updateWithInfo:(NSDictionary *)info;

@end
