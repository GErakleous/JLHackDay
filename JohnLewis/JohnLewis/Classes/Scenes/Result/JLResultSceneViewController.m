//
//  JLResultSceneViewController.m
//  JohnLewis
//
//  Created by Emma Lee-Choon on 29/04/2016.
//  Copyright © 2016 Nimbletank. All rights reserved.
//

#import "JLResultSceneViewController.h"
#import "SDWebImage/UIImageView+WebCache.h"

#import "JLSwipeCollectionViewCell.h"

static NSString * const kJLCellIdentifier =	@"JLCollectionViewCell";
static NSString * const kJLPrintCellIdentifier =	@"JLPrintCollectionViewCell";
static NSString * const kJLLampCellIdentifier =	@"JLLampCollectionViewCell";

@interface JLResultSceneViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionViewTutorial;
@property (nonatomic, strong) UICollectionView *printCollectionView;
@property (nonatomic, strong) UICollectionView *lampCollectionView;
@property (nonatomic, strong) NSArray *sofaImages;
@property (nonatomic, strong) NSArray *sofaDetails;
@property (nonatomic, strong) NSArray *printImages;
@property (nonatomic, strong) NSArray *printDetails;
@property (nonatomic, strong) NSArray *lampImages;
@property (nonatomic, strong) NSArray *lampDetails;
@property (nonatomic, strong) UIButton *btnShare;

@property (nonatomic, strong) UIView *detailsView;
@property (nonatomic, strong) UILabel *labelTitle;
@property (nonatomic, strong) UILabel *labelPrice;

@end

@implementation JLResultSceneViewController

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	NSNumber *value = [NSNumber numberWithInt:UIInterfaceOrientationLandscapeLeft];
	[[UIDevice currentDevice] setValue:value forKey:@"orientation"];
	
	self.navigationController.title = @"My Cool Room";
	self.title = @"My Cool Room";
}

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view.
	self.view.backgroundColor = [UIColor whiteColor];
	
	[self setupData];
	[self setupShareButton];
	[self setupCollectionView];
	[self setupLayout];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (void)shareAction {
	NSString *message = @"My too cool Room";
	
	UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, self.view.opaque, 0.0);
	[self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
	UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
 
	NSArray *shareItems = @[message, img];
 
	UIActivityViewController *shareVC = [[UIActivityViewController alloc] initWithActivityItems:shareItems applicationActivities:nil];
 
	[self presentViewController:shareVC animated:YES completion:nil];
}

#pragma mark - Data Setup
- (void)setupData {
	_sofaImages = @[[UIImage imageNamed:@"sofa1.png"], [UIImage imageNamed:@"sofa2.png"], [UIImage imageNamed:@"sofa3.png"], [UIImage imageNamed:@"sofa4.png"], [UIImage imageNamed:@"sofa5.png"], [UIImage imageNamed:@"sofa6.png"]];
<<<<<<< HEAD
    _sofaDetails = @[@{@"title": @"John Lewis Cromwell Grand Chesterfield Sofa", @"price":  @"£1599"},
                     @{@"title": @"John Lewis Inverness Grand Loose Cover Sofa", @"price":  @"£1800"},
                     @{@"title": @"Duresta Two Seater Sofa", @"price":  @"£499"},
                     @{@"title": @"John Lewis Harrison Medium Sofa", @"price":  @"£849"},
                     @{@"title": @"John Lewis Bingham Medium Sofa", @"price":  @"£849"},
                     @{@"title": @"Collins and Hayes Sofa", @"price":  @"£650"}];
    
    _printImages = @[[UIImage imageNamed:@"photo1.png"], [UIImage imageNamed:@"photo2.png"], [UIImage imageNamed:@"photo3.png"], [UIImage imageNamed:@"photo4.png"]];
    _printDetails = @[@{@"title": @"Art Inspired by Music - Winter, Chocolate Frame", @"price":  @"£65"},
                      @{@"title": @"Art Inspired by Music - Sunshine, Natural Frame", @"price":  @"£65"},
                      @{@"title": @"Art Inspired by Music - Danziamo, Chocolate Frame", @"price":  @"£65"},
                      @{@"title": @"Art Inspired by Music - Paris, Black Frame", @"price":  @"£65"}];
    
    _lampImages = @[[UIImage imageNamed:@"lamp1.png"], [UIImage imageNamed:@"lamp2.png"], [UIImage imageNamed:@"lamp3.png"]];
    _lampDetails = @[@{@"title": @"Bethan Gray for John Lewis Noah Floor Lamp", @"price":  @"£290"},
                     @{@"title": @"John Lewis Clarence Floor Lamp, Washed Grey", @"price":  @"£340"},
                     @{@"title": @"John Lewis Aki Sheesham Floor Lamp, Natural", @"price":  @"£310"}];
=======
	_sofaDetails = @[@{@"title": @"John Lewis Cromwell Grand Chesterfield Sofa", @"price":  @"£1599"},
  @{@"title": @"John Lewis Inverness Grand Loose Cover Sofa", @"price":  @"£1800"},
  @{@"title": @"Duresta Two Seater Sofa", @"price":  @"£499"},
  @{@"title": @"John Lewis Harrison Medium Sofa", @"price":  @"£849"},
  @{@"title": @"John Lewis Bingham Medium Sofa", @"price":  @"£849"},
  @{@"title": @"Collins and Hayes Sofa", @"price":  @"£650"}];
>>>>>>> c2d3516033d3956f129aa73e5ffa06f4db894b71
}

