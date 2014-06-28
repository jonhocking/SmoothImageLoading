//
//  UIImage+JHImageAdditions.h
//
//  Created by Jon Hocking on 28/06/2014.
//  Copyright (c) 2014 Jon Hocking. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (JHImageAdditions)

+ (UIImage*)jh_thumbnailWithData:(NSData*)data andRenderSize:(CGSize)size;
- (void)jh_forceDecompression;

@end
