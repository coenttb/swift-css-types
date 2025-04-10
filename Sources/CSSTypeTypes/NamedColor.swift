import Foundation

/// Represents CSS named color values.
///
/// The `NamedColor` type represents color names that can be used in CSS properties
/// that accept color values. These include the basic colors like `red` and `blue`,
/// as well as extended colors like `cornflowerblue` and `rebeccapurple`.
///
/// Example:
/// ```swift
/// .color(.named(.red))                 // red
/// .color(.named(.rebeccapurple))       // rebeccapurple
/// .backgroundColor(.named(.transparent)) // transparent
/// ```
///
/// - Note: All named colors represent solid colors in the sRGB color space without transparency,
///         except for the special `transparent` value.
///
/// - SeeAlso: [MDN Web Docs on named colors](https://developer.mozilla.org/en-US/docs/Web/CSS/named-color)
public enum NamedColor: String, Sendable, Equatable, CaseIterable {
    // Basic colors (CSS Level 1)
    case black, silver, gray, white, maroon, red, purple, fuchsia
    case green, lime, olive, yellow, navy, blue, teal, aqua
    
    // CSS Level 2
    case orange
    
    // CSS Colors Level 4 (added in honor of Eric Meyer)
    case rebeccapurple
    
    // Extended colors (X11/SVG colors)
    case aliceblue, antiquewhite, aquamarine, azure, beige, bisque, blanchedalmond
    case blueviolet, brown, burlywood, cadetblue, chartreuse, chocolate, coral
    case cornflowerblue, cornsilk, crimson, cyan, darkblue, darkcyan, darkgoldenrod
    case darkgray, darkgreen, darkgrey, darkkhaki, darkmagenta, darkolivegreen
    case darkorange, darkorchid, darkred, darksalmon, darkseagreen, darkslateblue
    case darkslategray, darkslategrey, darkturquoise, darkviolet, deeppink, deepskyblue
    case dimgray, dimgrey, dodgerblue, firebrick, floralwhite, forestgreen, gainsboro
    case ghostwhite, gold, goldenrod, greenyellow, grey, honeydew, hotpink, indianred
    case indigo, ivory, khaki, lavender, lavenderblush, lawngreen, lemonchiffon
    case lightblue, lightcoral, lightcyan, lightgoldenrodyellow, lightgray, lightgreen
    case lightgrey, lightpink, lightsalmon, lightseagreen, lightskyblue, lightslategray
    case lightslategrey, lightsteelblue, lightyellow, limegreen, linen, magenta
    case mediumaquamarine, mediumblue, mediumorchid, mediumpurple, mediumseagreen
    case mediumslateblue, mediumspringgreen, mediumturquoise, mediumvioletred
    case midnightblue, mintcream, mistyrose, moccasin, navajowhite, oldlace, olivedrab
    case orangered, orchid, palegoldenrod, palegreen, paleturquoise, palevioletred
    case papayawhip, peachpuff, peru, pink, plum, powderblue, rosybrown, royalblue
    case saddlebrown, salmon, sandybrown, seagreen, seashell, sienna, skyblue
    case slateblue, slategray, slategrey, snow, springgreen, steelblue, tan, thistle
    case tomato, turquoise, violet, wheat, whitesmoke, yellowgreen
    
    // Special keyword
    case transparent
    case currentColor = "currentColor"
}

/// Provides string conversion for CSS output
extension NamedColor: CustomStringConvertible {
    /// Converts the named color to its CSS string representation
    public var description: String {
        return rawValue
    }
}

/// Convenience properties for named colors
extension NamedColor {
    /// Other aliases
    public static let current = NamedColor.currentColor
}
