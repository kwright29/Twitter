//
//  TweetCell.m
//  twitter
//
//  Created by Khloe Wright on 6/21/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import "TweetCell.h"
#import "UIImageView+AFNetworking.h"

@implementation TweetCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setTweet:(Tweet *)tweet {
    _tweet = tweet;
    
    self.displayName.text = self.tweet.user.name;
    self.username.text = self.tweet.user.screenName;
    self.createdDate.text = self.tweet.createdAtString;
    self.textOfTweet.text = self.tweet.text;
    NSURL *profilePicURL = [NSURL URLWithString:self.tweet.user.profilePicture];
    [self.profilePic setImageWithURL:profilePicURL];
    
    
}

- (IBAction)didTapReply:(id)sender {
}

- (IBAction)didTapFavorite:(id)sender {
}

- (IBAction)didTapRetweet:(id)sender {
}
@end
