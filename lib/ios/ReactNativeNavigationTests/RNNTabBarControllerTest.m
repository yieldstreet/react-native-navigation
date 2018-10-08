#import <XCTest/XCTest.h>
#import "RNNTabBarController.h"
#import "RNNTabBarPresenter.h"
#import "RNNNavigationOptions.h"

@interface RNNTabBarControllerTest : XCTestCase

@property (nonatomic, strong) RNNTabBarController *uut;

@end

@implementation RNNTabBarControllerTest

- (void)setUp {
	[super setUp];
	
	self.uut = [[RNNTabBarController alloc] initWithLayoutInfo:nil childViewControllers:@[[[UIViewController alloc] init]] options:[[RNNNavigationOptions alloc] initWithDict:@{}] presenter:[[RNNTabBarPresenter alloc] init]];
}

- (void)testInitWithLayoutInfo_shouldBindPresenter {
	XCTAssertNotNil(self.uut.presenter);
}

- (void)testInitWithLayoutInfo_shouldSetMultipleViewControllers {
	UIViewController* vc1 = [[UIViewController alloc] init];
	UIViewController* vc2 = [[UIViewController alloc] init];
	
	self.uut = [[RNNTabBarController alloc] initWithLayoutInfo:nil childViewControllers:@[vc1, vc2] options:[[RNNNavigationOptions alloc] initWithDict:@{}] presenter:[[RNNTabBarPresenter alloc] init]];
	XCTAssertTrue(self.uut.viewControllers.count == 2);
}


@end
