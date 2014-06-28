//
//  UIImageView+JHSmoothLoading.m
//
//  Created by Jon Hocking on 28/06/2014.
//  Copyright (c) 2014 Jon Hocking. All rights reserved.
//

#import "UIImageView+JHSmoothLoading.h"
#import "UIImage+JHImageAdditions.h"

@implementation UIImageView (JHSmoothLoading)

- (void)jh_setAsynchronousImageWithFileName:(NSString*)filename
{
  static NSCache *cache;
  if (!cache) {
    cache = [NSCache new];
  }
  
  if ([cache objectForKey:filename]) {
    self.image = [cache objectForKey:filename];
    return;
  }
  
  NSData *data = [NSData dataWithContentsOfFile:filename];
  [self jh_setAsynchronousImageWithData:data andCompletion:^(UIImage *image) {
    [cache setObject:image forKey:filename];
  }];
}

- (void)jh_setAsynchronousImageWithData:(NSData*)data
{
  [self jh_setAsynchronousImageWithData:data andCompletion:nil];
}

- (void)jh_setAsynchronousImageWithData:(NSData *)data andCompletion:(void(^)(UIImage* image))completion
{
  __weak typeof(self) weakself = self;
  CGSize renderSize = self.frame.size;
  dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    UIImage *image = [UIImage jh_thumbnailWithData:data andRenderSize:renderSize];
    [image jh_forceDecompression];
    dispatch_async(dispatch_get_main_queue(), ^{
      weakself.image = image;
      if (completion) {
        completion(image);
      }
    });
  });
}



@end
