import CSSTypeTypes
import Foundation

/// Represents the CSS `border-color` shorthand property, which sets the color of an element's borders.
///
/// This property is a shorthand that sets the color for all four sides of an element's border.
/// You can specify from one to four colors to apply to different sides.
///
/// Visual Reference:
/// ```
/// One color for all sides:         Different colors for each side:
/// ┌───────────────────────┐        ┌───────────────────────┐
/// │                       │        │     red border        │
/// │                       │        │                       │
/// │                       │        │ g                   b │
/// │                       │        │ r                   l │
/// │                       │        │ e                   u │
/// │                       │        │ e                   e │
/// │                       │        │ n                     │
/// │     red border        │        │                       │
/// └───────────────────────┘        └───────────────────────┘
///  border-color: red               border-color: red blue green gold
/// ```
///
/// Example:
/// ```swift
/// // Same color for all four borders
/// .borderColor(.red)
///
/// // Different colors for top/bottom and left/right
/// .borderColor(.red, .blue)
///
/// // Different colors for top, sides, and bottom
/// .borderColor(.red, .blue, .green)
///
/// // Different color for each side
/// .borderColor(.red, .blue, .green, .gold)
/// ```
///
/// - Note: This is a shorthand for setting the individual border color properties:
///         `border-top-color`, `border-right-color`, `border-bottom-color`, and `border-left-color`.
///
/// - SeeAlso: [MDN Web Docs on border-color](https://developer.mozilla.org/en-US/docs/Web/CSS/border-color)
public enum BorderColor: Property {

    public static let property: String = "border-color"

    /// Same color for all four sides
    case all(Color)

    /// Different colors for vertical (top/bottom) and horizontal (left/right) sides
    case vertical_horizontal(Color, Color)

    /// Different colors for top, horizontal (left/right), and bottom sides
    case top_horizontal_bottom(Color, Color, Color)

    /// Different colors for each side in clockwise order: top, right, bottom, left
    case top_right_bottom_left(Color, Color, Color, Color)

    /// Global CSS values
    case global(CSSTypeTypes.Global)

    /// Creates a border color with the same value for all sides
    ///
    /// - Parameter color: The color for all sides
    public init(_ color: CSSPropertyTypes.Color) {
        self = .all(color)
    }

    /// Creates a border color with two values (vertical and horizontal)
    ///
    /// - Parameters:
    ///   - vertical: The color for top and bottom borders
    ///   - horizontal: The color for left and right borders
    public init(_ vertical: Color, _ horizontal: Color) {
        self = .vertical_horizontal(vertical, horizontal)
    }

    /// Creates a border color with three values (top, horizontal, bottom)
    ///
    /// - Parameters:
    ///   - top: The color for the top border
    ///   - horizontal: The color for left and right borders
    ///   - bottom: The color for the bottom border
    public init(_ top: Color, _ horizontal: Color, _ bottom: Color) {
        self = .top_horizontal_bottom(top, horizontal, bottom)
    }

    /// Creates a border color with four values (one for each side)
    ///
    /// - Parameters:
    ///   - top: The color for the top border
    ///   - right: The color for the right border
    ///   - bottom: The color for the bottom border
    ///   - left: The color for the left border
    public init(_ top: Color, _ right: Color, _ bottom: Color, _ left: Color) {
        self = .top_right_bottom_left(top, right, bottom, left)
    }
}

/// Provides string conversion for CSS output
extension BorderColor: CustomStringConvertible {
    /// Converts the border-color to its CSS string representation
    ///
    /// This method generates CSS like:
    /// ```css
    /// border-color: red;
    /// border-color: red blue;
    /// border-color: red blue green;
    /// border-color: red blue green gold;
    /// ```
    public var description: String {
        switch self {
        case .all(let color):
            return color.description
        case .vertical_horizontal(let vertical, let horizontal):
            return "\(vertical.description) \(horizontal.description)"
        case .top_horizontal_bottom(let top, let horizontal, let bottom):
            return "\(top.description) \(horizontal.description) \(bottom.description)"
        case .top_right_bottom_left(let top, let right, let bottom, let left):
            return "\(top.description) \(right.description) \(bottom.description) \(left.description)"
        case .global(let global):
            return global.description
        }
    }
}

/// Convenience methods for creating border color values
extension BorderColor {
    /// Creates a transparent border color
    public static let transparent = BorderColor(.transparent)

    /// Creates a border color that uses the current text color
    public static let currentColor = BorderColor(.currentColor)

    /// Creates a black border color
    public static let black = BorderColor(.black)

    /// Creates a white border color
    public static let white = BorderColor(.white)

    /// Creates a red border color
    public static let red = BorderColor(.red)

    /// Creates a green border color
    public static let green = BorderColor(.green)

    /// Creates a blue border color
    public static let blue = BorderColor(.blue)
}
