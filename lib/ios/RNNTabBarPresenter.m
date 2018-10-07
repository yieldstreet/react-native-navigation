#import "RNNTabBarPresenter.h"
#import "RNNTabBarController.h"

@implementation RNNTabBarPresenter

- (void)present:(RNNNavigationOptions *)options {
	UITabBarController* tabBarController = (UITabBarController *)self.bindedViewController;
	[options applyOnTabBarController:tabBarController];
}

@end
