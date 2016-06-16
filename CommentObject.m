//
//  CommentObject.m
//  Comments
//
//  Created by James Rochabrun on 15-06-16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import "CommentObject.h"

@implementation CommentObject

- (instancetype)initWithString:(NSString*)comment {
    self = [super init];
    if (self) {
        _comment = comment;
    }
    return self;
}

@end
