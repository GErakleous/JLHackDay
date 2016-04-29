//
//  JLFashionSearchResults.m
//  JohnLewis
//
//  Created by Hayden Young on 26/04/2016.
//  Copyright © 2016 Nimbletank. All rights reserved.
//

#import "NSDictionary+HYSafeAccess.h"

#import "JLFashionSearchResult.h"
#import "JLFashion.h"

static NSString * const kIdentifierKey = @"id";
static NSString * const kStatusKey = @"status";
static NSString * const kTimeDetailKey = @"timeDetail";
static NSString * const kFashionsKey = @"fashions";

@interface JLFashionSearchResult()

@property (nonatomic, strong) NSMutableDictionary<NSString *, JLFashion *> *fashionsMutableDict;
@property (nonatomic, strong) NSArray<JLFashion *> *fashions;

@end

@implementation JLFashionSearchResult

- (instancetype)initWithInfo:(NSDictionary *)info
{
	self = [super init];
	if(self)
	{
		_fashionsMutableDict = [NSMutableDictionary dictionary];
		
		[self updateWithInfo:info];
	}
	return self;
}
- (void)updateWithInfo:(NSDictionary *)info
{
	self.identifier = [info objectForKey:kIdentifierKey oldValue:self.identifier];
	
	self.status = [info objectForKey:kStatusKey oldValue:self.status];
	
	self.timeDetail = [info objectForKey:kTimeDetailKey oldValue:self.timeDetail];
	
	NSArray *fashionInfos = info[kFashionsKey];
	[fashionInfos enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull fashionInfo, NSUInteger idx, BOOL * _Nonnull stop) {
		NSString *fashionIdentifier =[NSString stringWithFormat:@"%@", fashionInfo[@"ID"]];
		JLFashion *fashion = _fashionsMutableDict[fashionIdentifier];
		if(fashion)
		{
			[fashion updateWithInfo:fashionInfo];
		}
		else
		{
			fashion = [[JLFashion alloc] initWithInfo:fashionInfo];
			[self addFashion:fashion];
		}
	}];
}

#pragma mark - Fashions relationship
- (NSArray<JLFashion *> *)fashions
{
	if(!_fashions || _fashions.count != _fashionsMutableDict.count)
	{
		_fashions = [[_fashionsMutableDict allValues] sortedArrayUsingComparator:^NSComparisonResult(JLFashion * _Nonnull obj1, JLFashion * _Nonnull obj2) {
			return [obj1.identifier compare:obj2.identifier];
		}];
	}
	return _fashions;
}
- (void)addFashion:(JLFashion *)fashion
{
	[_fashionsMutableDict setObject:fashion forKey:[NSString stringWithFormat:@"%@", fashion.identifier]];
	_fashions = nil;
}
- (void)removeFashion:(JLFashion *)fashion
{
	[_fashionsMutableDict removeObjectForKey:[NSString stringWithFormat:@"%@", fashion.identifier]];
	_fashions = nil;
}

@end
