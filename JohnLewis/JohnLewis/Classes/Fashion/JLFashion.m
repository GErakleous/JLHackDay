//
//  JLFashion.m
//  JohnLewis
//
//  Created by Hayden Young on 26/04/2016.
//  Copyright © 2016 Nimbletank. All rights reserved.
//

#import "NSDictionary+HYSafeAccess.h"

#import "JLFashion.h"

static NSString * const kRatingKey = @"rating";
static NSString * const kCategoryIdentifierKey = @"categoryID";
static NSString * const kScoreKey = @"score";
static NSString * const kParentProductIdentifierKey = @"parentProductId";
static NSString * const kCategoryBreadcrumbKey = @"categoryBreadcrumb";
static NSString * const kIdentifierKey = @"ID";
static NSString * const kTitleKey = @"title";
static NSString * const kProductPageURLKey = @"productPageURL";
static NSString * const kAvailabilityKey = @"availability";
static NSString * const kSizeKey = @"size";
static NSString * const kPromoMessageKey = @"promoMessage";
static NSString * const kColorKey = @"colour";
static NSString * const kWasPriceKey = @"wasPrice";
static NSString * const kItemIdentifierKey = @"itemID";
static NSString * const kBrandNameKey = @"brandName";
static NSString * const kCurrentPriceKey = @"isPrice";
static NSString * const kGenderKey = @"gender";
static NSString * const kImageURLKey = @"imageURL";

@interface JLFashion()

@property (nonatomic, strong) NSURL *imageURLThumbnail;

@end

@implementation JLFashion
- (NSUInteger)hash
{
	return self.identifier.integerValue;
}

- (instancetype)initWithInfo:(NSDictionary *)info
{
	self = [super init];
	if(self)
	{
		[self updateWithInfo:info];
	}
	return self;
}

- (void)updateWithInfo:(NSDictionary *)info
{
	self.title = [info objectForKey:kTitleKey oldValue:self.title];
	
	self.rating = [info objectForKey:kRatingKey oldValue:self.rating];
	
	self.categoryIdentifier = [info objectForKey:kCategoryIdentifierKey oldValue:self.categoryIdentifier];
	
	self.score = [info objectForKey:kScoreKey oldValue:self.score];
	
	self.parentProductIdentifier = [info objectForKey:kParentProductIdentifierKey oldValue:self.parentProductIdentifier];
	
	self.categoryBreadcrumb = [info objectForKey:kCategoryBreadcrumbKey oldValue:self.categoryBreadcrumb];
	
	self.identifier = [info objectForKey:kIdentifierKey oldValue:self.identifier];
	
	self.availability = [info objectForKey:kAvailabilityKey oldValue:self.availability];
	
	self.size = [info objectForKey:kSizeKey oldValue:self.size];
	
	self.promoMessage = [info objectForKey:kPromoMessageKey oldValue:self.promoMessage];
	
	self.color = [info objectForKey:kColorKey oldValue:self.color];
	
	self.wasPrice = [info objectForKey:kWasPriceKey oldValue:self.wasPrice];
	
	self.itemIdentifier = [info objectForKey:kItemIdentifierKey oldValue:self.itemIdentifier];
	
	self.brandName = [info objectForKey:kBrandNameKey oldValue:self.brandName];
	
	self.currentPrice = [info objectForKey:kCurrentPriceKey oldValue:self.currentPrice];
	
	self.gender = [info objectForKey:kGenderKey oldValue:self.gender];
	
	self.imageURL = [NSURL URLWithString:[info objectForKey:kImageURLKey oldValue:self.imageURL.absoluteString]];
	
	self.imageURLThumbnail = [NSURL URLWithString:[NSString stringWithFormat:@"%@?$prod_grid3$", self.imageURL]];
}
//- (NSString *)description
//{
//	return [NSString stringWithFormat:@"%@", [super description], self.rating, self.categoryIdentifier, self.score];
//}

//- (NSAttributedString *)attributedDescription
//{
//	
//}
@end