#pragma mark - UI setup
- (void)setupShareButton {
	UIButton *buttonShare = [UIButton buttonWithType:UIButtonTypeSystem];
	[buttonShare addTarget:self action:@selector(shareAction) forControlEvents:UIControlEventTouchUpInside];
	[buttonShare setTitle:@"Share" forState:UIControlStateNormal];
	buttonShare.tintColor = [UIColor redColor];
	[self.view addSubview:buttonShare];
	_btnShare = buttonShare;
}

- (void)setupCollectionView {
	// layout
	UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
	flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
	flowLayout.minimumInteritemSpacing = 0;
	flowLayout.minimumLineSpacing = 0;
	
	// collection view
	UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
	[collectionView registerClass:[JLSwipeCollectionViewCell class] forCellWithReuseIdentifier:kJLCellIdentifier];
	collectionView.backgroundColor = [UIColor clearColor];
	collectionView.dataSource = self;
	collectionView.delegate = self;
	collectionView.pagingEnabled = YES;
	collectionView.showsHorizontalScrollIndicator = NO;
	[self.view addSubview:collectionView];
	_collectionViewTutorial = collectionView;
	
<<<<<<< HEAD
    UICollectionViewFlowLayout *printFlowLayout = [[UICollectionViewFlowLayout alloc] init];
    printFlowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    printFlowLayout.minimumInteritemSpacing = 0;
    printFlowLayout.minimumLineSpacing = 0;
    
    UICollectionView *printCollectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:printFlowLayout];
    [printCollectionView registerClass:[JLSwipeCollectionViewCell class] forCellWithReuseIdentifier:kJLPrintCellIdentifier];
    printCollectionView.backgroundColor = [UIColor clearColor];
    printCollectionView.dataSource = self;
    printCollectionView.delegate = self;
    printCollectionView.pagingEnabled = YES;
    printCollectionView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:printCollectionView];
    _printCollectionView = printCollectionView;

    UICollectionViewFlowLayout *lampFlowLayout = [[UICollectionViewFlowLayout alloc] init];
    lampFlowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    lampFlowLayout.minimumInteritemSpacing = 0;
    lampFlowLayout.minimumLineSpacing = 0;
    
    UICollectionView *lampCollectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:lampFlowLayout];
    [lampCollectionView registerClass:[JLSwipeCollectionViewCell class] forCellWithReuseIdentifier:kJLLampCellIdentifier];
    lampCollectionView.backgroundColor = [UIColor clearColor];
    lampCollectionView.dataSource = self;
    lampCollectionView.delegate = self;
    lampCollectionView.pagingEnabled = YES;
    lampCollectionView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:lampCollectionView];
    _lampCollectionView = lampCollectionView;
=======
	_detailsView = [[UIView alloc] init];
	_detailsView.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.7f];
	[self.view addSubview:_detailsView];
	
	_labelTitle = [[UILabel alloc] init];
	_labelTitle.textColor = [UIColor orangeColor];
	_labelTitle.textAlignment = NSTextAlignmentCenter;
	_labelTitle.numberOfLines = 3;
	[_detailsView addSubview:_labelTitle];
	
	_labelPrice = [[UILabel alloc] init];
	_labelPrice.textAlignment = NSTextAlignmentCenter;
	_labelPrice.textColor = [UIColor orangeColor];
	[_detailsView addSubview:_labelPrice];
	_detailsView.alpha = _labelPrice.alpha = _labelTitle.alpha = 0.0f;
>>>>>>> c2d3516033d3956f129aa73e5ffa06f4db894b71
}

