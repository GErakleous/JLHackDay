//
//  JLFashionSearchResults.h
//  JohnLewis
//
//  Created by Hayden Young on 26/04/2016.
//  Copyright © 2016 Nimbletank. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JLFashion;

@interface JLFashionSearchResult : NSObject

@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSNumber *identifier; // integer
@property (nonatomic, strong) NSString *timeDetail;

- (instancetype)initWithInfo:(NSDictionary *)info;
- (void)updateWithInfo:(NSDictionary *)info;

#pragma mark - Fashions Relationship
@property (nonatomic, strong, readonly) NSArray<JLFashion *> *fashions;
- (void)addFashion:(JLFashion *)fashion;
- (void)removeFashion:(JLFashion *)fashion;

@end
