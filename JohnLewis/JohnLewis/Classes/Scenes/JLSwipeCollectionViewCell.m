

#import "JLSwipeCollectionViewCell.h"

@interface JLSwipeCollectionViewCell  ()

@property (nonatomic, strong) UIView *detailsView;
@property (nonatomic, strong) UILabel *labelTitle;
@property (nonatomic, strong) UILabel *labelPrice;
@property (nonatomic, strong) UIImageView *imageSofa;

@property (nonatomic, assign) NSInteger pageIndex;
@property (nonatomic, assign) BOOL animated;

@end

@implementation JLSwipeCollectionViewCell

#pragma mark - Constructors

- (instancetype)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
		[self commonInit];
	}
	return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
	self = [super initWithCoder:aDecoder];
	if (self) {
		[self commonInit];
	}
	return self;
}

- (void)commonInit {
	//initialise components and UI elements
	self.backgroundColor = [UIColor clearColor];
	
	_imageSofa = [[UIImageView alloc] initWithFrame:CGRectZero];
	_imageSofa.contentMode = UIViewContentModeScaleToFill;
	_imageSofa.hidden = YES;
	[self.contentView addSubview:_imageSofa];
	
	_detailsView = [[UIView alloc] init];
	_detailsView.backgroundColor = [UIColor whiteColor];
	[self.contentView addSubview:_detailsView];
	
	_labelTitle = [[UILabel alloc] init];
	[_detailsView addSubview:_labelTitle];
	
	_labelPrice = [[UILabel alloc] init];
	[_detailsView addSubview:_labelPrice];
}

- (void)prepareForReuse {
	[super prepareForReuse];
	_animated = NO;
}

#pragma mark - Layout

- (void)layoutSubviews {
	[self doLayout];
}

- (void)doLayout {
	//do the layout
	CGRect frame;
	CGFloat xPos = 0;
	CGFloat yPos = 0;
	CGFloat width = CGRectGetWidth(self.frame);
	CGFloat height = CGRectGetHeight(self.frame);
	
	frame = CGRectMake(xPos, yPos, width, height);
	_imageSofa.frame = frame;

	_detailsView.frame = CGRectMake(CGRectGetMidX(self.frame) - 50.0f, CGRectGetMidY(self.frame) + 120.0f, 100.0f, 100.0f);
	_labelTitle.frame = CGRectMake(CGRectGetMidX(_detailsView.frame) - 60, 10.0f, 120, 75);
	
	
}

#pragma mark - Setters

- (void)updateUIWithImage:(UIImage *)img details:(NSDictionary *)dict pageIndex:(NSInteger)idx {
	// update UI elements (set text and images)
	
	_pageIndex = idx;
	
	_imageSofa.image = img;
	
	[self doLayout];
}

#pragma mark - popup animations
- (void)startAnimation {
	_imageSofa.hidden = NO;
	
//	//scale the image views
	if (!_animated) {
		_animated = YES;
		_imageSofa.transform = CGAffineTransformMakeScale(0.01f, 0.01f);
		
		[UIView animateWithDuration:0.3f delay:0.2f options:UIViewAnimationOptionCurveEaseIn animations:^{
			_imageSofa.transform = CGAffineTransformMakeScale(1.1f, 1.1f);
		} completion:^(BOOL finished) {
			[UIView animateWithDuration:0.3f delay:0.0f options:UIViewAnimationOptionCurveEaseOut animations:^{
				_imageSofa.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
			} completion:nil];
		}];
	}
}

@end
