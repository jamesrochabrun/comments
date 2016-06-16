//
//  CommentCell.m
//  Comments
//
//  Created by James Rochabrun on 15-06-16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import "CommentCell.h"
#import "CommentObject.h"
#import "UIColor+CompanyColors.h"
#import "UIFont+CompanyFonts.h"

@implementation CommentCell


- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;

    UIImageView *profileImage = [[UIImageView alloc] initWithFrame:CGRectMake(20, self.frame.size.height /2 , 40, 40)];
    profileImage.image = [UIImage imageNamed:@"sasha"];
    profileImage.contentMode = UIViewContentModeScaleToFill;
    profileImage.layer.cornerRadius = profileImage.frame.size.width /2;
    profileImage.layer.masksToBounds = YES;
    profileImage.layer.borderColor = [UIColor oomamiColor].CGColor;
    profileImage.layer.borderWidth = 1.5f;
    [self addSubview:profileImage];

}

- (void)configureCellWithObject:(CommentObject*)commentObject {
    
    [self.commentLabel setAdjustsFontSizeToFitWidth:YES];
    [self.commentLabel setFont:[UIFont commentsFont]];
    [self.commentLabel setTextAlignment:NSTextAlignmentLeft];
    [self.commentLabel setTextColor:[UIColor textColor]];
    [self.commentLabel setText:commentObject.comment];
}




@end
