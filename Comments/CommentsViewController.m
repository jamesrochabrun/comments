//
//  CommentsViewController.m
//  Comments
//
//  Created by James Rochabrun on 15-06-16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import "CommentsViewController.h"
#import "CommentObject.h"
#import "CommentCell.h"
#import "UIColor+CompanyColors.h"

@interface CommentsViewController()<UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIButton *addButton;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property NSMutableArray *commentsArray;
@property (weak, nonatomic) IBOutlet UIView *addCommentBackgroundView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;



@end

@implementation CommentsViewController

- (void)viewDidLoad {
 
    self.title = @"Comments";
    self.tableView.separatorStyle = UITableViewStylePlain;
    self.textField.placeholder = @"add a comment";
    self.commentsArray = [NSMutableArray new];
    self.addButton.layer.cornerRadius = 8;
    self.addButton.clipsToBounds = YES;
    NSArray *dummyData = @[@"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer id tempus odio. Aenean a ligula arcu. Nam nec arcu id libero", @"i love it, it was one of the best places ever!, I will come back for my birthday 😊", @"not so good for the price, I don think that I am coming back", @"Integer viverra ex sit amet nibh rhoncus vehicula. Pellentesque faucibus velit ac tellus"];
    
    for (NSString *commentStr  in dummyData) {
        CommentObject *comment = [[CommentObject alloc]initWithString:commentStr];
        [self.commentsArray addObject:comment];
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CommentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    CommentObject *commentObject = [self.commentsArray objectAtIndex:indexPath.row];
    [cell configureCellWithObject:commentObject];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.commentsArray.count;
}

- (IBAction)onAddCommentButtonPressed:(UIButton *)sender {

    if (self.textField.text.length > 0) {
        NSString *newComment = self.textField.text;
        CommentObject *commentObject = [[CommentObject alloc] initWithString:newComment];
        //if we want to add the comment at the last index
        [self.commentsArray addObject:commentObject];
        //or if we want to add it at the begining
//        [self.commentsArray insertObject:commentObject atIndex:0];
        [self dismissKeyboard:sender];
        self.textField.text = @"";
    }
    
    [self.tableView setContentOffset:CGPointMake(0, CGFLOAT_MAX)];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}


#pragma textfieldDelegate Methods

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:.3];
    [UIView setAnimationBeginsFromCurrentState:TRUE];
    self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y -253, self.view.frame.size.width, self.view.frame.size.height);
    
    [UIView commitAnimations];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:.3];
    [UIView setAnimationBeginsFromCurrentState:TRUE];
    self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y +253, self.view.frame.size.width, self.view.frame.size.height);
    [UIView commitAnimations];
}

- (void) dismissKeyboard:(id)sender {
    [self.view endEditing:YES];
    [self.textField resignFirstResponder];
}














@end
