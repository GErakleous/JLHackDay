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

@interface JLResultSceneViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionViewTutorial;
@property (nonatomic, strong) NSArray *sofaImages;
@property (nonatomic, strong) NSArray *sofaDetails;
@property (nonatomic, strong) UIButton *btnShare;

@end

@implementation JLResultSceneViewController

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	NSNumber *value = [NSNumber numberWithInt:UIInterfaceOrientationLandscapeLeft];
	[[UIDevice currentDevice] setValue:value forKey:@"orientation"];
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
	_sofaDetails = @[@{@"title": @"Title Here", @"Price": @"100.0"}, @{@"title": @"Title Here", @"Price": @"100.0"}, @{@"title": @"Title Here", @"Price": @"100.0"}, @{@"title": @"Title Here", @"Price": @"100.0"}, @{@"title": @"Title Here", @"Price": @"100.0"}, @{@"title": @"Title Here", @"Price": @"100.0"}];
}

#pragma mark - UI setup
- (void)setupShareButton {
	UIButton *buttonShare = [UIButton buttonWithType:UIButtonTypeSystem];
	[buttonShare addTarget:self action:@selector(shareAction) forControlEvents:UIControlEventTouchUpInside];
	[buttonShare setTitle:@"Share" forState:UIControlStateNormal];
	buttonShare.tintColor = [UIColor yellowColor];
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
	
}

- (void)viewWillLayoutSubviews {
	[self setupLayout];
}

- (void)setupLayout {
	_collectionViewTutorial.frame = CGRectMake(69.0, CGRectGetMidY(self.view.frame) + 20.0f, self.view.frame.size.width * 0.7f, 120.0f);
	_btnShare.frame = CGRectMake(self.view.frame.size.width - 100.0f, 0.0f, 150, 75);
}

#pragma mark - Collection View Datasource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
	return _sofaImages.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
	JLSwipeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kJLCellIdentifier forIndexPath:indexPath];
	[cell updateUIWithImage:_sofaImages[indexPath.row] details:_sofaDetails[indexPath.row] pageIndex:indexPath.row];
	return cell;
}

#pragma mark - Collection View Delegate
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
	return collectionView.frame.size;
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
	JLSwipeCollectionViewCell *tutorialCell = (JLSwipeCollectionViewCell *)cell;
	[tutorialCell startAnimation];
}

@end
