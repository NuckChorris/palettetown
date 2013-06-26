# Palette Town
A ruby tool for generating vim color schemes.

## Palette Files
Palette files are just normal Ruby files, so you can use Ruby code however 
you like.  No, really; that's why I made it when there was already 
[joshuaclayton/palette](https://github.com/joshuaclayton/palette).

To demonstrate this, here's an example file.  Please. for the love of God, 
DO NOT USE THESE COLORS.  Seriously, they're hideous.
```ruby
name 'Kawaii'
author 'Desu Yo'
description 'the most super kawaii theme ever'

main_bg = "00FF00"

hi :Normal, "0000FF", main_bg
hi :LineNr, darker(hi[:Normal][:fg], 10)
hi :Boolean, :bg => main_bg
```

# Planned Features
 * Styles (italic, bold, underline)
 * Automatic console color picking
   * Support for entering the hex values of your 16-color set and using 
	those for matching.
