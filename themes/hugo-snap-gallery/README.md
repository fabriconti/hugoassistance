<!--
  SPDX-FileCopyrightText: 2020 Max Mehl <mail@mehl.mx>
  SPDX-License-Identifier: MIT
-->

# hugo-snap-gallery

Automagical css image gallery in [Hugo](https://gohugo.io/) using shortcodes. No JavaScript is used, just plain CSS.

## Features

- Custom `{{< figure >}}` shortcode that enables new features but is mostly backwards-compatible with Hugo's built-in `{{< figure >}}`shortcode
- All pictures can be expanded on click in a CSS-only lightbox
- Use the `{{< figure >}}` shortcode by itself to enable pretty captions
- Put multiple `{{< figure >}}` shortcodes inside a `{{< gallery >}}` to create a pretty image gallery
- Use the `{{< snap-dir >}}` shortcode inside a `{{< gallery >}}` to show all containing files nicely
- Next/prev buttons in galleries
- The gallery is responsive, images are scaled/cropped to fill square tiles
- Pretty captions outside and inside lightbox
- Only requires 4kB of CSS (unminified; you can minify it if you want)
- CSS is automatically loaded the first time you use the `{{< figure >}}` shortcode on each page


## Installation

Use this like an additional Hugo theme, so add it to the `theme` config. Example:

```
theme = [ "hugo-sustain", "hugo-snap-gallery" ]
```


## `{{< figure >}}` shortcode usage

Specifying your image files:

- `{{< figure src="image.jpg" >}}` will just show the image with no caption, and open the full version of it when clicked
- `{{< figure src="image.jpg" caption="My description" >}}` will show the image and open the full version of it when clicked, and shows the caption text in both views. Markdown is possible
- `{{< figure src="image.jpg" link="http://example.com" >}}` will use `image.jpg` for thumbnail and link to `http://example.com` when clicked

Optional parameters:

- All the [features/parameters](https://gohugo.io/content-management/shortcodes/#figure) of Hugo's built-in `figure` shortcode work as normal, i.e. src, link, rel, title, caption, class, attr (attribution), attrlink, alt. width and height might lead to strange results when used inside `{{< gallery >}}`.
- `class` allows you to set any custom classes you want on the `<figure>` tag. The values `no-border`, `sm`, `md`, `lg`, `pull-left` and `pull-right` are made available by this project.
- `lightbox` allows you to control the lightbox. The value `none` will disable the lightbox completely.

Optional parameters work for standalone `{{< figure >}}` shortcodes and inside of `{{< gallery >}}`. However, they cannot be applied to `{{< snap-dir >}}`.


## `{{< gallery >}}` shortcode usage

### Using defined images

To specify individual image files, call it like in the following example. All parameters for the figure should work as described above.


```
{{< gallery >}}
  {{< figure src="image1.jpg" >}}
  {{< figure src="image2.jpg" >}}
  {{< figure src="image3.jpg" >}}
{{< /gallery >}}
```

Inside of the lightbox (so when clicked on one image), you will see forward and backward arrows on the right and left side. The backward arrow will not work when you are on the first image of a gallery. The forward arrow however will still show when on the last image but just close the frame.


### Using a whole directory

To specify a directory full of image files, use the example below. This will use all files (make sure it's only images!) and display them in a gallery. You cannot define captions or other parameters for the individual images:

```
{{< gallery >}}
  {{< snap-dir srcdir="/img/blog/orr" >}}
{{< /gallery >}}
```

The navigation inside the lightbox will work as with the individually defined gallery image, and even recognise when the gallery is at its last image.


## CSS Hackers

`snap-gallery.css` is designed to provide square tiles. The gallery contains three tiles per row on larger screens, and will limit to 2 or 1 tile per row if the screen is smaller. To change that, you should look at the three definition of `.snap-gallery figure`. Please feel free to contact me if you found a more flexible way to change that.

Other than that, the CSS should be simple enough to allow modifications.

## Credits

The original inspiration for this shortcode comes from [Li-Wen Yip's easy-gallery](https://github.com/liwenyip/hugo-easy-gallery). However, snap-gallery is a 98% rewrite.

## License

This repository follows the REUSE best practices for clear copyright and licensing information. The license texts for all used licenses can be found in the LICENSES/ directory under the root of this repository. Visit [reuse.software](https://reuse.software) for more information.

The main license of this repo is MIT.
