//
//  ViewController.m
//  FancyTwitter
//
//  Created by Сергей on 17.06.14.
//  Copyright (c) 2014 Sergey Mingalev. All rights reserved.
//

#import "ViewController.h"
#import "FTDataSource.h"
#import "FancyTwitterTableViewCell.h"
#import "SSTheme.h"

@interface ViewController () {
    BOOL isSectionViewPresent;
}

@property (nonatomic,strong) NavBarTitleView *navBarTitleView;
@property (nonatomic,strong) SectionsTableViewController *sectionsTableViewController;



@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.backgroundImageView.image = [[ThemeManager sharedTheme] backgroundImage];
    
    self.tableView.backgroundColor = [UIColor clearColor];
    
    [self.navigationController.navigationBar setBackgroundImage:[[ThemeManager sharedTheme] navigationBackgroundForBarMetrics:UIBarMetricsDefault] forBarPosition:UIBarPositionTopAttached barMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"person"] style:UIBarButtonItemStylePlain target:self
                                                                  action:@selector(leftButtonPressed:)];
    self.navigationItem.leftBarButtonItem = leftButton;
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];

    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"pencil"] style:UIBarButtonItemStylePlain target:self
                                                                   action:@selector(rightButtonPressed:)];
    self.navigationItem.rightBarButtonItem = rightButton;
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
    
    [self setNavigationBarTitleWithString:@"Favorites"];
    
    self.sectionsTableViewController = [[SectionsTableViewController alloc] init];
    self.sectionsTableViewController.delegate = self;
    [self.view addSubview:self.sectionsTableViewController.view];
    
    isSectionViewPresent = NO;
}

-(void)setNavigationBarTitleWithString:(NSString*)string
{
    self.navBarTitleView = [[NavBarTitleView alloc] initWithString:string];
    self.navBarTitleView.delegate = self;
    self.navigationItem.titleView = self.navBarTitleView;
}

-(IBAction)leftButtonPressed:(id)sender
{
    NSLog(@"left button pressed");
}

-(IBAction)rightButtonPressed:(id)sender
{
    NSLog(@"right button pressed");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDatasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FancyTwitterTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    NSInteger index = indexPath.row%4;
    NSArray *twitterData = [[FTDataSource sharedHelper] twitterData];
    cell.tweetData = [twitterData objectAtIndex:index];

    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger index = indexPath.row%4;
    NSArray *twitterData = [[FTDataSource sharedHelper] twitterData];
    NSDictionary *thisTwittData = [twitterData objectAtIndex:index];
    
    NSString *text = [thisTwittData objectForKey:@"text"];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:0];
    [paragraphStyle setMaximumLineHeight:20.0];
    
    CGRect r = [text boundingRectWithSize:CGSizeMake(256, 100)
                                      options:NSStringDrawingUsesLineFragmentOrigin
                               attributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                           [UIFont fontWithName:@"Avenir-Roman" size:17.0], NSFontAttributeName,
                                           paragraphStyle, NSParagraphStyleAttributeName, nil]
                                        context:nil];
    
    return r.size.height + 56.0 + 6.0 + 15.0; // topX of label + bottom X of label + something 
}

#pragma mark - NavBarTitleViewProtocol

-(void)navigationBarTitlePressed
{
    if (!isSectionViewPresent) {
        [UIView animateWithDuration:0.55 animations:^{
            self.sectionsTableViewController.view.frame = CGRectMake(0, 0, self.sectionsTableViewController.view.frame.size.width,self.sectionsTableViewController.view.frame.size.height);
        }];

    } else {
        [UIView animateWithDuration:0.55 animations:^{
            self.sectionsTableViewController.view.frame = CGRectMake(0, -self.sectionsTableViewController.view.frame.size.height, self.sectionsTableViewController.view.frame.size.width,self.sectionsTableViewController.view.frame.size.height);
        }];
    }
    
    isSectionViewPresent = !isSectionViewPresent;
}

#pragma mark - SectionTableViewProtocol

-(void)newSectionSelected:(NSString *)string
{
    [self.tableView reloadData];
    [self navigationBarTitlePressed];
    [self setNavigationBarTitleWithString:string];
}

@end
