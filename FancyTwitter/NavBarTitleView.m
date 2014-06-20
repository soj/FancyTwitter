//
//  NavBarTitleView.m
//  FancyTwitter
//
//  Created by Сергей on 19.06.14.
//  Copyright (c) 2014 Sergey Mingalev. All rights reserved.
//

#import "NavBarTitleView.h"

@implementation NavBarTitleView

-(id)initWithString:(NSString*)titleString
{
    CGFloat width = 200.0;
    CGFloat height = 44.0;
    CGFloat delta = 3.0;
    
    if ((self = [super initWithFrame:CGRectMake(0, 0, width, height)])) {
        
        UIImage *arrowImage = [UIImage imageNamed:@"arrow"];
        
        UIFont *titleFont = [UIFont fontWithName:@"Avenir-Roman" size:18.0];
        
        CGRect r = [titleString boundingRectWithSize:CGSizeMake(width, height)
                                      options:NSStringDrawingUsesLineFragmentOrigin
                                   attributes:@{NSFontAttributeName:titleFont}
                                      context:nil];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.center.x - (r.size.width + delta + arrowImage.size.width)/2.0 , 10, r.size.width, r.size.height)];
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.font = titleFont;
        titleLabel.text = titleString;
        [self addSubview:titleLabel];
        
        UIImageView *arrowImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow"]];
        arrowImageView.frame = CGRectMake(titleLabel.frame.origin.x + titleLabel.frame.size.width + delta, titleLabel.frame.origin.y + 8.0, arrowImage.size.width, arrowImage.size.height);
        [self addSubview:arrowImageView];
        
        UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(buttonPressed:)];
        [self addGestureRecognizer:tapRecognizer];
    }
    
    return self;
}

-(IBAction)buttonPressed:(id)sender
{
   [self.delegate navigationBarTitlePressed];
}

@end
