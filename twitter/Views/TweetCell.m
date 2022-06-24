//
//  TweetCell.m
//  twitter
//
//  Created by Khloe Wright on 6/21/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import "TweetCell.h"
#import "UIImageView+AFNetworking.h"
#import "Tweet.h"
#import "APIManager.h"
#import "DateTools.h"

@implementation TweetCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)refreshData {
   //for favoriting and unfavoriting
    self.favoritedCount.text = [NSString stringWithFormat:@"%i", self.tweet.favoriteCount];
    if (self.tweet.favorited) {
        [self.favoriteButton setImage:[UIImage imageNamed:@"favor-icon-red"] forState:UIControlStateNormal];
    } else {
        [self.favoriteButton setImage:[UIImage imageNamed:@"favor-icon"] forState:UIControlStateNormal];
    }
  
    // for retweeting and unretweeting
    self.retweetCount.text = [NSString stringWithFormat:@"%i", self.tweet.retweetCount];
    if (self.tweet.retweeted) {
        [self.retweetButton setImage:[UIImage imageNamed:@"retweet-icon-green"] forState:UIControlStateNormal];
    } else {
        [self.retweetButton setImage:[UIImage imageNamed:@"retweet-icon"] forState:UIControlStateNormal];
    }
    
   
    
       
        

    
}
- (void)setTweet:(Tweet *)tweet {
    _tweet = tweet;
    
    self.displayName.text = self.tweet.user.name;
    self.username.text = self.tweet.user.screenName;
    self.createdDate.text = self.tweet.createdAtString;
    self.textOfTweet.text = self.tweet.text;
    
    NSString *favoriteCountString = [NSString stringWithFormat:@"%i", self.tweet.favoriteCount];
    self.favoritedCount.text = favoriteCountString;
    
    NSString *retweetCountString = [NSString stringWithFormat:@"%i", self.tweet.retweetCount];
    self.retweetCount.text = retweetCountString;
    
    
    NSURL *profilePicURL = [NSURL URLWithString:self.tweet.user.profilePicture];
    [self.profilePic setImageWithURL:profilePicURL];
    
    
}

- (IBAction)didTapReply:(id)sender {
}

- (IBAction)didTapFavorite:(id)sender {
    if (self.tweet.favorited) {
        self.tweet.favorited = NO;
        self.tweet.favoriteCount -= 1;
        
        [self refreshData];
        [[APIManager shared] unfavorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
             if(error){
                  NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
             }
             else{
                 NSLog(@"Successfully unfavorited the following Tweet: %@", tweet.text);
             }
         }];

        
    }
    else {
        // TODO: Update the local tweet model
        self.tweet.favorited = YES;
        self.tweet.favoriteCount += 1;
        
        // TODO: Update cell UI
        [self refreshData];
        
        // TODO: Send a POST request to the POST favorites/create endpoint uploads data real time
        [[APIManager shared] favorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
             if(error){
                  NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
             }
             else{
                 NSLog(@"Successfully favorited the following Tweet: %@", tweet.text);
             }
         }];

    }
    
}


- (IBAction)didTapRetweet:(id)sender {
    if (self.tweet.retweeted != YES) {
        // TODO: Update the local tweet model
        self.tweet.retweeted = YES;
        self.tweet.retweetCount += 1;
        // TODO: Update cell UI
        [self refreshData];
        // TODO: Send a POST request to the POST favorites/create endpoint uploads data real time
        [[APIManager shared] retweet:self.tweet completion:^(Tweet *tweet, NSError *error) {
             if(error){
                  NSLog(@"Error retweeting tweet: %@", error.localizedDescription);
             }
             else{
                 NSLog(@"Successfully retweeted the following Tweet: %@", tweet.text);
             }
         }];
    } else {
        self.tweet.retweeted = NO;
        self.tweet.retweetCount -= 1;
        
        [self refreshData];
        [[APIManager shared] unretweet:self.tweet completion:^(Tweet *tweet, NSError *error) {
             if(error){
                  NSLog(@"Error retweeting tweet: %@", error.localizedDescription);
             }
             else{
                 NSLog(@"Successfully retweeted the following Tweet: %@", tweet.text);
             }
         }];
        
    }
    
}
@end
