//
//  ComposeViewController.h
//  twitter
//
//  Created by Khloe Wright on 6/22/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"

NS_ASSUME_NONNULL_BEGIN

//protocol: since other view controllers could potentially be presenting the ComposeViewController, this protocol creates a contract between the ComposeViewController and whichever view controller presented it.
@protocol ComposeViewControllerDelegate

- (void)didTweet:(Tweet *)tweet;

@end

@interface ComposeViewController : UIViewController

@property (nonatomic, weak) id<ComposeViewControllerDelegate> delegate;

@end



NS_ASSUME_NONNULL_END
