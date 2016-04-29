//
//  JLSimilarCollectionViewCell.h
//  JohnLewis
//
//  Created by Hayden Young on 26/04/2016.
//  Copyright © 2016 Nimbletank. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface JLSimilarCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) NSIndexPath *indexPath;

@property (nonatomic, strong, readonly) UIImageView *imageView;
@property (nonatomic, strong, readonly) UILabel *labelDescription;


@property (nonatomic, copy) void(^didFindSimilarAction)(NSIndexPath *indexPath);

@end
