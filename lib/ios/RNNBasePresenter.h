#import <Foundation/Foundation.h>
#import "RNNNavigationOptions.h"

@interface RNNBasePresenter : NSObject

@property (nonatomic, weak) id bindedViewController;

- (void)bindViewController:(UIViewController *)bindedViewController;

- (void)present:(RNNNavigationOptions *)options;

- (void)presentDefaultOptions;

@end