- (void)viewWillLayoutSubviews {
	[self setupLayout];
}

- (void)setupLayout {
	_collectionViewTutorial.frame = CGRectMake(69.0, CGRectGetMidY(self.view.frame) + 20.0f, self.view.frame.size.width * 0.7f, 120.0f);
<<<<<<< HEAD
    _printCollectionView.frame = CGRectMake(CGRectGetMidX(self.view.frame)-50, 105, 85, 85);
    _lampCollectionView.frame = CGRectMake(CGRectGetMaxX(self.view.frame)-160, CGRectGetMidY(self.view.frame) -60.0f, 80, 210.0f);
	_btnShare.frame = CGRectMake(self.view.frame.size.width - 100.0f, 0.0f, 150, 75);
=======
	_btnShare.frame = CGRectMake(self.view.frame.size.width - 110.0f, 10.0f, 100, 75);
	_detailsView.frame = _labelTitle.frame = _labelPrice.frame = CGRectMake(CGRectGetMidX(self.view.frame), self.view.frame.size.height, 120, 50);
>>>>>>> c2d3516033d3956f129aa73e5ffa06f4db894b71
}

#pragma mark - Collection View Datasource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (collectionView == self.collectionViewTutorial) {
        return _sofaImages.count;
    }
    else if (collectionView == self.printCollectionView) {
        return _printImages.count;
    }
    else if (collectionView == self.lampCollectionView) {
        return _lampImages.count;
    }
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
//	JLSwipeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kJLCellIdentifier forIndexPath:indexPath];
    if (collectionView == self.collectionViewTutorial) {
        JLSwipeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kJLCellIdentifier forIndexPath:indexPath];
        [cell updateUIWithImage:_sofaImages[indexPath.row] details:_sofaDetails[indexPath.row] pageIndex:indexPath.row];
        return cell;
    }
    else if (collectionView == self.printCollectionView) {
        JLSwipeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kJLPrintCellIdentifier forIndexPath:indexPath];
        [cell updateUIWithImage:_printImages[indexPath.row] details:_sofaDetails[indexPath.row] pageIndex:indexPath.row];
        return cell;
    }
    else if (collectionView == self.lampCollectionView) {
        JLSwipeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kJLLampCellIdentifier forIndexPath:indexPath];
        [cell updateUIWithImage:_lampImages[indexPath.row] details:_sofaDetails[indexPath.row] pageIndex:indexPath.row];
        return cell;
    }
    
	return nil;
}

#pragma mark - Collection View Delegate
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
	return collectionView.frame.size;
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
	JLSwipeCollectionViewCell *tutorialCell = (JLSwipeCollectionViewCell *)cell;
	[tutorialCell startAnimation];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
	NSDictionary *dict = _sofaDetails[indexPath.row];
	_labelTitle.text = [NSString stringWithFormat:@"%@", dict[@"title"]];
	_labelPrice.text = [NSString stringWithFormat:@"Price: %@", dict[@"price"]];
	
	[_labelTitle sizeToFit];
	[_labelPrice sizeToFit];
	
	_detailsView.alpha = _labelPrice.alpha = _labelTitle.alpha = 0.0f;
	
	_detailsView.frame = CGRectMake(CGRectGetMidX(_collectionViewTutorial.frame) - 75.0f, CGRectGetMinY(_collectionViewTutorial.frame) - 124.0f, 160.0f, 110.0f);
	_detailsView.layer.cornerRadius = 10;
	_detailsView.layer.masksToBounds = YES;
	_labelTitle.frame = CGRectMake(0.0f, 2.0f, _detailsView.frame.size.width - 10.0f, 80.0f);
	_labelPrice.frame = CGRectMake(0.0f, CGRectGetMaxY(_labelTitle.frame), _detailsView.frame.size.width - 10.0f, 20.0f);
	
	[UIView animateWithDuration:0.5f delay:0.0f options:UIViewAnimationOptionCurveEaseInOut animations:^{
		_detailsView.alpha = _labelPrice.alpha = _labelTitle.alpha = 1.0f;
	} completion:nil];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
	[UIView animateWithDuration:0.4f delay:0.0f options:UIViewAnimationOptionCurveEaseInOut animations:^{
		_detailsView.alpha = _labelPrice.alpha = _labelTitle.alpha = 0.0f;
	} completion:^(BOOL finished) {
//		_detailsView.frame = _labelTitle.frame = _labelPrice.frame = CGRectMake(CGRectGetMidX(self.view.frame), self.view.frame.size.height, 120, 50);
	}];
}

@end
