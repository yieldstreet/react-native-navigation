#import "RNNLayoutInfo.h"
#import "RNNBasePresenter.h"
#import "RNNLeafProtocol.h"
#import "RNNOptionsResolver.h"

@protocol RNNLayoutProtocol <RNNOptionsDelegate, NSObject, UINavigationControllerDelegate, UIViewControllerTransitioningDelegate, UISplitViewControllerDelegate>

@required

@property (nonatomic, retain) RNNBasePresenter* presenter;
@property (nonatomic, retain) RNNLayoutInfo* layoutInfo;
@property (nonatomic, strong) RNNNavigationOptions* options;
@property (nonatomic, strong) RNNOptionsResolver* optionsResolver;

- (UIViewController<RNNLeafProtocol, RNNLayoutProtocol> *)getLeafViewController;

@end
