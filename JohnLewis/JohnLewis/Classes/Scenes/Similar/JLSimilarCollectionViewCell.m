//
//  JLSimilarCollectionViewCell.m
//  JohnLewis
//
//  Created by Hayden Young on 26/04/2016.
//  Copyright © 2016 Nimbletank. All rights reserved.
//
#import "JLUIHelpers.h"

#import "JLSimilarCollectionViewCell.h"

@interface JLSimilarCollectionViewCell()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *labelDescription;

@end

@implementation JLSimilarCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if(self)
	{
		self.backgroundColor = [UIColor whiteColor];
		self.layer.borderWidth = 0.5;
		self.layer.borderColor = [UIColor lightGrayColor].CGColor;
		
		//--- button
		UIButton *button = [UIButton buttonWithTitle:@"Find similar" touchUpInsideTarget:self action:@selector(findSimilarAction:)];
		button.layer.borderColor = [UIColor lightGrayColor].CGColor;
		button.layer.borderWidth = 1;
		[self addSubview:button];
		
		//--- image view
		UIImageView *imageView = [[UIImageView alloc] init];
		imageView.contentMode = UIViewContentModeScaleAspectFit;
		[self addSubview:imageView];
		
		_imageView = imageView;
		
		//--- label
		UILabel *label = [UILabel labelWithText:@"" font:[UIFont systemFontOfSize:14] textColor:[UIColor darkTextColor]];
		label.numberOfLines = 0;
		label.lineBreakMode = NSLineBreakByWordWrapping;
		[self addSubview:label];
		
		_labelDescription = label;
		
		
		button.translatesAutoresizingMaskIntoConstraints = NO;
		imageView.translatesAutoresizingMaskIntoConstraints = NO;
		label.translatesAutoresizingMaskIntoConstraints = NO;
		
		NSDictionary *views = NSDictionaryOfVariableBindings(button, imageView, label);
		NSDictionary *metrics = @{@"buttonWidth": @(button.frame.size.width + 30)};
		NSArray *constraints = nil;
		
		//--- vertical constraints
		constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(20)-[button(40)]-(20)-[imageView]-(4)-[label(70)]-(20)-|" options:NSLayoutFormatAlignAllCenterX metrics:nil views:views];
		[self addConstraints:constraints];
		
		//--- horizontal constraints
		constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(>=20)-[button(buttonWidth)]-(>=20)-|" options:0 metrics:metrics views:views];
		[self addConstraints:constraints];
		constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(20)-[imageView]-(20)-|" options:0 metrics:nil views:views];
		[self addConstraints:constraints];
		constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(20)-[label]-(20)-|" options:0 metrics:nil views:views];
		[self addConstraints:constraints];
	}
	return self;
}

#pragma mark - Button Actions
- (void)findSimilarAction:(id)sender
{
	if(_didFindSimilarAction)
		_didFindSimilarAction(self.indexPath);
}

@end
