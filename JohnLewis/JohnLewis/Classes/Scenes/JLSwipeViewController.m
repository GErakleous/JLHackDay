
#import "JLSwipeViewController.h"
#import "JLSwipeCollectionViewCell.h"

static NSString * const kGOCellIdentifier =	@"GOTutorialCollectionViewCell";

@interface JLSwipeViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionViewTutorial;
@property (nonatomic, strong) NSArray *tutorialTitles;
@property (nonatomic, strong) NSArray *tutorialSubtitles;

@end

@implementation JLSwipeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	self.view.backgroundColor = [UIColor whiteColor];
	
	[self setupTutorialData];
	
	[self setupBackground];
	
	[self setupCollectionView];
	
	[self setupLayout];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Data Setup
- (void)setupTutorialData
{
	_tutorialTitles = @[@"Page1", @"Page2", @"Page3"];
	
	_tutorialSubtitles = @[@"mpla mpla mpla mpla mpla mpla mpla mpla mpla mpla mpla mpla mpla mpla",
					   @"mpla mpla mpla mpla mpla mpla mpla mpla mpla mpla mpla mpla mpla mpla",
					   @"mpla mpla mpla mpla mpla mpla mpla mpla mpla mpla mpla mpla mpla mpla",
					   @"mpla mpla mpla mpla mpla mpla mpla mpla mpla mpla mpla mpla mpla mplampla mpla mpla mpla mpla mpla mpla mpla mpla mpla mpla mpla mpla mpla"];
}

#pragma mark - UI setup
- (void)setupBackground
{
	self.view.backgroundColor = [UIColor grayColor];
}

- (void)setupCollectionView
{
	//--- layout
	UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
	flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
	flowLayout.minimumInteritemSpacing = 0;
	flowLayout.minimumLineSpacing = 0;
	
	//--- collection view
	UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
	[collectionView registerClass:[JLSwipeCollectionViewCell class] forCellWithReuseIdentifier:kGOCellIdentifier];
	collectionView.backgroundColor = [UIColor clearColor];
	collectionView.dataSource = self;
	collectionView.delegate = self;
	collectionView.pagingEnabled = YES;
	collectionView.showsHorizontalScrollIndicator = NO;
	[self.view addSubview:collectionView];
	_collectionViewTutorial = collectionView;
	
}

- (void)setupLayout
{
	_collectionViewTutorial.frame = CGRectMake(0.0f, 0.0f, self.view.frame.size.width, self.view.frame.size.height);
}

#pragma mark - Collection View Datasource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
	return _tutorialTitles.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
	JLSwipeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kGOCellIdentifier forIndexPath:indexPath];
	[cell updateUIWithTitle:_tutorialTitles[indexPath.row] subtitle:_tutorialSubtitles[indexPath.row] pageIndex:indexPath.row];
	return cell;
}

#pragma mark - Collection View Delegate
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
	return collectionView.frame.size;
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
	JLSwipeCollectionViewCell *tutorialCell = (JLSwipeCollectionViewCell *)cell;
	[tutorialCell startAnimation];
}
@end
