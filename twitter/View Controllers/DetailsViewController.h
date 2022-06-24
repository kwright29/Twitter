//
//  DetailsViewController.h
//  twitter
//
//  Created by Khloe Wright on 6/24/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailsViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *detailsProfilePic;
@property (strong, nonatomic) IBOutlet UILabel *detailsName;
@property (strong, nonatomic) IBOutlet UILabel *detailsUserName;
@property (strong, nonatomic) IBOutlet UILabel *detailsTweet;
@property (strong, nonatomic) IBOutlet UIButton *detailsRetweet;
@property (strong, nonatomic) IBOutlet UIButton *detailsLike;
@property (strong, nonatomic) IBOutlet UILabel *detailsDate;
@property (strong, nonatomic) Tweet *tweetDetails;


@end

NS_ASSUME_NONNULL_END
