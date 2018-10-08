#import "RNNSideMenuPresenter.h"

@implementation RNNSideMenuPresenter

- (void)present:(RNNNavigationOptions *)options {
	[options.sideMenu applyOn:self.bindedViewController];
	[options.bottomTab applyOn:self.bindedViewController];
}

@end
