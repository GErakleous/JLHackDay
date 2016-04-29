//
//  JLFashionManager.h
//  JohnLewis
//
//  Created by Hayden Young on 26/04/2016.
//  Copyright © 2016 Nimbletank. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JLFashionSearchResult.h"
#import "JLFashion.h"

@interface JLFashionManager : NSObject

+ (instancetype)sharedManager;

#pragma mark - Fashion Search Results relationship
@property (nonatomic, strong, readonly) NSDictionary<NSString *, JLFashionSearchResult*> *fashionSearchResultsDict;
- (JLFashionSearchResult *)addFashionSearchResultWithInfo:(NSDictionary *)info;


@end
