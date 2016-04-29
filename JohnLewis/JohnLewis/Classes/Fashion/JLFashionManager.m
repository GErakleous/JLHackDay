//
//  JLFashionManager.m
//  JohnLewis
//
//  Created by Hayden Young on 26/04/2016.
//  Copyright © 2016 Nimbletank. All rights reserved.
//

#import "JLFashionManager.h"

@interface JLFashionManager()

@property (nonatomic, strong) NSDictionary<NSString *, JLFashionSearchResult*> *fashionSearchResultsDict;
@property (nonatomic, strong) NSMutableDictionary<NSString *, JLFashionSearchResult *> *fashionSearchResultsDictMutable;

@end

@implementation JLFashionManager

+ (instancetype)sharedManager
{
	static JLFashionManager *sharedInstance = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		sharedInstance = [[JLFashionManager alloc] init];
		// Do any other initialisation stuff here
	});
	return sharedInstance;
}

- (instancetype)init
{
	self = [super init];
	if(self)
	{
		_fashionSearchResultsDictMutable = [NSMutableDictionary dictionary];
	}
	return self;
}

#pragma mark - Fashion Search Results Relationship
- (NSDictionary<NSString *, JLFashionSearchResult*> *)fashionSearchResultsDict
{
	if(!_fashionSearchResultsDict || _fashionSearchResultsDict.count != _fashionSearchResultsDictMutable.count)
	{
		_fashionSearchResultsDict = [NSDictionary dictionaryWithDictionary:_fashionSearchResultsDictMutable];
	}
	return _fashionSearchResultsDict;
}

- (JLFashionSearchResult *)addFashionSearchResultWithInfo:(NSDictionary *)info
{
	JLFashionSearchResult *fashionSearchResult = [[JLFashionSearchResult alloc] initWithInfo:info];
	
	[_fashionSearchResultsDictMutable setObject:fashionSearchResult forKey:[NSString stringWithFormat:@"%@", fashionSearchResult.identifier]];
	_fashionSearchResultsDict = nil;
	
	return fashionSearchResult;
}

@end
