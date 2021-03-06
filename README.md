# Palette Town [![Gem Version](https://badge.fury.io/rb/palettetown.png)](http://badge.fury.io/rb/palettetown)
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
hi :LineNr, darker(hi[:Normal][:fg], 10.percent)
hi :String, spin(hi[:Normal][:bg], 90.degrees)
hi :Boolean, :bg => main_bg
```

### Helpers
 * `lighter(color, amount)` - Increases luminosity of a color by `amount`.
 * `darker(color, amount)` - Decreases luminosity of a color by `amount`.
 * `saturate(color, amount)` - Increases saturation of a color by `amount`.
 * `desaturate(color, amount)` - Decreases saturation of a color by `amount`.
 * `spin(color, amount)` - shifts the hue by `amount` radians.

#### Monkeypatches
 * `Fixnum#degrees` - provides a simple expression of degrees, returned in radians
 * `Fixnum#percent` - provides a simple expression of percent, returned as a decimal

## Building a palette file
Once you've written a palette file, you build it into a proper vim theme with 
the following command:

	$ palettetown build file.rb -o file.vim

## Planned Features
 * Styles (italic, bold, underline)
 * Automatic console color picking
   * Support for entering the hex values of your 16-color set and using 
	those for matching.
