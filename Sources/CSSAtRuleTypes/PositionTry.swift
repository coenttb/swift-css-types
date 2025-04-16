//@position-try
//
//
//Limited availability
//
//
//
//Experimental: This is an experimental technology
//Check the Browser compatibility table carefully before using this in production.
//The @position-try CSS at-rule is used to define a custom position try fallback option, which can be used to define positioning and alignment for anchor-positioned elements. One or more sets of position try fallback options can be applied to the anchored element via the position-try-fallbacks property or position-try shorthand. When the positioned element is moved to a position where it starts to overflow its containing block or the viewport, the browser will select the first position try fallback option it finds that places the positioned element fully back on-screen.
//
//Each position option is named with a <dashed-ident> and contains a descriptor list specifying declarations that define information such as inset position, margin, sizing, and self-alignment. The <dashed-ident> is used to reference the custom position option in the position-try-fallbacks property and position-try shorthand.
//
//For detailed information on anchor features and position try fallback usage, see the CSS anchor positioning module landing page and the Handling overflow: try fallbacks and conditional hiding guide.
//
//Syntax
//CSS
//Copy to Clipboard
//@position-try --try-option-name {
//  descriptor-list
//}
//Note: The --try-option-name is a <dashed-ident> specifying an identifying name for the custom position option, which can then be used to add that fallback option to the position-try-fallbacks list.
//Descriptors
//The descriptors specify property values that define the behavior of the custom position option, i.e., where it will result in the positioned element being placed.
//
//position-anchor
//Specifies a position-anchor property value that defines the anchor element that the positioned element is tethered to, by specifying a <dashed-ident> value equal to the anchor element's anchor-name property value.
//
//position-area
//Specifies a position-area property value that defines the position of the anchor-positioned element relative to the anchor.
//
//Inset property descriptors
//Specify anchor() function values that define the position of the anchor-positioned element's edges relative to the anchor element's edge. Inset property descriptors can be set that represent the following properties:
//
//top
//left
//bottom
//right.
//inset-block-start
//inset-block-end
//inset-inline-start
//inset-inline-end
//inset-block
//inset-inline
//inset
//Margin property descriptors
//Specify the margin set on the anchor-positioned element. Margin property descriptors can be set that represent the following properties:
//
//margin-top
//margin-left
//margin-bottom
//margin-right
//margin-block-start
//margin-block-end
//margin-inline-start
//margin-inline-end
//margin
//margin-block
//margin-inline
//Sizing property descriptors
//Specify anchor-size() function values that define the size of the anchor-positioned element relative to the anchor element size. Sizing property descriptors can be set that represent the following properties:
//
//width
//height
//min-width
//min-height
//max-width
//max-height
//block-size
//inline-size
//min-block-size
//min-inline-size
//max-block-size
//max-inline-size
//Self-alignment property descriptors
//Specify the anchor-center value to align the anchor-positioned element relative to the anchor element's center, in the block or inline direction. align-self and justify-self property descriptors can take the anchor-center value.
//
//Note: When a custom position option is applied to an element, the property values defined in the @position-try at-rule descriptor takes precedence over the values set on the element via standard CSS properties.
//Formal syntax
//@position-try =
//  @position-try <dashed-ident> { <declaration-list> }
//
//Sources: CSS Anchor Positioning
//Examples
//Custom position option usage
//In this example, we define an anchor element and an anchor-positioned element, then create four named custom position try fallback options. These options are applied to the positioned element to ensure its contents are always visible no matter where the anchor element is within the viewport.
//
//HTML
//
//We include two <div> elements that will become an anchor and an anchor-positioned element:
//
//HTML
//Copy to Clipboard
//Play
//<div class="anchor">⚓︎</div>
//
//<div class="infobox">
//  <p>This is an information box.</p>
//</div>
//CSS
//
//We first style the <body> element to be very large, so that we can scroll the anchor and the positioned element around in the viewport, both horizontally and vertically:
//
//CSS
//Copy to Clipboard
//Play
//body {
//  width: 1500px;
//  height: 500px;
//}
//The anchor is given an anchor-name and has a position value of absolute set on it. We then position it somewhere near the center of the initial <body> rendering using top and left values:
//
//CSS
//Copy to Clipboard
//Play
//.anchor {
//  anchor-name: --myAnchor;
//  position: absolute;
//  top: 100px;
//  left: 350px;
//}
//Next, we use the @position-try at-rule to define four custom position options, with descriptive <dashed-ident> names to identify them and describe their purpose. Each one places the positioned element in a specific position around the anchor element and gives it an appropriate 10px margin between the positioned element and its anchor. The positioning is handled in a variety of ways, to demonstrate the different techniques available:
//
//The first and last position options use a position-area.
//The second position option uses top with an anchor() value and justify-self: anchor-center to center the positioned element on the anchor in the inline direction.
//The third position option uses left with an anchor() value, wrapped inside a calc() function that adds 10px of spacing (rather than creating the spacing with margin like the other options do). It then uses align-self: anchor-center to center the positioned element on the anchor in the block direction.
//Finally, the left and right position options are given a narrower width
//
//CSS
//Copy to Clipboard
//Play
//@position-try --custom-left {
//  position-area: left;
//  width: 100px;
//  margin: 0 10px 0 0;
//}
//
//@position-try --custom-bottom {
//  top: anchor(bottom);
//  justify-self: anchor-center;
//  margin: 10px 0 0 0;
//  position-area: none;
//}
//
//@position-try --custom-right {
//  left: calc(anchor(right) + 10px);
//  align-self: anchor-center;
//  width: 100px;
//  position-area: none;
//}
//
//@position-try --custom-bottom-right {
//  position-area: bottom right;
//  margin: 10px 0 0 10px;
//}
//The infobox is given fixed positioning, a position-anchor property that references the anchor's anchor-name to associate the two together, and it is tethered to the anchor's top edge using an position-area. We also give it a fixed width and some bottom margin. The custom position options are then referenced in the position-try-fallbacks property to prevent the positioned element from overflowing, or being scrolled out of view, when the anchor gets near the edge of the viewport.
//
//CSS
//Copy to Clipboard
//Play
//.infobox {
//  position: fixed;
//  position-anchor: --myAnchor;
//  position-area: top;
//  width: 200px;
//  margin: 0 0 10px 0;
//  position-try-fallbacks:
//    --custom-left, --custom-bottom,
//    --custom-right, --custom-bottom-right;
//}
//Result
//
//Scroll the page and notice the change in the positioned element's placement as the anchor nears the different edges of the viewport. This is due to different fallback position options being applied.
//
//Play
//
//Let's talk through how these position options work:
//
//First of all, note that our default position is defined by position-area: top. When the infobox isn't overflowing the page in any direction, the infobox sits above the anchor, and the position try fallback options set in the position-try-fallbacks property are ignored. Also note that the infobox has a fixed width and bottom margin set. These values will change as different position try fallback options are applied.
//If the infobox starts to overflow, the browser first tries the --custom-left position. This moves the infobox to the left of the anchor using position-area: left, adjusts the margin to suit, and also gives the infobox a different width.
//Next, the browser tries the --custom-bottom position. This moves the infobox to the bottom of the anchor using top and justify-self instead of a position-area, and sets an appropriate margin. It doesn't include a width descriptor, so the infobox returns to its default width of 200px set by the width property.
//The browser next tries the --custom-right position. This works much the same as the --custom-left position, with the same width descriptor value applied. However, we are using left and align-self to place the positioned element instead of a position-area. And we are wrapping the left value in a calc() function inside which we are adding 10px to create spacing, instead of using margin.
//If none of the other try fallback options succeed in stopping the positioned element from overflowing, the browser tries the --custom-bottom-right position as a last resort. This places the positioned element to the bottom-right of the anchor using position-area: bottom right.
//When a position option is applied, its values override the initial values set on the positioned element. For example, the width initially set on the positioned element is 200px, but when the --custom-right position option is applied, its width is set to 100px.
//
//In some cases, we need to set values inside the custom position options to turn off the initial values. The --custom-bottom and --custom-right options use inset property and *-self: anchor-center values to place the positioned element, therefore we remove the previously-set position-area value in each case by setting position-area: none. If we didn't do this, the initially set position-area: top value would still take effect and interfere with the other positioning information.
//
//Specifications
