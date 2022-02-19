// libStyles 1.0.1 written by Brian LaClair
// for documentation visit https://github.com/brianlaclair/libStyles

#region Library Initialisation
// Init for the system
globalvar style_default;

// Creates a default style that can be modified
style_default = {
		font:	draw_get_font(),
		halign: draw_get_halign(),
		valign: draw_get_valign(),
		color:	draw_get_color(),
		alpha:	draw_get_alpha()
	}
#endregion

#region Important functions

function __style_define_list() {

	// If you want to add more style struct members, add them to this list
	// And then set the corresponding function in the next line
	return { memberName: ["font", "halign", "valign", "color", "alpha"],
		memberFunction: [draw_set_font, draw_set_halign, draw_set_valign, draw_set_color, draw_set_alpha] };
		
}

/// @function					style_create();
/// @description				Creates a new style
/// @returns {real} Style ID	Style ID value
function style_create() constructor {
	
	var _default = __style_define_list();
	
	_style = { }; // We'll fill this in the next line
	
	for (var _i = 0; _i < array_length(_default.memberName); _i++) {
		variable_struct_set(_style, _default.memberName[_i], undefined);
	}
	show_debug_message(_style);
	
	return _style;

}

/// @function					style_set();
/// @description				Sets the style(s)
/// @param {...real} Style ID	The style ID to set
/// @returns	{struct}		The replaced style			
function style_set(style) {

	var _returnStyle = {
		font:	draw_get_font(),
		halign: draw_get_halign(),
		valign: draw_get_valign(),
		color:	draw_get_color(),
		alpha:	draw_get_alpha()
	}

	var _howMany = argument_count;
	var _default = __style_define_list();
	
	for(var _styles = 0; _styles < _howMany; _styles++) {

		for(var _i = 0; _i < array_length(_default.memberName); _i++) {
			
			_val = variable_struct_get(argument[_styles], _default.memberName[_i]);
			
			// Only set a value if it's defined
			if (!is_undefined(_val)) {
					script_execute(_default.memberFunction[_i], _val);
			}
		}
	}
	
	return _returnStyle;
	
}

/// @function				style_reset();
/// @description			Resets the style to default values
/// @param	{real} 	[style]	Defaults to style_default
function style_reset(_style = style_default) {
	style_set(_style);
}

#endregion

#region Obscured struct input

/// @function				style_set_color();
/// @description			Sets the color of a style
/// @param {real} Style		The Style ID to set	
/// @param {color} Color	What color to set it to
function style_set_color(style, _color) {

	style.color = _color;

}

/// @function				style_set_alpha();
/// @description			Sets the alpha of a style
/// @param {real} Style		The Style ID to set	
/// @param {number} Alpha	What to set the alpha to
function style_set_alpha(style, _alpha) {

	style.alpha = _alpha;

}

/// @function				style_set_font();
/// @description			Sets the font of a style
/// @param {real} Style		The Style ID to set	
/// @param {real} Alpha		What to set the font to
function style_set_font(style, _font) {

	style.font = _font;

}

/// @function				style_set_halign();
/// @description			Sets the horizontal alignment of a style
/// @param {real} Style		The Style ID to set	
/// @param {real} Alignment	What to set the horizontal alignment to
function style_set_halign(style, _halign) {

	style.halign = _halign;

}

/// @function				style_set_halign();
/// @description			Sets the vertical alignment of a style
/// @param {real} Style		The Style ID to set	
/// @param {real} Alignment	What to set the vertical alignment to
function style_set_valign(style, _valign) {

	style.valign = _valign;

}

#endregion