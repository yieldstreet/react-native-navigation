#import "RNNNavigationControllerPresenter.h"
#import "RNNNavigationController.h"

@implementation RNNNavigationControllerPresenter


- (void)present:(RNNNavigationOptions *)options {
	UINavigationController* navigationControlelr = (UINavigationController *)self.bindedViewController;
	[options applyOnNavigationController:navigationControlelr];
}



@end
