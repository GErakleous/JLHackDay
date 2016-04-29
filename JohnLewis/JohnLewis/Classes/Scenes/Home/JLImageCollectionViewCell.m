//
//  JLImageCollectionViewCell.m
//  JohnLewis
//
//  Created by Hayden Young on 26/04/2016.
//  Copyright © 2016 Nimbletank. All rights reserved.
//

#import "JLImageCollectionViewCell.h"

@interface JLImageCollectionViewCell ()

@property (nonnull, strong) UIImageView *imageView;

@end

@implementation JLImageCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if(self)
	{
		_imageView = [[UIImageView alloc] initWithFrame:self.bounds];
		_imageView.contentMode = UIViewContentModeScaleAspectFit;
		_imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
		[self addSubview:_imageView];
	}
	return self;
}

@end
