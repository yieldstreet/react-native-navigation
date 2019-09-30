
#import "RNNReactRootViewCreator.h"
#import "RNNReactView.h"

@implementation RNNReactRootViewCreator {
	RCTBridge *_bridge;
}

- (instancetype)initWithBridge:(RCTBridge*)bridge {
	self = [super init];
	
	_bridge = bridge;
	
	return self;
}

static UIView * _initialLoadingView;
+(void)setInitialLoadingView:(UIView *)initialLoadingView {
	_initialLoadingView = initialLoadingView;
}

- (RNNReactView*)createRootView:(NSString*)name rootViewId:(NSString*)rootViewId availableSize:(CGSize)availableSize reactViewReadyBlock:(RNNReactViewReadyCompletionBlock)reactViewReadyBlock {
	if (!rootViewId) {
		@throw [NSException exceptionWithName:@"MissingViewId" reason:@"Missing view id" userInfo:nil];
	}
	
	RNNReactView *view = [[RNNReactView alloc] initWithBridge:_bridge
												   moduleName:name
											initialProperties:@{@"componentId": rootViewId}
												availableSize:availableSize
										  reactViewReadyBlock:reactViewReadyBlock];
	if (_initialLoadingView) {
		view.loadingView = _initialLoadingView;
		_initialLoadingView = nil;
	}
	return (UIView *)view;
}

- (UIView*)createRootViewFromComponentOptions:(RNNComponentOptions*)componentOptions {
	return [self createRootView:componentOptions.name.get rootViewId:componentOptions.componentId.get availableSize:CGSizeZero reactViewReadyBlock:nil];
}

- (UIView*)createRootViewFromComponentOptions:(RNNComponentOptions*)componentOptions reactViewReadyBlock:(RNNReactViewReadyCompletionBlock)reactViewReadyBlock {
	return [self createRootView:componentOptions.name.get rootViewId:componentOptions.componentId.get availableSize:CGSizeZero reactViewReadyBlock:reactViewReadyBlock];
}

@end
