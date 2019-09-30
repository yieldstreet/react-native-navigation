#import <Foundation/Foundation.h>
#import "RNNComponentViewCreator.h"

#import <React/RCTBridge.h>

@interface RNNReactRootViewCreator : NSObject <RNNComponentViewCreator>

+(void)setInitialLoadingView:(UIView *)initialLoadingView;
-(instancetype)initWithBridge:(RCTBridge*)bridge;

@end
