//
//  SectionsTableViewController.h
//  FancyTwitter
//
//  Created by Сергей on 20.06.14.
//  Copyright (c) 2014 Sergey Mingalev. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SectionsTableViewProtocol;

@interface SectionsTableViewController : UITableViewController

@property (nonatomic,weak) id <SectionsTableViewProtocol> delegate;

@end

@protocol SectionsTableViewProtocol <NSObject>

-(void)newSectionSelected:(NSString*)string;

@end
