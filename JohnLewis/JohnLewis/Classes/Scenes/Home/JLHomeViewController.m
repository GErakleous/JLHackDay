//
//  ViewController.m
//  JohnLewis
//
//  Created by Hayden Young on 26/04/2016.
//  Copyright © 2016 Nimbletank. All rights reserved.
//

#import "SDWebImage/UIImageView+WebCache.h"
#import "JLAPIEndPoints.h"

#import "JLHomeViewController.h"
#import "JLSimilarClothesViewController.h"

#import "JLFashionManager.h"

#import "JLImageCollectionViewCell.h"
#import "JLResultSceneViewController.h"

@interface JLHomeViewController ()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIButton *btnCaptureImage;
@property (nonatomic, strong) UIButton *btnSearch;
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UICollectionView *collectionView;

@end


@implementation JLHomeViewController

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	NSNumber *value = [NSNumber numberWithInt:UIInterfaceOrientationPortrait];
	[[UIDevice currentDevice] setValue:value forKey:@"orientation"];
	_contentView.hidden = NO;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	NSLog(@"%@", [[[NSProcessInfo processInfo].globallyUniqueString stringByReplacingOccurrencesOfString:@"-" withString:@""] substringToIndex:32]);
	
	if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
		
		UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Device has no camera" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
		
		[myAlertView show];
		
	}

	UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0f, self.view.frame.size.width, self.view.frame.size.height)];
	contentView.backgroundColor = [UIColor whiteColor];
	[self.view addSubview:contentView];
	_contentView = contentView;
	
	UIImageView *imgView = [[UIImageView alloc] init];
	imgView.frame = CGRectMake(0.0, 0.0f, self.view.frame.size.width, self.view.frame.size.height);
	imgView.backgroundColor = [UIColor yellowColor];
	_imageView = imgView;
	[contentView addSubview:imgView];
	
	UIButton *buttonCapture = [UIButton buttonWithType:UIButtonTypeSystem];
	[buttonCapture addTarget:self action:@selector(captureImage) forControlEvents:UIControlEventTouchUpInside];
//	[buttonCapture setImage:[UIImage imageNamed:@"camera-shutter.png"] forState:UIControlStateNormal];
//	buttonCapture.frame = CGRectMake((contentView.frame.size.width - 80) * 0.5f, contentView.frame.size.height - 140, 80, 80);
	[buttonCapture setTitle:@"Capture Image" forState:UIControlStateNormal];
	buttonCapture.frame = CGRectMake((contentView.frame.size.width - 150) * 0.5f, contentView.frame.size.height - 130, 150, 75);
	buttonCapture.tintColor = [UIColor redColor];
	[contentView addSubview:buttonCapture];
	_btnCaptureImage = buttonCapture;
	
	UIButton *buttonSearch = [UIButton buttonWithType:UIButtonTypeSystem];
	[buttonSearch addTarget:self action:@selector(captureSearch) forControlEvents:UIControlEventTouchUpInside];
	[buttonSearch setTitle:@"Search" forState:UIControlStateNormal];
	buttonCapture.tintColor = [UIColor redColor];
	buttonSearch.frame = CGRectMake((contentView.frame.size.width - 150) * 0.5f, contentView.frame.size.height - 180, 150, 75);
	buttonSearch.hidden = YES;
	[contentView addSubview:buttonSearch];
	_btnSearch = buttonSearch;

//	[self setupCollectionView];
}

- (void)captureImage {
	UIImagePickerController *picker = [[UIImagePickerController alloc] init];
	picker.delegate = self;
	picker.allowsEditing = YES;
	picker.sourceType = UIImagePickerControllerSourceTypeCamera;
	
	[self presentViewController:picker animated:YES completion:NULL];
}

