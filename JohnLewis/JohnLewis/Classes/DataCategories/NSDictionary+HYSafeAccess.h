//
//  NSDictionary+HYSafeAccess.h
//  SafetyCheck
//
//  Created by Hayden Young on 07/04/2016.
//  Copyright © 2016 Nimbletank. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (HYSafeAccess)

- (id)objectForKey:(NSString *)key oldValue:(id)oldValue;

@end
