# libStyles 🟩🟨🟥
libStyles is a library for easily setting, saving, and resetting drawing functions in [GameMaker: Studio 2](https://yoyogames.com/)

### How to Use It

#### 1. Style Creation
Styles are structs - each style you create has an ID that is given to you upon creation.
To create a new style, you would use the `style_create();` function like this:

    var myFirstStyle;
    myFirstStyle = style_create();
You can also add styles as an entry in an array, or as a global variable, or another struct!

Each style has several variables inside upon creation, all undefined initially:

 - color
 - font
 - alpha
 - halign
 - valign

You can set these variables through either direct or obscured methods.
*Note: You do not have to set all, or any of the included parameters listed above.*

As an example, let's check out two ways we could set the color of the style above to `c_black`.

 1. `myFirstStyle.color = c_black;`
 2. `style_set_color(myFirstStyle, c_black);`

*Note: The draw functions that can be influenced by libStyles all have functions that follow the pattern of `style_set_[attribute](style, argument);`*

 #### 2. Style Usage
 When you want to set your style settings for active drawing, all you have to do is type:
 

    style_set(style);
so in our example's case, we'd type `style_set(myFirstStyle);`

You can also stack styles - so let's say you have myFirstStyle which sets the draw color to black - but you also have another style called mySecondStyle which modifies the draw alpha. You could use both at the same time by calling `style_set(myFirstStyle, mySecondStyle);`
It's worth noting that the subsequent styles defined in the style_set parameters will overwrite values that have already been set, if those values are set in the subsequent style.

#### 3. Resetting the draw settings
You can easily reset the styles to a global default by calling:

    style_reset();


The global default drawing settings can be modified by interacting with the global style `style_default` as you would with any other style. 