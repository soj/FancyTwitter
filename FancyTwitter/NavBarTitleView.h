//
//  NavBarTitleView.h
//  FancyTwitter
//
//  Created by Сергей on 19.06.14.
//  Copyright (c) 2014 Sergey Mingalev. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NavBarTitleViewProtocol;

@interface NavBarTitleView : UIView

@property (nonatomic,weak) id <NavBarTitleViewProtocol> delegate;

-(id)initWithString:(NSString*)titleString;

@end

@protocol NavBarTitleViewProtocol <NSObject>

-(void)navigationBarTitlePressed;

@end
