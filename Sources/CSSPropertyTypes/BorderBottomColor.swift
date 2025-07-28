import CSSTypeTypes
import Foundation

/// Represents the CSS `border-bottom-color` property, which sets the color of the bottom border.
///
/// This property sets the color for the bottom border of an element.
///
/// Visual Reference:
/// ```
/// ┌───────────────────────────┐
/// │                           │
/// │                           │
/// │                           │
/// │                           │
/// └───────────────────────────┘   ← border-bottom-color
/// ```
///
/// Example:
/// ```swift
/// // Set the bottom border color to red
/// .borderBottomColor(.red)
///
/// // Set the bottom border color to a semi-transparent blue
/// .borderBottomColor(.rgba(0, 0, 255, 0.5))
///
/// // Set the bottom border color to a hex value
/// .borderBottomColor(.hex("#32a1ce"))
///
/// // Use the current text color
/// .borderBottomColor(.currentColor)
/// ```
///
/// - Note: For the border to be visible, you must also set `border-bottom-style` to a value other than `none`.
///
/// - SeeAlso: [MDN Web Docs on border-bottom-color](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom-color)
public enum BorderBottomColor: Property, ColorConvertible {

    public static let property: String = "border-bottom-color"

    /// A specific color for the bottom border
    case color(CSSTypeTypes.Color)

    /// Global CSS values
    case global(CSSTypeTypes.Global)

    /// Creates a border-bottom-color with a specific color
    ///
    /// - Parameter color: The color for the bottom border
    public init(_ color: CSSTypeTypes.Color) {
        self = .color(color)
    }
}

/// Provides string conversion for CSS output
extension BorderBottomColor: CustomStringConvertible {
    /// Converts the border-bottom-color to its CSS string representation
    ///
    /// This method generates CSS like:
    /// ```css
    /// border-bottom-color: red;
    /// border-bottom-color: #32a1ce;
    /// border-bottom-color: rgba(0, 0, 255, 0.5);
    /// border-bottom-color: currentcolor;
    /// ```
    public var description: String {
        switch self {
        case .color(let color):
            return color.description
        case .global(let global):
            return global.description
        }
    }
}

/// Convenience methods for creating BorderBottomColor values
extension BorderBottomColor {
    /// The default border-bottom-color value (currentcolor)
    public static let `default` = BorderBottomColor(.currentColor)

    /// Creates a transparent border-bottom-color
    public static let transparent = BorderBottomColor(.transparent)

    /// Creates a border-bottom-color that uses the current text color
    public static let currentColor = BorderBottomColor(.currentColor)

    /// Creates a black border-bottom-color
    public static let black = BorderBottomColor(.black)

    /// Creates a white border-bottom-color
    public static let white = BorderBottomColor(.white)

    /// Creates a red border-bottom-color
    public static let red = BorderBottomColor(.red)

    /// Creates a green border-bottom-color
    public static let green = BorderBottomColor(.green)

    /// Creates a blue border-bottom-color
    public static let blue = BorderBottomColor(.blue)
}
