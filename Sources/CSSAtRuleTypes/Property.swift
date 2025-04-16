//@property
//
//
//Baseline 2024
//NEWLY AVAILABLE
//
//
//
//The @property CSS at-rule is part of the CSS Houdini set of APIs. It allows developers to explicitly define CSS custom properties, allowing for property type checking and constraining, setting default values, and defining whether a custom property can inherit values or not.
//
//The @property rule represents a custom property registration directly in a stylesheet without having to run any JavaScript. Valid @property rules result in a registered custom property, which is similar to calling registerProperty() with equivalent parameters.
//
//Syntax
//CSS
//Copy to Clipboard
//@property --rotation {
//  syntax: "<angle>";
//  inherits: false;
//  initial-value: 45deg;
//}
//The custom property name is a <dashed-ident> that starts with -- and is followed by a valid, user-defined identifier. It is case-sensitive.
//
//Descriptors
//syntax
//A string that describes the allowed value types for the registered custom property. May be a data type name (such as <color>, <length>, or <number>, etc.), with multipliers (+, #) and combinators (|), or a custom ident. See the syntax descriptor page for more details.
//
//inherits
//A boolean value that controls whether the custom property registration specified by @property inherits by default.
//
//initial-value
//A value that sets the starting value for the property.
//
//Description
//The following conditions must be met for the @property rule to be valid:
//
//The @property rule must include both the syntax and inherits descriptors. If either is missing, the entire @property rule is invalid and ignored.
//The initial-value descriptor is optional if the value of the syntax descriptor is the universal syntax definition (that is, syntax: "*"). If the initial-value descriptor is required but omitted, the entire @property rule is invalid and ignored.
//Unknown descriptors are invalid and ignored, but do not invalidate the @property rule.
//Formal syntax
//@property =
//  @property <custom-property-name> { <declaration-list> }
//
//Sources: CSS Properties and Values API Level 1
//Examples
//Using @property to register and use a custom property
//In this example, we define two custom properties, --item-size and --item-color, that we'll use to define the size (width and height) and background color of the three following items.
//
//HTML
//Copy to Clipboard
//Play
//<div class="container">
//  <div class="item one">Item one</div>
//  <div class="item two">Item two</div>
//  <div class="item three">Item three</div>
//</div>
//The following code uses the CSS @property at-rule to define a custom property named --item-size. The property sets the initial value to 40%, limiting valid values to <percentage> values only. This means, when used as the value for an item's size, its size will always be relative to its parent's size. The property is inheritable.
//
//CSS
//Copy to Clipboard
//Play
//@property --item-size {
//  syntax: "<percentage>";
//  inherits: true;
//  initial-value: 40%;
//}
//We define a second custom property, --item-color, using JavaScript instead of CSS. The JavaScript registerProperty() method is equivalent to @property at-rule. The property is defined to have an initial value of aqua, to accept only <color> values, and is not inherited.
//
//JS
//Copy to Clipboard
//Play
//window.CSS.registerProperty({
//  name: "--item-color",
//  syntax: "<color>",
//  inherits: false,
//  initialValue: "aqua",
//});
//We use the two custom properties to style the items:
//
//CSS
//Copy to Clipboard
//Play
//.container {
//  display: flex;
//  height: 200px;
//  border: 1px dashed black;
//
//  /* set custom property values on parent */
//  --item-size: 20%;
//  --item-color: orange;
//}
//
///* use custom properties to set item size and background color */
//.item {
//  width: var(--item-size);
//  height: var(--item-size);
//  background-color: var(--item-color);
//}
//
///* set custom property values on element itself */
//.two {
//  --item-size: initial;
//  --item-color: inherit;
//}
//
//.three {
//  /* invalid values */
//  --item-size: 1000px;
//  --item-color: xyz;
//}
//Play
//
//The two custom properties, --item-size: 20% and --item-color: orange; are set on the container parent, overriding the 40% and aqua default values set when these custom properties were defined. The size is set to be inheritable; the color is not.
//
//For item one, none of these custom properties have been set. The --item-size is inheritable, so the value 20% set on its parent container is used. On the other hand, the property --item-color is not inheritable, so the value orange set on the parent is not considered. Instead the default initial value aqua is used.
//
//For item two, CSS global keywords are set for both custom properties which are valid values for all value types and therefore valid no matter the syntax descriptor value. The --item-size is set to initial and uses the initial-value: 40%; set in the @property declaration. The initial value means the initialValue value for the property is used. The --item-color is set to inherit, explicitly inheriting the orange value from its parent even though the custom property is set to otherwise not be inherited. This is why item two is orange.
//
//For item three, the --item-size value gets set to 1000px. While 1000px is a <length> value, the @property declaration requires the value be a <percentage>, so the declaration is not valid and is ignored, meaning the inheritable 20% set on the parent is used. The xyz value is also invalid. As registerProperty() set --item-color to not be inherited, the default initial value of aqua is used and not the parent's orange value.
//
//Specifications
