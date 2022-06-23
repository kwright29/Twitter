//
//  TweetCell.h
//  twitter
//
//  Created by Khloe Wright on 6/21/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"

NS_ASSUME_NONNULL_BEGIN

@interface TweetCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *profilePic;
@property (strong, nonatomic) IBOutlet UILabel *displayName;
@property (strong, nonatomic) IBOutlet UILabel *username;
@property (strong, nonatomic) IBOutlet UILabel *createdDate;
@property (strong, nonatomic) IBOutlet UILabel *textOfTweet;
- (IBAction)didTapRetweet:(id)sender;
- (IBAction)didTapFavorite:(id)sender;
- (IBAction)didTapReply:(id)sender;
@property (strong, nonatomic) Tweet *tweet;

//- (void)configureTweet:(Tweet *)tweet;

@end

NS_ASSUME_NONNULL_END
