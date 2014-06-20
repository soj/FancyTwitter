//
//  FancyTwitterTableViewCell.m
//  FancyTwitter
//
//  Created by Сергей on 17.06.14.
//  Copyright (c) 2014 Sergey Mingalev. All rights reserved.
//

#import "FancyTwitterTableViewCell.h"
#import "SSTheme.h"

@interface FancyTwitterTableViewCell() {
    NSMutableParagraphStyle *paragrahStyle;
}

@property (nonatomic,weak) IBOutlet UIImageView *profileImageView;
@property (nonatomic,weak) IBOutlet UIImageView *twittImageView;

@property (nonatomic,weak) IBOutlet UILabel *profileNameLabel;
@property (nonatomic,weak) IBOutlet UILabel *twitterNameLabel;
@property (nonatomic,weak) IBOutlet UILabel *twittTextLabel;

@end

@implementation FancyTwitterTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    self.profileNameLabel.textColor = [[ThemeManager sharedTheme] profileNameColor];
    self.profileNameLabel.font = [UIFont fontWithName:@"Avenir-Roman" size:21.0];
    
    self.twitterNameLabel.textColor = [[ThemeManager sharedTheme] twitterNameColor];
    self.twitterNameLabel.font = [UIFont fontWithName:@"Avenir-Roman" size:16.0];

    self.twittTextLabel.textColor = [[ThemeManager sharedTheme] tweetColor];
    self.twittTextLabel.font = [UIFont fontWithName:@"Avenir-Roman" size:17.0];
    
    [self.profileImageView.layer setCornerRadius:20.0];
    self.profileImageView.clipsToBounds = YES;

    [self.twittImageView.layer setCornerRadius:20.0];
    self.twittImageView.clipsToBounds = YES;
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    paragrahStyle = [[NSMutableParagraphStyle alloc] init];
    [paragrahStyle setLineSpacing:0];
    [paragrahStyle setMaximumLineHeight:20.0];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(NSAttributedString*)getAttributedTweet:(NSString*)tweet
{
    NSError *error = NULL;
    NSDataDetector *detector =
      [NSDataDetector dataDetectorWithTypes:NSTextCheckingTypeLink error:&error];
    
    NSArray *matches = [detector matchesInString:tweet
                                         options:0
                                           range:NSMakeRange(0, [tweet length])];
    
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:tweet];
    
    for (NSTextCheckingResult *match in matches) {
        
        NSString *stringWithoutHttp = [[[match URL] absoluteString]
                                       stringByReplacingOccurrencesOfString:@"http://" withString:@""];
        [string replaceCharactersInRange:[match range] withString:stringWithoutHttp];
        NSRange oldRange = [match range];
        NSRange newRange = NSMakeRange(oldRange.location, oldRange.length-7);
        [string addAttribute:NSForegroundColorAttributeName
                       value:[UIColor colorWithRed:253.0/255.0 green:166.0/255.0 blue:118.0/255.0 alpha:1.0]
                       range:newRange];
        
    }

    [string addAttribute:NSParagraphStyleAttributeName value:paragrahStyle range:NSMakeRange(0, [string length])];

    return string;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.profileNameLabel.text = [self.tweetData objectForKey:@"profileName"];
    self.twitterNameLabel.text = [self.tweetData objectForKey:@"twitterName"];
    
    if ([self.tweetData objectForKey:@"profileImage"]) {
        self.profileImageView.image = [UIImage imageNamed:[self.tweetData objectForKey:@"profileImage"]];
    } else {
        self.profileImageView.image = nil; // или placeholder.png
    }

    if ([self.tweetData objectForKey:@"image"]) {
        self.twittImageView.image = [UIImage imageNamed:[self.tweetData objectForKey:@"image"]];
    } else {
        self.twittImageView.image = nil;
    }
    
    self.twittTextLabel.attributedText = [self getAttributedTweet:[self.tweetData objectForKey:@"text"]];
}

@end
