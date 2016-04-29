//
//  JLSimilarClothesViewController.m
//  JohnLewis
//
//  Created by Hayden Young on 26/04/2016.
//  Copyright © 2016 Nimbletank. All rights reserved.
//
#import "SDWebImage/UIImageView+WebCache.h"

#import "JLAPIEndPoints.h"

#import "JLSimilarClothesViewController.h"
#import "JLSimilarClothesDetailsViewController.h"

#import "JLFashionManager.h"

#import "JLSimilarCollectionViewCell.h"

@interface JLSimilarClothesViewController () <UICollectionViewDelegateFlowLayout, UICollectionViewDataSource> //<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray<JLFashion *> *fashions;

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation JLSimilarClothesViewController
- (void)viewDidLoad
{
	[super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
	_fashions = _fashionSearchResult.fashions;
	
	[self setupCollectionView];
}
- (void)setupCollectionView
{
	UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
	flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
	flowLayout.minimumInteritemSpacing = 0;
	flowLayout.minimumLineSpacing = 0;
	
	UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
	collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	collectionView.backgroundColor = [UIColor whiteColor];
	collectionView.dataSource = self;
	collectionView.delegate = self;
	[collectionView registerClass:[JLSimilarCollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
	[self.view addSubview:collectionView];
	
	_collectionView = collectionView;
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
	[super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
	
	[_collectionView.collectionViewLayout invalidateLayout];
	[_collectionView reloadData];
}

#pragma mark - Collection View Datasource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
	return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
	return _fashions.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
	JLSimilarCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
	
	cell.indexPath = indexPath;
	JLFashion *fashion = _fashions[indexPath.row];
	[cell.imageView sd_setImageWithURL:fashion.imageURLThumbnail];
	NSString *description = [NSString stringWithFormat:@"%@\n%@", fashion.title, fashion.currentPrice];
	cell.labelDescription.text = description;
	
	__weak JLSimilarClothesViewController *weakSelf = self;
	cell.didFindSimilarAction = ^(NSIndexPath *indexPath) {
		JLFashion *fashion = _fashions[indexPath.row];
		[weakSelf findSimliarAction:fashion.imageURL];
	};
	
	return cell;
}
- (void)findSimliarAction:(NSURL *)url
{
	UIView *blockerView = [[UIView alloc] initWithFrame:self.navigationController.view.bounds];
	blockerView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
	blockerView.alpha = 0.0;
	[self.navigationController.view addSubview:blockerView];
	
	UIActivityIndicatorView *activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
	[blockerView addSubview:activityIndicatorView];
	activityIndicatorView.center = blockerView.center;
	[activityIndicatorView startAnimating];
	
	[UIView animateWithDuration:0.25 animations:^{
		blockerView.alpha = 1.0;
	} completion:^(BOOL finished) {
		//		[JLAPIEndPoints postSearchSimilarImage:[UIImage imageNamed:@"Naji"]
		[JLAPIEndPoints postSearchSimilarImageURL:url
									   categoryID:kJLAPISofasCategoryID success:^(NSURLSessionDataTask *task, id responseObject) {
										   
										   JLFashionSearchResult *fashionSR = [[JLFashionManager sharedManager] addFashionSearchResultWithInfo:responseObject];
										   
										   JLSimilarClothesViewController *similarClothesVC = [[JLSimilarClothesViewController alloc] init];
										   similarClothesVC.fashionSearchResult = fashionSR;
										   
										   [UIView animateWithDuration:0.25 animations:^{
											   blockerView.alpha = 0.0;
										   } completion:^(BOOL finished) {
											   [blockerView removeFromSuperview];
											   [self.navigationController pushViewController:similarClothesVC animated:YES];
										   }];
									   } failure:^(NSURLSessionDataTask *task, NSError *error) {
										   NSLog(@"%@", error);
									   }];
	}];
}
#pragma mark - Collection View Delegate
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
	if(collectionView.frame.size.width > collectionView.frame.size.height)
		return CGSizeMake(collectionView.frame.size.width / 3, 170 + 200);
	return CGSizeMake(collectionView.frame.size.width * 0.5, 170 + 200);
}


//-(void)setupTableView
//{
//	UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
//	tableView.dataSource = self;
//	tableView.delegate = self;
//	tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
//	[self.view addSubview:tableView];
//}
//
//#pragma mark - UITableViewDatasource
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//	return 1;
//}
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//	return _fashions.count;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//	NSString *CellIdentifier = @"Cell";
//	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//	if(!cell)
//	{
//		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
//		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//	}
//	JLFashion *fashion = _fashions[indexPath.row];
//	
//	cell.textLabel.text = fashion.title;
//	
//	
//	return cell;
//}
//
//#pragma mark - UITableViewDelegate
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//	JLSimilarClothesDetailsViewController *similarClothesDetailsVC = [[JLSimilarClothesDetailsViewController alloc] init];
//	similarClothesDetailsVC.fashion = _fashions[indexPath.row];
//	[self.navigationController pushViewController:similarClothesDetailsVC animated:YES];
//	[tableView deselectRowAtIndexPath:indexPath animated:YES];
//}
@end
