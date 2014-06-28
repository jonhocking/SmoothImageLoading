//
//  UIImage+JHImageAdditions.m
//
//  Created by Jon Hocking on 28/06/2014.
//  Copyright (c) 2014 Jon Hocking. All rights reserved.
//

#import "UIImage+JHImageAdditions.h"
@import ImageIO;

@implementation UIImage (JHImageAdditions)

+ (CGFloat)jh_maxDimensionsFromImageData:(NSData*)data atRenderSize:(CGSize)size
{
  UIImage *image = [UIImage imageWithData:data];
  CGFloat imageAR = image.size.width / image.size.height;
  image = nil;
  
  CGFloat maxDim = 0.0;
  CGFloat boundsAR = size.width / size.height;
  
  if((imageAR > 1.0 && boundsAR < 1.0) || (imageAR < 1.0 && boundsAR > 1.0)) { // different orientations
    maxDim = MIN(size.width, size.height);
  } else { // same orientation
    maxDim = MAX(size.width, size.height);
  }
  return maxDim * [[UIScreen mainScreen] scale];
}

+ (UIImage*)jh_thumbnailWithData:(NSData*)data andRenderSize:(CGSize)size
{
  CGImageSourceRef imageSource = CGImageSourceCreateWithData((__bridge CFDataRef)(data), NULL);
  NSNumber *maxDimension = @([self jh_maxDimensionsFromImageData:data atRenderSize:size]);
  NSDictionary *imageOptions = @{
                                 (__bridge NSString *)kCGImageSourceCreateThumbnailFromImageAlways : @YES,
                                 (__bridge NSString *)kCGImageSourceThumbnailMaxPixelSize : maxDimension
                                 };
  
  CGImageRef imageRef = CGImageSourceCreateThumbnailAtIndex(imageSource, 0, (__bridge CFDictionaryRef)imageOptions);
  UIImage *image = [UIImage imageWithCGImage:imageRef scale:[[UIScreen mainScreen] scale] orientation:UIImageOrientationUp];
  CFRelease(imageRef);
  CFRelease(imageSource);
  return image;
}

- (void)jh_forceDecompression
{
  UIGraphicsBeginImageContextWithOptions(self.size, YES, self.scale);
  [self drawAtPoint:CGPointZero];
  UIGraphicsEndImageContext();
}

@end
