//
//  DetailsViewController.m
//  twitter
//
//  Created by Khloe Wright on 6/24/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import "DetailsViewController.h"
#import "TweetCell.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    // Do any additional setup after loading the view.
    _detailsName.text = _tweetDetails.user.name;
    _detailsUserName.text = _tweetDetails.user.screenName;
    _detailsDate.text = _tweetDetails.createdAtString;
    _detailsTweet.text = _tweetDetails.text;
    [_detailsRetweet setTitle:[NSString stringWithFormat:@"%i", _tweetDetails.retweetCount] forState:UIControlStateNormal];
    [_detailsLike setTitle:[NSString stringWithFormat:@"%i", _tweetDetails.favoriteCount] forState:UIControlStateNormal];
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
