//
//  TimelineViewController.m
//  twitter
//
//  Created by emersonmalca on 5/28/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "TimelineViewController.h"
#import "ComposeViewController.h"
#import "APIManager.h"
#import "AppDelegate.h"
#import "LoginViewController.h"
#import "Tweet.h"
#import "TweetCell.h"
#import "UIImageView+AFNetworking.h"
#import "DetailsViewController.h"

@interface TimelineViewController () <ComposeViewControllerDelegate, UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) UIRefreshControl *refreshControl;

@property (strong, nonatomic) NSMutableArray *arrayOfTweets;

@end

@implementation TimelineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(beginRefresh:) forControlEvents:UIControlEventValueChanged];
    [self beginRefresh:self.refreshControl];
    [self.tableView insertSubview:refreshControl atIndex:0]; //adding refresh to table view
    // Get timeline
    
    
    
    
}

-(void)beginRefresh:(UIRefreshControl *)refreshControl {
    [[APIManager shared] getHomeTimelineWithCompletion:^(NSArray *tweets, NSError *error) {
        if (tweets) {
            NSLog(@"😎😎😎 Successfully loaded home timeline");
            // cast tweets to a mutable array
            //self.arrayOfTweets = [self tweetsWithArray:tweets]; //casting tweets to a mutable array
            self.arrayOfTweets = (NSMutableArray *)tweets;
            for (Tweet *tweet in tweets) {
                //NSString *text = dictionary[@"text"];
                NSString *text = tweet.text;
                NSLog(@"%@", text);
            }
            // Reload the tableView now that there is new data
             [self.tableView reloadData];

            // Tell the refreshControl to stop spinning
             [refreshControl endRefreshing];
        } else {
            NSLog(@"😫😫😫 Error getting home timeline: %@", error.localizedDescription);
        }
        [self.tableView reloadData];
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrayOfTweets.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TweetCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"TweetCell"forIndexPath:indexPath];
    
    cell.tweet = self.arrayOfTweets[indexPath.row];
    [cell refreshData];
    
    
    return cell;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    // setting timeline view controller as the delgate of the compose view controller
    if ([sender isEqual:@"TweetCell"]) {
        NSIndexPath *myIndexPath = [self.tableView indexPathForCell:sender];
        Tweet *tweetToExpand = self.arrayOfTweets[myIndexPath.row];
        DetailsViewController *detailsVC = [segue destinationViewController];
        detailsVC.tweetDetails = tweetToExpand;
        
    } else {
        UINavigationController *navigationController = [segue destinationViewController];
        ComposeViewController *composeController = (ComposeViewController*)navigationController.topViewController;
            composeController.delegate = self;
    }
    
}



- (IBAction)didTapLogout:(id)sender {
    
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LoginViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    appDelegate.window.rootViewController = loginViewController;
    
    [[APIManager shared] logout];

}
- (void)didTweet:(nonnull Tweet *)tweet {
    [self.arrayOfTweets insertObject:tweet atIndex:0];
    [self.tableView reloadData];
    
}



@end
