#import <UIKit/UIKit.h>
#import "RNNSideMenuChildVC.h"
#import "MMDrawerController.h"
#import "RNNParentProtocol.h"
#import "RNNOptionsResolver.h"

@interface RNNSideMenuController : MMDrawerController <RNNParentProtocol>

@property (readonly) RNNSideMenuChildVC *center;
@property (readonly) RNNSideMenuChildVC *left;
@property (readonly) RNNSideMenuChildVC *right;

@property (nonatomic, retain) RNNLayoutInfo* layoutInfo;
@property (nonatomic, retain) RNNBasePresenter* presenter;
@property (nonatomic, strong) RNNNavigationOptions* options;
@property (nonatomic, strong) RNNOptionsResolver* optionsResolver;

-(void)showSideMenu:(MMDrawerSide)side animated:(BOOL)animated;
-(void)hideSideMenu:(MMDrawerSide)side animated:(BOOL)animated;

@end
