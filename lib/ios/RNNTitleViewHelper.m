
#import "RNNTitleViewHelper.h"
#import <React/RCTConvert.h>
#import "RCTHelpers.h"

@implementation RNNTitleView


@end

@interface RNNTitleViewHelper ()

@property (nonatomic, weak) UIViewController *viewController;

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *subtitle;

@property (nonatomic, strong) RNNTitleView *titleView;
@property (nonatomic, weak) RNNTitleOptions *titleOptions;

@end


@implementation RNNTitleViewHelper

- (instancetype)initWithTitleViewOptions:(RNNTitleOptions*)titleOptions
						  viewController:(UIViewController*)viewController {
	self = [super init];
	if (self) {
		self.viewController = viewController;
		self.title = titleOptions.text;
		self.subtitle = titleOptions.subtitle.text;
		self.titleOptions = titleOptions;
		
	}
	return self;
}

+(NSString*)validateString:(NSString*)string {
	if ([string isEqual:[NSNull null]]) {
		return nil;
	}
	
	return string;
}

-(void)setup {
	CGRect navigationBarBounds = self.viewController.navigationController.navigationBar.bounds;
	
	self.titleView = [[RNNTitleView alloc] initWithFrame:navigationBarBounds];
	self.titleView.backgroundColor = [UIColor clearColor];
	self.titleView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
	self.titleView.clipsToBounds = YES;
	
	if (self.subtitle) {
		self.titleView.subtitleLabel = [self setupSubtitle];
	}
	
	if (self.title) {
		self.titleView.titleLabel = [self setupTitle];
	}
	
	[self centerTitleView:navigationBarBounds titleLabel:self.titleView.titleLabel subtitleLabel:self.titleView.subtitleLabel];
	
	self.viewController.navigationItem.titleView = self.titleView;
}

-(void)centerTitleView:(CGRect)navigationBarBounds titleLabel:(UILabel*)titleLabel subtitleLabel:(UILabel*)subtitleLabel
{
	CGRect titleViewFrame = navigationBarBounds;
	titleViewFrame.size.width = MAX(titleLabel.frame.size.width, subtitleLabel.frame.size.width);;
	self.titleView.frame = titleViewFrame;
	
	for (UIView *view in self.titleView.subviews) {
		CGRect viewFrame = view.frame;
		viewFrame.size.width = self.titleView.frame.size.width;
		viewFrame.origin.x = (self.titleView.frame.size.width - viewFrame.size.width)/2;
		view.frame = viewFrame;
	}
	
}


-(UILabel*)setupSubtitle {
	CGRect subtitleFrame = self.titleView.frame;
	subtitleFrame.size.height /= 2;
	subtitleFrame.origin.y = subtitleFrame.size.height;
	
	UILabel *subtitleLabel = [[UILabel alloc] initWithFrame:subtitleFrame];
	subtitleLabel.textAlignment = NSTextAlignmentCenter;
	subtitleLabel.backgroundColor = [UIColor clearColor];
	subtitleLabel.autoresizingMask = self.titleView.autoresizingMask;
	
	[subtitleLabel setAttributedText:[[NSAttributedString alloc] initWithString:self.subtitle attributes:_titleOptions.subtitle.fontAttributes]];
	
	
	CGSize labelSize = [subtitleLabel.text sizeWithAttributes:_titleOptions.subtitle.fontAttributes];
	CGRect labelframe = subtitleLabel.frame;
	labelframe.size = labelSize;
	subtitleLabel.frame = labelframe;
	[subtitleLabel sizeToFit];
	
	if (_titleOptions.subtitle.color) {
		UIColor *color = _titleOptions.subtitle.color != (id)[NSNull null] ? [RCTConvert UIColor:_titleOptions.subtitle.color] : nil;
		subtitleLabel.textColor = color;
	}
	
	[self.titleView addSubview:subtitleLabel];
	
	return subtitleLabel;
}


-(UILabel*)setupTitle {
	CGRect titleFrame = self.titleView.frame;
	if (self.subtitle) {
		titleFrame.size.height /= 2;
	}
	UILabel *titleLabel = [[UILabel alloc] initWithFrame:titleFrame];
	titleLabel.textAlignment = NSTextAlignmentCenter;
	titleLabel.backgroundColor = [UIColor clearColor];
	
	titleLabel.autoresizingMask = self.titleView.autoresizingMask;
	
	UIFont *titleFont = [UIFont boldSystemFontOfSize:17.f];
	
	id fontSize = _titleOptions.fontSize;
	if (fontSize) {
		CGFloat fontSizeFloat = [RCTConvert CGFloat:fontSize];
		titleFont = [UIFont boldSystemFontOfSize:fontSizeFloat];
	}
	
	[titleLabel setAttributedText:[[NSAttributedString alloc] initWithString:self.title attributes:_titleOptions.fontAttributes]];
	
	CGSize labelSize = [titleLabel.text sizeWithAttributes:@{NSFontAttributeName:titleFont}];
	CGRect labelframe = titleLabel.frame;
	labelframe.size = labelSize;
	titleLabel.frame = labelframe;
	
	if (!self.subtitle) {
		titleLabel.center = self.titleView.center;
	}
	
	id navBarTextColor = _titleOptions.color;
	if (navBarTextColor) {
		UIColor *color = navBarTextColor != (id)[NSNull null] ? [RCTConvert UIColor:navBarTextColor] : nil;
		titleLabel.textColor = color;
	}
	
	[titleLabel sizeToFit];
	[self.titleView addSubview:titleLabel];
	
	return titleLabel;
}


@end

