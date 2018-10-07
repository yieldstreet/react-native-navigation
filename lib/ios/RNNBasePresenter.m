#import "RNNBasePresenter.h"

@implementation RNNBasePresenter

- (void)bindViewController:(UIViewController *)bindedViewController {
	_bindedViewController = bindedViewController;
}

- (void)present:(RNNNavigationOptions *)options {
	[options applyOn:self.bindedViewController];
}

@end
