#import <Foundation/Foundation.h>
#import "RNNNavigationOptions.h"

@interface RNNBasePresenter : NSObject

@property (nonatomic, weak) UIViewController* bindedViewController;

- (void)bindViewController:(UIViewController *)bindedViewController;

- (void)present:(RNNNavigationOptions *)options;

@end
