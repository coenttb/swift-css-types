//@counter-style
//
//
//Baseline 2023 *
//NEWLY AVAILABLE
//
//
//
//The @counter-style CSS at-rule lets you extend predefined list styles and define your own counter styles that are not part of the predefined set of styles. The @counter-style rule contains descriptors defining how the counter value is converted into a string representation.
//
//CSS
//Copy to Clipboard
//@counter-style thumbs {
//  system: cyclic;
//  symbols: "\1F44D";
//  suffix: " ";
//}
//
//ul {
//  list-style: thumbs;
//}
//While CSS provides many useful predefined counter styles, the @counter-style at-rule offers an open-ended method for creating counters. This at-rule caters to the needs of worldwide typography by allowing authors to define their own counter styles when the predefined styles don't fit their requirements.
//
//Syntax
//The @counter-style at-rule is identified by a counter style name, and the style of the named counter can be fine-tuned using a <declaration-list> consisting of one or more descriptors and their values.
//
//Counter style name
//<counter-style-name>
//Provides a name for your counter style. It is specified as a case-sensitive <custom-ident> without quotes. The value should not be equal to none. Like all custom identifiers, the value of your counter style can't be a CSS-wide keyword. Avoid other enumerated CSS property values, including values of list and counter style properties. The name of your counter can't be the case-insensitive list-style-type property values of decimal, disc, square, circle, disclosure-open, and disclosure-closed.
//
//Note: The non-overridable counter style names decimal, disc, square, circle, disclosure-open, and disclosure-closed cannot be used as the name of a custom counter. However, they are valid in other contexts where the <counter-style-name> data type is expected, such as in system: extends <counter-style-name>.
//Descriptors
//system
//Specifies the algorithm to be used for converting the integer value of a counter to a string representation. If the value is cyclic, numeric, alphabetic, symbolic, or fixed, the symbols descriptor must also be specified. If the value is additive, the additive-symbols descriptor must also be specified.
//
//symbols
//Specifies the symbols that are to be used for the marker representations. Symbols can contain strings, images, or custom identifiers. This descriptor is required if the system descriptor is set to cyclic, numeric, alphabetic, symbolic, or fixed.
//
//additive-symbols
//Defines the additive tuples for additive systems. While the symbols specified in the symbols descriptor are used for constructing marker representation by most algorithms, additive counter systems, such as Roman numerals, consist of a series of weighted symbols. The descriptors is a list of counter symbol along with their non-negative integer weights, listed by weight in descending order. This descriptor is required if the system descriptor is set to additive.
//
//negative
//Specifies to symbols to be appended or prepended to the counter representation if the value is negative.
//
//prefix
//Specifies a symbol that should be prepended to the marker representation. Prefixes are added to the representation in the final stage, before any characters added to negative counter values by the negative descriptor.
//
//suffix
//Specifies, similar to the prefix descriptor, a symbol that is appended to the marker representation. Suffixes come after the marker representation, including after any characters added to negative counter values by the negative descriptor.
//
//range
//Defines the range of values over which the counter style is applicable. If a counter style is used to represent a counter value outside of the ranges defined by this descriptor, the counter style will drop back to its fallback style.
//
//pad
//Is used when you need the marker representations to be of a minimum length. For example if you want the counters to start at 01 and go through 02, 03, 04, etc., then the pad descriptor is to be used. For representations larger than the specified pad value, the marker is constructed as normal.
//
//speak-as
//Describes how speech synthesizers, such as screen readers, should announce the counter style. For example, the value of the list item marker can be read out as numbers or alphabets for ordered lists or as audio cues for unordered lists, based on the value of this descriptor.
//
//fallback
//Specifies the counter name of the system to fall back to if either the specified system is unable to construct the representation of a counter value or if the counter value is outside the specified range. If the fallback counter also fails to represent the value, then that counter's fallback is used, if one is specified. If there are either no fallback counters described or if the chain of fallback systems are unable to represent a counter value, then it will ultimately fall back to the decimal style.
//
//Formal syntax
//@counter-style =
//  @counter-style <counter-style-name> { <declaration-list> }
//
//Sources: CSS Counter Styles Level 3
//Examples
//Specifying symbols with counter-style
//CSS
//Copy to Clipboard
//Play
//@counter-style circled-alpha {
//  system: fixed;
//  symbols: Ⓐ Ⓑ Ⓒ Ⓓ Ⓔ Ⓕ Ⓖ Ⓗ Ⓘ Ⓙ Ⓚ Ⓛ Ⓜ Ⓝ Ⓞ Ⓟ Ⓠ Ⓡ Ⓢ Ⓣ Ⓤ Ⓥ Ⓦ Ⓧ Ⓨ Ⓩ;
//  suffix: " ";
//}
//The above counter style rule can be applied to lists like this:
//
//CSS
//Copy to Clipboard
//Play
//.items {
//  list-style: circled-alpha;
//}
//The above code produces the following result:
//
//Play
//
//See more examples on the demo page (code).
//
//Ready-made counter styles
//Find a collection of over 100 counter-style code snippets in the Ready-made Counter Styles document. This document provides counters that meet the needs of languages and cultures around the world.
//
//The Counter styles converter pulls from this list to test and create copy and paste code for counter styles.
