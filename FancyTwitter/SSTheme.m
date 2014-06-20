#import "SSTheme.h"
#import "OldTheme.h"
#import "NewTheme.h"

@implementation ThemeManager

+ (id <Theme>)sharedTheme
{
    static id <Theme> sharedTheme = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
#if defined(NEW_THEME)
        sharedTheme = [[NewTheme alloc] init];
#else
        sharedTheme = [[OldTheme alloc] init];
#endif
        
    });
    
    return sharedTheme;
}

+ (void)customizeAppAppearance
{
//    id <Theme> theme = [self sharedTheme];
//     
    
#if defined(NEW_THEME)

#else
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
#endif
}

+ (void)customizeTableView:(UITableView *)tableView
{
//    id <Theme> theme = [self sharedTheme];
//    UIColor *backgroundColor = [theme backgroundColor];
//    [tableView setBackgroundColor:backgroundColor];
}

@end
