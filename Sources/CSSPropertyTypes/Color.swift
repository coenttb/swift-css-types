import Foundation
import CSSTypeTypes

/// The CSS `color` property sets the foreground color value of an element's text and text decorations,
/// and sets the `currentcolor` value. `currentcolor` may be used as an indirect value on other
/// properties and is the default for other color properties, such as border-color.
///
/// Example:
/// ```swift
/// .color(.named(.rebeccapurple))       // color: rebeccapurple
/// .color(.hex("#00a400"))             // color: #00a400
/// .color(.rgb(214, 122, 127))         // color: rgb(214, 122, 127)
/// .color(.hsl(30, 82, 43))            // color: hsl(30deg 82% 43%)
/// .color(.hsla(237, 74, 33, 0.61))    // color: hsla(237deg 74% 33% / 61%)
/// ```
///
/// - SeeAlso: [MDN Web Docs on color](https://developer.mozilla.org/en-US/docs/Web/CSS/color)
public enum Color: Property, ColorConvertible {
    public static let property: String = "color"
    
    /// A specific color value
    case color(CSSTypeTypes.Color)
    
    /// Global values
    case global(CSSTypeTypes.Global)
}

/// CSS Output conversion
extension CSSPropertyTypes.Color: CustomStringConvertible {
    public var description: String {
        switch self {
        case .color(let color):
            return color.description
            
        case .global(let global):
            return global.description
        }
    }
}

/// Factory methods for creating color values
extension CSSPropertyTypes.Color {
    /// Creates a color that matches the current color value
    public static let currentColor: CSSPropertyTypes.Color = .color(.currentColor)
}
