#import "RNNViewControllerPresenter.h"


@implementation RNNViewControllerPresenter

- (void)present:(RNNNavigationOptions *)options {
	[options applyOn:self.bindedViewController];
}

@end
