//
//  ComposeViewController.m
//  twitter
//
//  Created by Khloe Wright on 6/22/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import "ComposeViewController.h"
#import "APIManager.h"

@interface ComposeViewController ()
@property (strong, nonatomic) IBOutlet UITextView *composeTweetText;

@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)doesTapTweet:(id)sender {
    [[APIManager shared] postStatusWithText:@"" completion:^(Tweet *tweet, NSError *error) {
        if (tweet) {
            
        }
    }];
}
- (IBAction)doesTapClose:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}

@end
