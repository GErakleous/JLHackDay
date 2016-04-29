
#import <UIKit/UIKit.h>

@interface JLSwipeCollectionViewCell : UICollectionViewCell

- (void)updateUIWithImage:(UIImage *)img details:(NSDictionary *)dict pageIndex:(NSInteger)idx;

- (void)startAnimation;

@end
