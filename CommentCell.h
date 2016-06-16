//
//  CommentCell.h
//  Comments
//
//  Created by James Rochabrun on 15-06-16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CommentObject;

@interface CommentCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;

- (void)configureCellWithObject:(CommentObject*)commentObject;


@end
