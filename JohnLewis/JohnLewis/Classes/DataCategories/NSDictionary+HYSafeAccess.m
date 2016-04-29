//
//  NSDictionary+HYSafeAccess.m
//  SafetyCheck
//
//  Created by Hayden Young on 07/04/2016.
//  Copyright © 2016 Nimbletank. All rights reserved.
//

#import "NSDictionary+HYSafeAccess.h"

@implementation NSDictionary (HYSafeAccess)

- (id)objectForKey:(NSString *)key oldValue:(id)oldValue
{
	id value = self[key];
	if([value respondsToSelector:@selector(stringByRemovingPercentEncoding)])
		value = [value stringByRemovingPercentEncoding];
	if(!value)
		value = oldValue;
	if(value == [NSNull null])
		value = nil;
	
	if([value respondsToSelector:@selector(length)])
		value = [value length] > 0 ? value : nil;
	
	return value;
}

@end
