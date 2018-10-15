#import <Foundation/Foundation.h>
#import "RNNRootViewCreator.h"

#import <React/RCTBridge.h>

@interface RNNReactRootViewCreator : NSObject <RNNRootViewCreator>

+ (void)setInitialLoadingView:(UIView*)initialLoadingView;
-(instancetype)initWithBridge:(RCTBridge*)bridge;

@end
