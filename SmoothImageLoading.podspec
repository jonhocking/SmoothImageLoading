Pod::Spec.new do |s|
  s.name             = "SmoothImageLoading"
  s.version          = "0.1.0"
  s.summary          = "Designed to help render large images with high FPS."
  s.description      = <<-DESC
This is a set of UIImage and UIImageView categories to help you load images in smoothly, and to help you hit that 60FPS mark.

It's specifically designed for large images that you've downloaded and need to display at a smaller size.

__You should use this if:__

- You're seeing 'the pop' when your images scroll into view
- You're displaying large images at a smaller frame size
- You keep getting memory warnings because of your image usage


## Features

- Background thread image decompression
- Lightweight caching based on filename
- Lighter the memory footprint of images

                       DESC
  s.homepage         = "https://github.com/jonhocking/SmoothImageLoading"
  s.license          = 'MIT'
  s.author           = { "Jon Hocking" => "hello@jonhocking.co.uk" }
  s.source           = { :git => "https://github.com/jonhocking/SmoothImageLoading.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/jonhocking'
  s.source_files = '*.{h,m}'
  s.platform     = :ios, '6.0'
  s.requires_arc = true
  s.frameworks = 'UIKit', 'ImageIO'
end
