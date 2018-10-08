#import <XCTest/XCTest.h>
#import "RNNTabBarPresenter.h"

@interface RNNTabBarPresenterTest : XCTestCase

@property (nonatomic, strong) RNNTabBarPresenter *uut;
@property (nonatomic, strong) RNNNavigationOptions *options;
@property (nonatomic, strong) UITabBarController* bindedTabController;
@end

@implementation RNNTabBarPresenterTest

- (void)setUp {
    [super setUp];
	self.uut = [[RNNTabBarPresenter alloc] init];
	self.bindedTabController = [[UITabBarController alloc] init];
	[self.uut bindViewController:self.bindedTabController];
	self.options = [[RNNNavigationOptions alloc] initWithDict:@{}];
}

- (void)testTabBarTranslucent_default {
	XCTAssertFalse(self.bindedTabController.tabBar.translucent);
}

- (void)test_presentTabBarTranslucent_true {
	self.options.bottomTabs.translucent = @(1);
	[self.uut present:self.options];
	
	XCTAssertTrue(self.bindedTabController.tabBar.translucent);
}

- (void)testTabBarTranslucent_false {
	self.options.bottomTabs.translucent = @(0);
	[self.uut present:self.options];

	XCTAssertFalse(self.bindedTabController.tabBar.translucent);
}

- (void)testTabBarHideShadow_default {
	XCTAssertFalse(self.bindedTabController.tabBar.clipsToBounds);
}

- (void)testTabBarHideShadow_true {
	self.options.bottomTabs.hideShadow = @(1);
	[self.uut present:self.options];
	
	XCTAssertTrue(self.bindedTabController.tabBar.clipsToBounds);
}

- (void)testTabBarHideShadow_false {
	self.options.bottomTabs.hideShadow = @(0);
	[self.uut present:self.options];

	XCTAssertFalse(self.bindedTabController.tabBar.clipsToBounds);
}

- (void)testTabBarBackgroundColor {
	self.options.bottomTabs.backgroundColor = @(0xFFFF0000);
	[self.uut present:self.options];

	UIColor* expectedColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:1];
	XCTAssertTrue([self.bindedTabController.tabBar.barTintColor isEqual:expectedColor]);
}

-(void)testTabBarTextFontFamily_validFont{
	NSString* inputFont = @"HelveticaNeue";
	self.options.bottomTab.fontFamily = inputFont;
	self.options.bottomTab.text = @"Tab 1";
	UIFont* expectedFont = [UIFont fontWithName:inputFont size:10];
	
	[self.uut present:self.options];
	NSDictionary* attributes = [self.bindedTabController.tabBarItem titleTextAttributesForState:UIControlStateNormal];

	XCTAssertTrue([attributes[@"NSFont"] isEqual:expectedFont]);
}

-(void)testTabBarTextFontSize_withoutTextFontFamily_withoutTextColor {
	self.options.bottomTab.fontSize = @(15);
	self.options.bottomTab.text = @"Tab 1";
	UIFont* expectedFont = [UIFont systemFontOfSize:15];
	
	[self.uut present:self.options];
	NSDictionary* attributes = [self.bindedTabController.tabBarItem titleTextAttributesForState:UIControlStateNormal];

	XCTAssertTrue([attributes[@"NSFont"] isEqual:expectedFont]);
}

-(void)testTabBarTextFontSize_withoutTextFontFamily {
	self.options.bottomTab.fontSize = @(15);
	self.options.bottomTab.text = @"Tab 1";
	UIFont* expectedFont = [UIFont systemFontOfSize:15];
	
	[self.uut present:self.options];
	NSDictionary* attributes = [self.bindedTabController.tabBarItem titleTextAttributesForState:UIControlStateNormal];

	XCTAssertTrue([attributes[@"NSFont"] isEqual:expectedFont]);
}

-(void)testTabBarTextFontSize_withTextFontFamily_withTextColor {
	NSString* inputFont = @"HelveticaNeue";
	self.options.bottomTab.text = @"Tab 1";
	self.options.bottomTab.fontSize = @(15);
	self.options.bottomTab.fontFamily = inputFont;
	UIFont* expectedFont = [UIFont fontWithName:inputFont size:15];
	
	[self.uut present:self.options];
	NSDictionary* attributes = [self.bindedTabController.tabBarItem titleTextAttributesForState:UIControlStateNormal];

	XCTAssertTrue([attributes[@"NSFont"] isEqual:expectedFont]);
}

-(void)testTabBarTextFontSize_withTextFontFamily_withoutTextColor {
	NSString* inputFont = @"HelveticaNeue";
	self.options.bottomTab.text = @"Tab 1";
	self.options.bottomTab.fontSize = @(15);
	self.options.bottomTab.fontFamily = inputFont;
	UIFont* expectedFont = [UIFont fontWithName:inputFont size:15];
	
	[self.uut present:self.options];
	NSDictionary* attributes = [self.bindedTabController.tabBarItem titleTextAttributesForState:UIControlStateNormal];

	XCTAssertTrue([attributes[@"NSFont"] isEqual:expectedFont]);
}

@end
