#import "RNNNavigationControllerPresenter.h"
#import "RNNNavigationController.h"

@implementation RNNNavigationControllerPresenter

- (void)presentDefaultOptions {
	UINavigationController* navigationController = (UINavigationController *)self.bindedViewController;
	[navigationController setNavigationBarHidden:NO animated:NO];
	navigationController.hidesBarsOnSwipe = NO;
	navigationController.navigationBar.barStyle = UIBarStyleDefault;
	navigationController.navigationBar.translucent = NO;
	navigationController.navigationBar.clipsToBounds = NO;

}

- (void)present:(RNNNavigationOptions *)options {
	UINavigationController* navigationController = (UINavigationController *)self.bindedViewController;
	[options applyOnNavigationController:navigationController];
	
	[options.topBar applyOnNavigationController:navigationController];
	[options.statusBar applyOn:navigationController];
	[options.layout applyOn:navigationController];
	[options.bottomTab applyOn:navigationController];
	[options applyOnNavigationController:navigationController];
}



@end
