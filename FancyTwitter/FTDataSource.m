//
//  FTDataSource.m
//  FancyTwitter
//
//  Created by Сергей on 17.06.14.
//  Copyright (c) 2014 Sergey Mingalev. All rights reserved.
//

#import "FTDataSource.h"

@implementation FTDataSource

static FTDataSource * _sharedHelper;

+ (FTDataSource *) sharedHelper {
    
    if (_sharedHelper != nil) {
        return _sharedHelper;
    }
    _sharedHelper = [[FTDataSource alloc] init];
    return _sharedHelper;
}

-(id)init{
    
	if ((self=[super init]))
	{
        [self populateTwitterData];
	}
	
	return self;
}

-(void)populateTwitterData
{
    _twitterData = @[
                     @{@"profileImage": @"beautiful.png", @"profileName":@"Beautiful Pixels",@"twitterName":@"@beautifulpixels",
                       @"text": @"Our thanks to Squarespace for sponsoring our RSS feed this week — http://beautifulpixels.com/go/sqspc"},
                     
                     @{@"profileImage": @"timcook.png", @"profileName":@"Tim Cook",@"twitterName":@"@tim_cook",
                       @"text": @"Visited Retail Stores in Palo Alto today. Seeing so many happy customers reminds us of why we do what we do."},
                     
                     @{@"profileImage": @"clarkson.png", @"profileName":@"Jeremy Clarkson",@"twitterName":@"@jeremyclarkson",
                       @"text": @"What the fuck is this? http://pic.twitter.com/5WWFRET",@"image": @"car.png"},
                     
                     @{@"profileImage": @"kim.png", @"profileName":@"Andrew Kim",@"twitterName":@"@pushingatoms",
                       @"text": @"My thoughts on 5S. You’re here for the photos though."}
                     ];
}

@end
