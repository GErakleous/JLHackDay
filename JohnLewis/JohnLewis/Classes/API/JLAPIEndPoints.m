//
//  JLAPI.m
//  JohnLewis
//
//  Created by Hayden Young on 26/04/2016.
//  Copyright © 2016 Nimbletank. All rights reserved.
//

#import "JLAPIEndPoints.h"

NSString * const kJLAPIWomensCategoryID = @"1001083";
NSString * const kJLAPIMensCategoryID = @"1001093";

static NSString * const kBaseURL = @"http://eu-poc1.cortexica-cloud.com/api/";
static NSString * const kApiKey = @"JOHK2YL0LMYXES6WQ64SCZ4TY5CHB8X0D12I5FJZFR4032XX";

@implementation JLAPIEndPoints

#pragma mark - 

+ (AFHTTPSessionManager *)sessionManager
{
	NSURL *baseURL = [[NSURL alloc] initWithString:kBaseURL];
	AFHTTPSessionManager *sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:baseURL];
	
	sessionManager.responseSerializer = [AFJSONResponseSerializer serializer];
	sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
	sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain", nil];
	
	return sessionManager;
}

+ (NSURLSessionDataTask *)postSearchSimilarImageURL:(NSURL *)imageURL categoryID:(NSString *)categoryID success:(successBlock)success failure:(failureBlock)failure
{
	// Cortexica John Lewis (POST http://eu-poc1.cortexica-cloud.com/api/searchsimilar)
	
	AFHTTPSessionManager *sessionManager = [JLAPIEndPoints sessionManager];
	
	NSString *deviceName = @"229D8F8696514EDC96611D6685F18A6E";
	NSString *appVersion = @"JL0.5";	

	
	return [sessionManager POST:@"searchsimilar" parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
		
		[formData appendPartWithFormData:[imageURL.absoluteString dataUsingEncoding:NSUTF8StringEncoding] name:@"ImageUrl"];
		[formData appendPartWithFormData:[deviceName dataUsingEncoding:NSUTF8StringEncoding] name:@"DeviceName"];
		[formData appendPartWithFormData:[appVersion dataUsingEncoding:NSUTF8StringEncoding] name:@"appVersion"];
		[formData appendPartWithFormData:[kApiKey dataUsingEncoding:NSUTF8StringEncoding] name:@"apiKey"];
		[formData appendPartWithFormData:[categoryID dataUsingEncoding:NSUTF8StringEncoding] name:@"categoryID"];
		
	} progress:nil success:success failure:failure];
}
+ (NSURLSessionDataTask *)postSearchSimilarImage:(UIImage *)image categoryID:(NSString *)categoryID success:(successBlock)success failure:(failureBlock)failure
{
	// Cortexica John Lewis (POST http://eu-poc1.cortexica-cloud.com/api/searchsimilar)
	
	AFHTTPSessionManager *sessionManager = [JLAPIEndPoints sessionManager];
	
	NSString *deviceName = @"229D8F8696514EDC96611D6685F18A6E";
	NSString *appVersion = @"JL0.5";	

	
	return [sessionManager POST:@"searchsimilar" parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
		
		[formData appendPartWithFormData:UIImageJPEGRepresentation(image, 1) name:@"Image"];
		[formData appendPartWithFormData:[deviceName dataUsingEncoding:NSUTF8StringEncoding] name:@"DeviceName"];
		[formData appendPartWithFormData:[appVersion dataUsingEncoding:NSUTF8StringEncoding] name:@"appVersion"];
		[formData appendPartWithFormData:[kApiKey dataUsingEncoding:NSUTF8StringEncoding] name:@"apiKey"];
		[formData appendPartWithFormData:[categoryID dataUsingEncoding:NSUTF8StringEncoding] name:@"categoryID"];
		
	} progress:nil success:success failure:failure];
}
+ (NSURLSessionDataTask *)postRetrieveSearchForSearchIdentifier:(NSString *)searchIdentifier success:(successBlock)success failure:(failureBlock)failure
{
	// Cortexica John Lewis (POST http://eu-poc1.cortexica-cloud.com/api/retrievesearch)
	
	AFHTTPSessionManager *sessionManager = [JLAPIEndPoints sessionManager];
	
	return [sessionManager POST:@"retrievesearch" parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
		
		[formData appendPartWithFormData:[kApiKey dataUsingEncoding:NSUTF8StringEncoding] name:@"ApiKey"];
		[formData appendPartWithFormData:[searchIdentifier dataUsingEncoding:NSUTF8StringEncoding] name:@"SearchID"];
		
	} progress:nil success:success failure:failure];
}



@end
