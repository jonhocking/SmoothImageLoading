#Smooth Image Loading

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


## Why is the memory usage so much lower?

I use the ImageIO framework to render large images out at the exact size needed. This is a lot different to the usual Core Animation scaling you get when setting a big image in a small frame.

The big upshot of this comes when you're scrolling or animating the images as you no longer have to shift around and dump wasted pixels and memory with every frame. 

## What kind of benefits can I expect to see?

As an example, I was able to take a 5000x2500 image, rendered at 320x160, and improve the FPS from 2 to 60 in a table view of 100 images. The memory usage went from ~300mb to 10.5mb (caching off, 22mb with caching enabled). 

Both of these metrics are big improvements :)

If you want to talk to me about any of this then hit me up on Twitter - I'm [@jonhocking](https://twitter.com/jonhocking)