- (void)captureSearch {
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
		[JLAPIEndPoints postSearchSimilarImage:_imageView.image
									categoryID:kJLAPISofasCategoryID success:^(NSURLSessionDataTask *task, id responseObject) {
										
//										JLFashionSearchResult *fashionSR = [[JLFashionManager sharedManager] addFashionSearchResultWithInfo:responseObject];
//										
//										JLSimilarClothesViewController *similarClothesVC = [[JLSimilarClothesViewController alloc] init];
//										similarClothesVC.fashionSearchResult = fashionSR;
//										
//										JLSwipeViewController *swipeVC = [[JLSwipeViewController alloc] init];
										
										JLResultSceneViewController *resultVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([JLResultSceneViewController class])];
										
										
										[UIView animateWithDuration:0.25 animations:^{
											blockerView.alpha = 0.0;
										} completion:^(BOOL finished) {
											[blockerView removeFromSuperview];
//											[self.navigationController pushViewController:similarClothesVC animated:YES];
											[self.navigationController pushViewController:resultVC animated:YES];
										}];
										
//										collectionView.hidden = NO;
										_contentView.hidden = YES;
										
									} failure:^(NSURLSessionDataTask *task, NSError *error) {
										NSLog(@"%@", error);
									}];
	}];
}

#pragma mark - Image Picker Controller delegate methods

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
	UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
	_imageView.image = chosenImage;
	
	self.btnSearch.hidden = NO;
	[picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
	[picker dismissViewControllerAnimated:YES completion:NULL];
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

//- (void)setupCollectionView
//{
//	UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
//	flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
//	flowLayout.minimumInteritemSpacing = 0;
//	flowLayout.minimumLineSpacing = 0;
//	flowLayout.itemSize = self.view.frame.size;
//	
//	UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
//	collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
//	collectionView.dataSource = self;
//	collectionView.delegate = self;
//	[collectionView registerClass:[JLImageCollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
//	[self.view insertSubview:collectionView belowSubview:_contentView];
//	_collectionView = collectionView;
//}

//#pragma mark - Collection View Datasource
//
//- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
//{
//	return 1;
//}
//- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
//{
//	return 1;
//}
//
//- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//	JLImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
//	
//	NSURL *url = [NSURL URLWithString:@"http://productshots2.modcloth.net/productshots/0159/2131/b05908f77ae0d97ed89faf474e0a9012.jpg"];
//	
//	
//	[cell.imageView sd_setImageWithURL:url];
////	cell.imageView.image = [UIImage imageNamed:@"Naji"];
//	
//	return cell;
//}
//
//#pragma mark - Collection View Delegate
//- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
//{
//	NSURL *url = [NSURL URLWithString:@"http://productshots2.modcloth.net/productshots/0159/2131/b05908f77ae0d97ed89faf474e0a9012.jpg"];
//	
//	UIView *blockerView = [[UIView alloc] initWithFrame:self.navigationController.view.bounds];
//	blockerView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
//	blockerView.alpha = 0.0;
//	[self.navigationController.view addSubview:blockerView];
//	
//	UIActivityIndicatorView *activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
//	[blockerView addSubview:activityIndicatorView];
//	activityIndicatorView.center = blockerView.center;
//	[activityIndicatorView startAnimating];
//	
//	[UIView animateWithDuration:0.25 animations:^{
//		blockerView.alpha = 1.0;
//	} completion:^(BOOL finished) {
////		[JLAPIEndPoints postSearchSimilarImage:[UIImage imageNamed:@"Naji"]
//		[JLAPIEndPoints postSearchSimilarImage:_imageView.image
//									   categoryID:kJLAPISofasCategoryID success:^(NSURLSessionDataTask *task, id responseObject) {
//			
//			JLFashionSearchResult *fashionSR = [[JLFashionManager sharedManager] addFashionSearchResultWithInfo:responseObject];
//			
//			JLSimilarClothesViewController *similarClothesVC = [[JLSimilarClothesViewController alloc] init];
//			similarClothesVC.fashionSearchResult = fashionSR;
//			
//			[UIView animateWithDuration:0.25 animations:^{
//				blockerView.alpha = 0.0;
//			} completion:^(BOOL finished) {
//				[blockerView removeFromSuperview];
//				[self.navigationController pushViewController:similarClothesVC animated:YES];
//			}];
//			
//			collectionView.hidden = NO;
//										   _contentView.hidden = YES;
//			
//		} failure:^(NSURLSessionDataTask *task, NSError *error) {
//			NSLog(@"%@", error);
//		}];
//	}];
//	
//}
//
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//	return collectionView.frame.size;
//}


@end
