//
//  SectionsTableViewController.m
//  FancyTwitter
//
//  Created by Сергей on 20.06.14.
//  Copyright (c) 2014 Sergey Mingalev. All rights reserved.
//

#import "SectionsTableViewController.h"

@interface SectionsTableViewController() {
    NSArray *sectionArray;
}

@end

@implementation SectionsTableViewController

-(id)init {
    if ((self = [super init])) {
        self.view.frame = CGRectMake(0, -4*44.0, 320, 4*44.0+64);
        
        sectionArray = @[@"Favorites",@"Timeline",@"What's New",@"Trends"];
    }
    
    return self;
}

#pragma mark - UITableViewDatasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return sectionArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    
    cell.textLabel.text = [sectionArray objectAtIndex:indexPath.row];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.delegate newSectionSelected:[sectionArray objectAtIndex:indexPath.row]];
}

@end
