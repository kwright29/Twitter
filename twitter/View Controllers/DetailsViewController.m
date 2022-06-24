//
//  DetailsViewController.m
//  twitter
//
//  Created by Khloe Wright on 6/24/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import "DetailsViewController.h"
#import "TweetCell.h"
#import "APIManager.h"
#import "UIImageView+AFNetworking.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self refreshData];
   
    // Do any additional setup after loading the view.
    _detailsName.text = _tweetDetails.user.name;
    _detailsUserName.text = _tweetDetails.user.screenName;
    _detailsDate.text = _tweetDetails.createdAtString;
    _detailsTweet.text = _tweetDetails.text;
    [_detailsRetweet setTitle:[NSString stringWithFormat:@"%i", _tweetDetails.retweetCount] forState:UIControlStateNormal];
    [_detailsLike setTitle:[NSString stringWithFormat:@"%i", _tweetDetails.favoriteCount] forState:UIControlStateNormal];
    NSURL *profilePicURL = [NSURL URLWithString:_tweetDetails.user.profilePicture];
    [_detailsProfilePic setImageWithURL:profilePicURL];
}
- (void)refreshData {
    if (_tweetDetails.retweeted) {
        [_detailsRetweet setSelected:YES];
    } else {
        [_detailsRetweet setSelected:NO];
    }
    [_detailsRetweet setTitle:[NSString stringWithFormat:@"%i", _tweetDetails.retweetCount] forState:UIControlStateNormal];
    
    if (_tweetDetails.favorited) {
        [_detailsLike setSelected:YES];
    } else {
        [_detailsLike setSelected:NO];
    }
    [_detailsLike setTitle:[NSString stringWithFormat:@"%i", _tweetDetails.favoriteCount] forState:UIControlStateNormal];

}
- (IBAction)detailsDidTapRT:(id)sender {
    if (_tweetDetails.retweeted != YES) {
        // TODO: Update the local tweet model
        _tweetDetails.retweeted = YES;
        _tweetDetails.retweetCount += 1;
        // TODO: Update cell UI
        
        // TODO: Send a POST request to the POST favorites/create endpoint uploads data real time
        [[APIManager shared] retweet:_tweetDetails completion:^(Tweet *tweet, NSError *error) {
             if(error){
                  NSLog(@"Error retweeting tweet: %@", error.localizedDescription);
             }
             else{
                 NSLog(@"Successfully retweeted the following Tweet: %@", tweet.text);
             }
         }];
    } else {
        _tweetDetails.retweeted = NO;
        _tweetDetails.retweetCount -= 1;
        
        
        [[APIManager shared] unretweet:_tweetDetails completion:^(Tweet *tweet, NSError *error) {
             if(error){
                  NSLog(@"Error retweeting tweet: %@", error.localizedDescription);
             }
             else{
                 NSLog(@"Successfully retweeted the following Tweet: %@", tweet.text);
             }
         }];
        
    }
    [self refreshData];
    
  
}
- (IBAction)detailsDidTapLike:(id)sender {
    if (_tweetDetails.favorited) {
        _tweetDetails.favorited = NO;
        _tweetDetails.favoriteCount -= 1;
        
        //[self refreshData];
        [[APIManager shared] unfavorite:_tweetDetails completion:^(Tweet *tweet, NSError *error) {
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
        _tweetDetails.favorited = YES;
        _tweetDetails.favoriteCount += 1;
        
        // TODO: Update cell UI
        //[self refreshData];
        
        // TODO: Send a POST request to the POST favorites/create endpoint uploads data real time
        [[APIManager shared] favorite:_tweetDetails completion:^(Tweet *tweet, NSError *error) {
             if(error){
                  NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
             }
             else{
                 NSLog(@"Successfully favorited the following Tweet: %@", tweet.text);
             }
         }];

    }
    [self refreshData];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
