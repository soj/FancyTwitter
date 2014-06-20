//
//  ViewController.h
//  FancyTwitter
//
//  Created by Сергей on 17.06.14.
//  Copyright (c) 2014 Sergey Mingalev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavBarTitleView.h"
#import "SectionsTableViewController.h"

@interface ViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,NavBarTitleViewProtocol,SectionsTableViewProtocol>

@property (nonatomic,weak) IBOutlet UIImageView *backgroundImageView;
@property (nonatomic,weak) IBOutlet UITableView *tableView;

@end
