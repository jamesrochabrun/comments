//
//  ViewController.m
//  Comments
//
//  Created by James Rochabrun on 15-06-16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import "ViewController.h"
#import "UIColor+CompanyColors.h"
#import <QuartzCore/QuartzCore.h>
#import "UIFont+CompanyFonts.h"
#import "CommentsViewController.h"

@interface ViewController ()<UIViewControllerTransitioningDelegate>
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self displayContentInViewController];
}

- (void)displayContentInViewController {
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:scrollView];
    [scrollView setContentSize:CGSizeMake(self.view.frame.size.width, self.view.frame.size.height *1.1)];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 10, self.view.frame.size.width , self.view.frame.size.height*1.1)];
    [view setBackgroundColor:[UIColor backgroundViewColor]];
    [scrollView addSubview:view];
    
    UILabel *restaurantLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, view.frame.size.width, 32)];
    [restaurantLabel setFont:[UIFont setHeadingFont]];
    [restaurantLabel setTextAlignment:NSTextAlignmentCenter];
    [restaurantLabel setTextColor:[UIColor oomamiColor]];
    [restaurantLabel setText:@"Restaurant Name"];
    [view addSubview:restaurantLabel];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 50, view.frame.size.width, self.view.frame.size.height*0.65)];
    imageView.image = [UIImage imageNamed:@"burguer"];
    imageView.contentMode = UIViewContentModeScaleToFill;
    [view addSubview:imageView];
    
    UILabel *dishLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, imageView.frame.size.height , view.frame.size.width, 32)];
    [dishLabel setFont:[UIFont setSecondaryFont]];
    [dishLabel setTextAlignment:NSTextAlignmentCenter];
    [dishLabel setTextColor:[UIColor textColor]];
    [dishLabel setText:@"Burguer with potatoe salad"];
    [imageView addSubview:dishLabel];
    
    UIImageView *profileImage = [[UIImageView alloc] initWithFrame:CGRectMake(20, imageView.frame.size.height + 5 , 40, 40)];
    profileImage.image = [UIImage imageNamed:@"sasha"];
    profileImage.layer.cornerRadius = profileImage.frame.size.width /2;
    profileImage.layer.masksToBounds = YES;
    profileImage.layer.borderColor = [UIColor oomamiColor].CGColor;
    profileImage.layer.borderWidth = 1.0f;
    [imageView addSubview:profileImage];
    
    UILabel *profileNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, imageView.frame.size.height +35, 100, 40)];
    [profileNameLabel setFont:[UIFont setSecondaryFont]];
    [profileNameLabel setTextColor:[UIColor oomamiColor]];
    [profileNameLabel setText:@"@Foodie"];
    [imageView addSubview:profileNameLabel];
    
    UIButton *commentsButton = [[UIButton alloc] initWithFrame:CGRectMake(0, imageView.frame.size.height + 120, view.frame.size.width, 40)];
    commentsButton.backgroundColor = [UIColor oomamiColor];
    [commentsButton setTitle:@"View Comments" forState:UIControlStateNormal];
    [commentsButton addTarget:self action:@selector(pushViewController) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:commentsButton];
    
    UIButton *shareButton = [[UIButton alloc] initWithFrame:CGRectMake(0, imageView.frame.size.height + 165, view.frame.size.width, 40)];
    shareButton.backgroundColor = [UIColor oomamiColor];
    [shareButton setTitle:@"share it!" forState:UIControlStateNormal];
    [shareButton addTarget:self action:@selector(onShareButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:shareButton];
}

- (void)pushViewController {
    [self performSegueWithIdentifier:@"comments" sender:self];
}

- (void)onShareButtonPressed {
    
    NSString *shareText = @"check out this restaurant!";
    NSURL *shareLink = [[NSURL alloc] initWithString:@"https://itunes.apple.com/us/app/oomami-best-restaurants-bars/id1053373398?mt=8"];
    
    UIActivityViewController *activityViewController =
    [[UIActivityViewController alloc] initWithActivityItems:@[shareText,shareLink]
                                      applicationActivities:nil];
    
    [activityViewController setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
    
    [activityViewController setExcludedActivityTypes:@[UIActivityTypePostToWeibo,
                                                       UIActivityTypeCopyToPasteboard,
                                                       UIActivityTypeMessage]];
    
    dispatch_async(dispatch_get_main_queue(), ^(void){
        [self presentViewController:activityViewController animated:YES completion:nil];
    });
}


















@end






