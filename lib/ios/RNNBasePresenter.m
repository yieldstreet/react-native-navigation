#import "RNNBasePresenter.h"

@implementation RNNBasePresenter

- (void)bindViewController:(UIViewController *)bindedViewController {
	_bindedViewController = bindedViewController;
	[self presentDefaultOptions];
}

- (void)present:(RNNNavigationOptions *)options {
	[options applyOn:self.bindedViewController];
}

- (void)presentDefaultOptions {
	
}

@end
