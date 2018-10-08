#import "RNNNavigationOptions.h"
#import <React/RCTConvert.h>
#import "RNNNavigationController.h"
#import "RNNTabBarController.h"
#import "RNNTopBarOptions.h"
#import "RNNSideMenuController.h"
#import "RNNRootViewController.h"
#import "RNNSplitViewController.h"
#import "RNNNavigationButtons.h"

@implementation RNNNavigationOptions

- (void)applyOn:(UIViewController *)viewController {
	if (self.backgroundImage) {
		UIImageView* backgroundImageView = (viewController.view.subviews.count > 0) ? viewController.view.subviews[0] : nil;
		if (![backgroundImageView isKindOfClass:[UIImageView class]]) {
			backgroundImageView = [[UIImageView alloc] initWithFrame:viewController.view.bounds];
			[viewController.view insertSubview:backgroundImageView atIndex:0];
		}
		
		backgroundImageView.layer.masksToBounds = YES;
		backgroundImageView.image = [self.backgroundImage isKindOfClass:[UIImage class]] ? (UIImage*)self.backgroundImage : [RCTConvert UIImage:self.backgroundImage];
		[backgroundImageView setContentMode:UIViewContentModeScaleAspectFill];
	}
	
	if (self.modalPresentationStyle) {
		viewController.modalPresentationStyle = [RCTConvert UIModalPresentationStyle:self.modalPresentationStyle];
		[viewController.view setBackgroundColor:[UIColor clearColor]];
	}
	
	if (self.modalTransitionStyle) {
		viewController.modalTransitionStyle = [RCTConvert UIModalTransitionStyle:self.modalTransitionStyle];
	}
}

- (void)applyOnNavigationController:(UINavigationController *)navigationController {
	if (self.popGesture) {
		navigationController.interactivePopGestureRecognizer.enabled = [self.popGesture boolValue];
	}
	
	if (self.rootBackgroundImage) {
		UIImageView* backgroundImageView = (navigationController.view.subviews.count > 0) ? navigationController.view.subviews[0] : nil;
		if (![backgroundImageView isKindOfClass:[UIImageView class]]) {
			backgroundImageView = [[UIImageView alloc] initWithFrame:navigationController.view.bounds];
			[navigationController.view insertSubview:backgroundImageView atIndex:0];
		}
		
		backgroundImageView.layer.masksToBounds = YES;
		backgroundImageView.image = [self.rootBackgroundImage isKindOfClass:[UIImage class]] ? (UIImage*)self.rootBackgroundImage : [RCTConvert UIImage:self.rootBackgroundImage];
		[backgroundImageView setContentMode:UIViewContentModeScaleAspectFill];
	}
}

- (void)applyOnTabBarController:(UITabBarController *)tabBarController {
	[self.bottomTabs applyOnTabBarController:tabBarController];
}

- (void)resetOptions {
	[self.sideMenu resetOptions];
	[self.bottomTabs resetOptions];
	[self.bottomTab resetOptions];
}

@end
