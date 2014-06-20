#import <UIKit/UIKit.h>

@protocol Theme <NSObject>

- (UIColor *)profileNameColor;
- (UIColor *)twitterNameColor;
- (UIColor *)tweetColor;
- (UIImage *)navigationBackgroundForBarMetrics:(UIBarMetrics)metrics;
- (UIImage *)backgroundImage;

@end

@interface ThemeManager : NSObject

+ (id <Theme>)sharedTheme;

+ (void)customizeAppAppearance;
+ (void)customizeTableView:(UITableView *)tableView;

@end
