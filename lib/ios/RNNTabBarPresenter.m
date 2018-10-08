#import "RNNTabBarPresenter.h"
#import "RNNTabBarController.h"

@implementation RNNTabBarPresenter

- (void)presentDefaultOptions {
	UITabBarController* tabBarController = (UITabBarController *)self.bindedViewController;
	
	tabBarController.tabBar.barTintColor = nil;
	tabBarController.tabBar.barStyle = UIBarStyleDefault;
	tabBarController.tabBar.translucent = NO;
}

- (void)present:(RNNNavigationOptions *)options {
	UITabBarController* tabBarController = (UITabBarController *)self.bindedViewController;
	[options applyOnTabBarController:tabBarController];
	
	[options.bottomTab applyOn:tabBarController];
}

@end
