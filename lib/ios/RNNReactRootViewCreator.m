
#import "RNNReactRootViewCreator.h"
#import <React/RCTRootView.h>

@interface RNNReactRootView : RCTRootView

@end

@implementation RNNReactRootView

@end

@implementation RNNReactRootViewCreator {
	RCTBridge *_bridge;
}

static UIView *_initialLoadingView;
+ (void)setInitialLoadingView:(UIView*)initialLoadingView {
	_initialLoadingView = initialLoadingView;
}

-(instancetype)initWithBridge:(RCTBridge*)bridge {
	self = [super init];
	
	_bridge = bridge;
	
	return self;
	
}

- (UIView*)createRootView:(NSString*)name rootViewId:(NSString*)rootViewId {
	if (!rootViewId) {
		@throw [NSException exceptionWithName:@"MissingViewId" reason:@"Missing view id" userInfo:nil];
	}
	
	RNNReactRootView *view = [[RNNReactRootView alloc] initWithBridge:_bridge
										 moduleName:name
								  initialProperties:@{@"componentId": rootViewId}];
  if (_initialLoadingView) {
		view.initialLoadingView = _initialLoadingView;
		_initialLoadingView = nil;
	}
	return (UIView *)view;
}

-(UIView*)createRootViewFromComponentOptions:(RNNComponentOptions*)componentOptions {
	return [self createRootView:componentOptions.name rootViewId:componentOptions.componentId];
}

@end
