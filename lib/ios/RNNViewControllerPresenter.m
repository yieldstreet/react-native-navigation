#import "RNNViewControllerPresenter.h"

@implementation RNNViewControllerPresenter

- (void)presentDefaultOptions {
	UIViewController* viewController = self.bindedViewController;
	
	viewController.edgesForExtendedLayout = UIRectEdgeAll;
}

- (void)present:(RNNNavigationOptions *)options {
	UIViewController* viewController = self.bindedViewController;
	
	[options applyOn:viewController];
	[options.topBar applyOn:viewController];
	[options.bottomTabs applyOn:viewController];
	[options.bottomTab applyOn:viewController];
	[options.overlay applyOn:viewController];
	[options.statusBar applyOn:viewController];
	[options.layout applyOn:viewController];
}

@end
