#import <Foundation/Foundation.h>
#import "RNNNavigationOptions.h"
#import "RNNBasePresenter.h"

@interface RNNOptionsResolver : NSObject

- (instancetype)initWithOptions:(RNNNavigationOptions *)options presenter:(RNNBasePresenter *)presenter viewController:(UIViewController *)viewController;

- (void)mergeOptions:(RNNNavigationOptions *)newOptions;

- (void)childDidMergeOptions:(RNNNavigationOptions *)childOptions;

- (void)childWillAppearWithOptions:(RNNNavigationOptions *)childOptions;

@end
