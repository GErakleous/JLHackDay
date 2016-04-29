//
//  JLSimilarDetailsViewController.m
//  JohnLewis
//
//  Created by Hayden Young on 26/04/2016.
//  Copyright © 2016 Nimbletank. All rights reserved.
//
#import "SDWebImage/UIImageView+WebCache.h"

#import "JLFashion.h"

#import "JLSimilarClothesDetailsViewController.h"

@implementation JLSimilarClothesDetailsViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
	self.edgesForExtendedLayout = UIRectEdgeNone;
	self.extendedLayoutIncludesOpaqueBars = YES;
	
	UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
	
	[imageView sd_setImageWithURL:_fashion.imageURLThumbnail];
	imageView.contentMode = UIViewContentModeScaleAspectFit;
	imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	[self.view addSubview:imageView];
}

@end
