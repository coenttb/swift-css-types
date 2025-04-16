//@media
//
//
//Baseline Widely available *
//
//
//
//The @media CSS at-rule can be used to apply part of a style sheet based on the result of one or more media queries. With it, you specify a media query and a block of CSS to apply to the document if and only if the media query matches the device on which the content is being used.
//
//Note: In JavaScript, the rules created using @media can be accessed with the CSSMediaRule CSS object model interface.
//Try it
//CSS Demo: @media
//RESET
//CSS
//HTML
//1
//2
//3
//4
//5
//6
//7
//8
//9
//10
//11
//12
//13
//14
//15
//16
//17
//abbr {
//  color: chocolate;
//}
//
//@media (hover: hover) {
//  abbr:hover {
//    color: limegreen;
//    transition-duration: 1s;
//  }
//}
//
//@media not all and (hover: hover) {
//  abbr::after {
//    content: " (" attr(title) ")";
//  }
//}
//
//OUTPUT
//Syntax
//The @media at-rule may be placed at the top level of your code or nested inside any other conditional group at-rule.
//
//CSS
//Copy to Clipboard
///* At the top level of your code */
//@media screen and (min-width: 900px) {
//  article {
//    padding: 1rem 3rem;
//  }
//}
//
///* Nested within another conditional at-rule */
//@supports (display: flex) {
//  @media screen and (min-width: 900px) {
//    article {
//      display: flex;
//    }
//  }
//}
//For a discussion of media query syntax, please see Using media queries.
//
//Description
//A media query's <media-query-list> includes <media-type>s, <media-feature>s, and logical operators.
//
//Media types
//A <media-type> describes the general category of a device. Except when using the only logical operator, the media type is optional and the all type is implied.
//
//all
//Suitable for all devices.
//
//print
//Intended for paged material and documents viewed on a screen in print preview mode. (Please see paged media for information about formatting issues that are specific to these formats.)
//
//screen
//Intended primarily for screens.
//
//Note: CSS2.1 and Media Queries 3 defined several additional media types (tty, tv, projection, handheld, braille, embossed, and aural), but they were deprecated in Media Queries 4 and shouldn't be used.
//Media features
//A <media feature> describes specific characteristics of the user agent, output device, or environment. Media feature expressions test for their presence, value, or range of values, and are entirely optional. Each media feature expression must be surrounded by parentheses.
//
//any-hover
//Does any available input mechanism allow the user to hover over elements?
//
//any-pointer
//Is any available input mechanism a pointing device, and if so, how accurate is it?
//
//aspect-ratio
//Width-to-height aspect ratio of the viewport.
//
//color
//Number of bits per color component of the output device, or zero if the device isn't color.
//
//color-gamut
//Approximate range of colors that are supported by the user agent and output device.
//
//color-index
//Number of entries in the output device's color lookup table, or zero if the device does not use such a table.
//
//device-aspect-ratio
//Width-to-height aspect ratio of the output device. Deprecated in Media Queries Level 4.
//
//device-height
//Height of the rendering surface of the output device. Deprecated in Media Queries Level 4.
//
//device-posture
//Detects the device's current posture, that is, whether the viewport is in a flat or folded state. Defined in the Device Posture API.
//
//device-width
//Width of the rendering surface of the output device. Deprecated in Media Queries Level 4.
//
//display-mode
//The mode in which an application is being displayed: for example, fullscreen or picture-in-picture mode. Added in Media Queries Level 5.
//
//dynamic-range
//Combination of brightness, contrast ratio, and color depth that are supported by the user agent and the output device. Added in Media Queries Level 5.
//
//forced-colors
//Detect whether user agent restricts color palette. Added in Media Queries Level 5.
//
//grid
//Does the device use a grid or bitmap screen?
//
//height
//Height of the viewport.
//
//hover
//Does the primary input mechanism allow the user to hover over elements?
//
//inverted-colors
//Is the user agent or underlying OS inverting colors? Added in Media Queries Level 5.
//
//monochrome
//Bits per pixel in the output device's monochrome frame buffer, or zero if the device isn't monochrome.
//
//orientation
//Orientation of the viewport.
//
//overflow-block
//How does the output device handle content that overflows the viewport along the block axis?
//
//overflow-inline
//Can content that overflows the viewport along the inline axis be scrolled?
//
//pointer
//Is the primary input mechanism a pointing device, and if so, how accurate is it?
//
//prefers-color-scheme
//Detect if the user prefers a light or dark color scheme. Added in Media Queries Level 5.
//
//prefers-contrast
//Detects if the user has requested the system increase or decrease the amount of contrast between adjacent colors. Added in Media Queries Level 5.
//
//prefers-reduced-data
//Detects if the user has requested the web content that consumes less internet traffic.
//
//prefers-reduced-motion
//The user prefers less motion on the page. Added in Media Queries Level 5.
//
//prefers-reduced-transparency
//Detects if a user has enabled a setting on their device to reduce the transparent or translucent layer effects used on the device.
//
//resolution
//Pixel density of the output device.
//
//scan
//Whether display output is progressive or interlaced.
//
//scripting
//Detects whether scripting (i.e., JavaScript) is available. Added in Media Queries Level 5.
//
//shape
//Detects the shape of the device to distinguish rectangular and round displays.
//
//update
//How frequently the output device can modify the appearance of content.
//
//video-dynamic-range
//Combination of brightness, contrast ratio, and color depth that are supported by the video plane of user agent and the output device. Added in Media Queries Level 5.
//
//width
//Width of the viewport including width of scrollbar.
//
//-moz-device-pixel-ratio Deprecated Non-standard
//The number of device pixels per CSS pixel. Use the resolution feature with the dppx unit instead.
//
//-webkit-animation Deprecated Non-standard
//The browser supports -webkit prefixed CSS animation. Use the @supports (animation) feature query instead.
//
//-webkit-device-pixel-ratio
//The number of device pixels per CSS pixel. Use the resolution feature with the dppx unit instead.
//
//-webkit-transform-2d Deprecated Non-standard
//The browser supports -webkit prefixed 2D CSS transform. Use the @supports (transform) feature query instead.
//
//-webkit-transform-3d
//The browser supports -webkit prefixed 3D CSS transform. Use the @supports (transform) feature query instead.
//
//-webkit-transition Deprecated Non-standard
//The browser supports -webkit prefixed CSS transition. Use the @supports (transition) feature query instead.
//
//Logical operators
//The logical operators not, and, only, and or can be used to compose a complex media query. You can also combine multiple media queries into a single rule by separating them with commas.
//
//and
//Used for combining multiple media features together into a single media query, requiring each chained feature to return true for the query to be true. It is also used for joining media features with media types.
//
//not
//Used to negate a media query, returning true if the query would otherwise return false. If present in a comma-separated list of queries, it will only negate the specific query to which it is applied.
//
//Note: In Level 3, the not keyword can't be used to negate an individual media feature expression, only an entire media query.
//only
//Applies a style only if an entire query matches. It is useful for preventing older browsers from applying selected styles. When not using only, older browsers would interpret the query screen and (max-width: 500px) as screen, ignoring the remainder of the query, and applying its styles on all screens. If you use the only operator, you must also specify a media type.
//
//, (comma)
//Commas are used to combine multiple media queries into a single rule. Each query in a comma-separated list is treated separately from the others Thus, if any of the queries in a list is true, the entire media statement returns true. In other words, lists behave like a logical or operator.
//
//or
//Equivalent to the , operator. Added in Media Queries Level 4.
//
//User agent client hints
//Some media queries have corresponding user agent client hints. These are HTTP headers that request content that is pre-optimized for the particular media requirement. They include Sec-CH-Prefers-Color-Scheme and Sec-CH-Prefers-Reduced-Motion.
//
//Formal syntax
//@media =
//  @media <media-query-list> { <rule-list> }
//
//Sources: CSS Conditional Rules Module Level 3
//Accessibility
//To best accommodate people who adjust a site's text size, use ems when you need a <length> for your media queries.
//
//Both em and px are valid units, but em works better if the user changes the browser text size.
//
//Also consider media queries or HTTP user agent client hints to improve the user's experience. For example, the media query prefers-reduced-motion or the equivalent HTTP header Sec-CH-Prefers-Reduced-Motion) can be used to minimize the amount of animation or motion used based on user preferences.
//
//Security
//Because media queries provide insights into the capabilities—and by extension, the features and design—of the device the user is working with, there is the potential that they could be abused to construct a "fingerprint" which identifies the device, or at least categorizes it to some degree of detail that may be undesirable to users.
//
//Because of this potential, a browser may opt to fudge the returned values in some manner in order to prevent them from being used to precisely identify a computer. A browser might also offer additional measures in this area; for example, if Firefox's "Resist Fingerprinting" setting is enabled, many media queries report default values rather than values representing the actual device state.
//
//Examples
//Testing for print and screen media types
//CSS
//Copy to Clipboard
//@media print {
//  body {
//    font-size: 10pt;
//  }
//}
//
//@media screen {
//  body {
//    font-size: 13px;
//  }
//}
//
//@media screen, print {
//  body {
//    line-height: 1.2;
//  }
//}
//
//@media only screen and (min-width: 320px) and (max-width: 480px) and (resolution: 150dpi) {
//  body {
//    line-height: 1.4;
//  }
//}
//The range syntax allows for less verbose media queries when testing for any feature accepting a range, as shown in the below examples:
//
//CSS
//Copy to Clipboard
//@media (height > 600px) {
//  body {
//    line-height: 1.4;
//  }
//}
//
//@media (400px <= width <= 700px) {
//  body {
//    line-height: 1.4;
//  }
//}
//For more examples, please see Using media queries.
