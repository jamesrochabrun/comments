//
//  UIFont+CompanyFonts.m
//  Comments
//
//  Created by James Rochabrun on 15-06-16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import "UIFont+CompanyFonts.h"

@implementation UIFont (CompanyFonts)

+ (UIFont *)setHeadingFont {
    return [UIFont fontWithName:@"Lato-Medium" size:18];
}

+ (UIFont *)setSecondaryFont {
    return [UIFont fontWithName:@"Lato-Regular" size:15];
}

+ (UIFont *)commentsFont {
    return [UIFont fontWithName:@"Lato-Regular" size:17];
}
@end
