//
//  FTDataSource.h
//  FancyTwitter
//
//  Created by Сергей on 17.06.14.
//  Copyright (c) 2014 Sergey Mingalev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FTDataSource : NSObject

+ (FTDataSource *) sharedHelper;

@property (nonatomic,readonly) NSArray *twitterData;

@end
