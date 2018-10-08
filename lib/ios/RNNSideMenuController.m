#import "RNNSideMenuController.h"
#import "RNNSideMenuChildVC.h"
#import "MMDrawerController.h"

@interface RNNSideMenuController ()

@property (readwrite) RNNSideMenuChildVC *center;
@property (readwrite) RNNSideMenuChildVC *left;
@property (readwrite) RNNSideMenuChildVC *right;

@end

@implementation RNNSideMenuController

- (instancetype)initWithLayoutInfo:(RNNLayoutInfo *)layoutInfo childViewControllers:(NSArray *)childViewControllers options:(RNNNavigationOptions *)options presenter:(RNNBasePresenter *)presenter {
	[self setControllers:childViewControllers];
	self = [super initWithCenterViewController:self.center leftDrawerViewController:self.left rightDrawerViewController:self.right];
	
	self.presenter = presenter;
	[self.presenter bindViewController:self];
	
	self.options = options;
	self.layoutInfo = layoutInfo;
	
	self.openDrawerGestureModeMask = MMOpenDrawerGestureModeAll;
	self.closeDrawerGestureModeMask = MMCloseDrawerGestureModeAll;
	
	self.optionsResolver = [[RNNOptionsResolver alloc] initWithOptions:self.options presenter:self.presenter viewController:self];
	
	// Fixes #3697
	[self setExtendedLayoutIncludesOpaqueBars:YES];
	self.edgesForExtendedLayout |= UIRectEdgeBottom;
	
	return self;
}

-(void)showSideMenu:(MMDrawerSide)side animated:(BOOL)animated {
	[self openDrawerSide:side animated:animated completion:nil];
}

-(void)hideSideMenu:(MMDrawerSide)side animated:(BOOL)animated {
	[self closeDrawerAnimated:animated completion:nil];
}

-(void)setControllers:(NSArray*)controllers {
	for (id controller in controllers) {
		
		if ([controller isKindOfClass:[RNNSideMenuChildVC class]]) {
			RNNSideMenuChildVC *child = (RNNSideMenuChildVC*)controller;
			
			if (child.type == RNNSideMenuChildTypeCenter) {
				self.center = child;
			}
			else if(child.type == RNNSideMenuChildTypeLeft) {
				self.left = child;
			}
			else if(child.type == RNNSideMenuChildTypeRight) {
				self.right = child;
			}
		}
		
		else {
			@throw [NSException exceptionWithName:@"UnknownSideMenuControllerType" reason:[@"Unknown side menu type " stringByAppendingString:[controller description]] userInfo:nil];
		}
	}
}

- (UIStatusBarStyle)preferredStatusBarStyle {
	return self.openedViewController.preferredStatusBarStyle;
}

- (UIViewController *)openedViewController {
	switch (self.openSide) {
		case MMDrawerSideNone:
			return self.center;
		case MMDrawerSideLeft:
			return self.left;
		case MMDrawerSideRight:
			return self.right;
		default:
			return self.center;
			break;
	}
}

- (UIViewController<RNNLayoutProtocol> *)getLeafViewController {
	return [self.center getLeafViewController];
}

@end
