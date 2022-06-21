//
//  APIManager.h
//  twitter
//
//  Created by emersonmalca on 5/28/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "BDBOAuth1SessionManager.h"
#import "BDBOAuth1SessionManager+SFAuthenticationSession.h"

@interface APIManager : BDBOAuth1SessionManager

+ (instancetype)shared;
// should add function for each API request you want to support: getting user's timeline, favoriting a tweet, etc
- (void)getHomeTimelineWithCompletion:(void(^)(NSArray *tweets, NSError *error))completion;

@end
