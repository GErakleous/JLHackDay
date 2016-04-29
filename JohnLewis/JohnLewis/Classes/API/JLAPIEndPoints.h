//
//  JLAPI.h
//  JohnLewis
//
//  Created by Hayden Young on 26/04/2016.
//  Copyright © 2016 Nimbletank. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking/AFNetworking.h"

extern NSString * const kJLAPIWomensCategoryID;
extern NSString * const kJLAPIMensCategoryID;

typedef void(^successBlock)(NSURLSessionDataTask *task, id responseObject);
typedef void(^failureBlock)(NSURLSessionDataTask *task, NSError *error);
typedef void(^constructingBodyBlock) (id<AFMultipartFormData> formData);
typedef void(^progressBlock) (NSProgress *uploadProgress);

@interface JLAPIEndPoints : NSObject

+ (NSURLSessionDataTask *)postSearchSimilarImageURL:(NSURL *)imageURL categoryID:(NSString *)categoryID success:(successBlock)success failure:(failureBlock)failure;

+ (NSURLSessionDataTask *)postSearchSimilarImage:(UIImage *)image categoryID:(NSString *)categoryID success:(successBlock)success failure:(failureBlock)failure;

+ (NSURLSessionDataTask *)postRetrieveSearchForSearchIdentifier:(NSString *)searchIdentifier success:(successBlock)success failure:(failureBlock)failure;
@end
