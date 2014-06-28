//
//  UIImageView+JHSmoothLoading.h
//
//  Created by Jon Hocking on 28/06/2014.
//  Copyright (c) 2014 Jon Hocking. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (JHSmoothLoading)
- (void)jh_setAsynchronousImageWithFileName:(NSString*)filename;
- (void)jh_setAsynchronousImageWithData:(NSData*)data;
@end
