#import "RNNOptionsResolver.h"
#import "RNNParentProtocol.h"

@interface RNNOptionsResolver()

@property (nonatomic, weak) RNNNavigationOptions* options;
@property (nonatomic, weak) RNNBasePresenter* presenter;
@property (nonatomic, weak) UIViewController* viewController;

@end

@implementation RNNOptionsResolver

- (instancetype)initWithOptions:(RNNNavigationOptions *)options presenter:(RNNBasePresenter *)presenter viewController:(UIViewController *)viewController {
	self = [super init];
	
	_options = options;
	_presenter = presenter;
	_viewController = viewController;
	
	[_presenter present:options];
	
	return self;
}

- (void)childWillAppearWithOptions:(RNNNavigationOptions *)childOptions {
	RNNNavigationOptions* resolvedOptions = [[RNNNavigationOptions alloc] initWithDict:@{}];
	[resolvedOptions mergeOptions:_options overrideOptions:YES];
	[resolvedOptions mergeOptions:childOptions overrideOptions:YES];
	
	[_presenter presentDefaultOptions];
	[_presenter present:resolvedOptions];
	
	[((UIViewController<RNNParentProtocol> *)_viewController.parentViewController).optionsResolver childWillAppearWithOptions:childOptions];
}

- (void)childDidMergeOptions:(RNNNavigationOptions *)childOptions {
	[_presenter present:childOptions];
	[((UIViewController<RNNParentProtocol> *)_viewController.parentViewController).optionsResolver childDidMergeOptions:childOptions];
}

- (void)mergeOptions:(RNNNavigationOptions *)newOptions {
	[_options mergeOptions:newOptions overrideOptions:YES];
	[_presenter present:newOptions];
	[_options resetOptions];
	
	[((UIViewController<RNNParentProtocol> *)_viewController.parentViewController).optionsResolver childDidMergeOptions:newOptions];
}

@end
