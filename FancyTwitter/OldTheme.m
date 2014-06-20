#import "OldTheme.h"
#import "AppDelegate.h"

@implementation OldTheme

- (UIColor *)profileNameColor
{
    return [UIColor colorWithRed:230.0/255.0 green:237.0/255.0 blue:241.0/255.0 alpha:1.0];
}

- (UIColor *)twitterNameColor
{
    return [UIColor colorWithRed:129.0/255.0 green:165.0/255.0 blue:185.0/255.0 alpha:1.0];
}

- (UIColor *)tweetColor
{
    return [UIColor colorWithRed:230.0/255.0 green:237.0/255.0 blue:241.0/255.0 alpha:1.0];
}

- (UIImage *)navigationBackgroundForBarMetrics:(UIBarMetrics)metrics
{
    UIImage *image = [[UIImage imageNamed:@"navbar_background"] resizableImageWithCapInsets:UIEdgeInsetsMake(0.0, 1.0, 0.0, 1.0)];
    return image;
}

-(UIImage *)backgroundImage
{
    return [UIImage imageNamed:@"blue_background"];
}

@end
