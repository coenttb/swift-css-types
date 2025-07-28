import CSSTypeTypes
import Foundation

/// Represents the CSS `border-inline-color` property, which sets the color of the logical inline borders.
///
/// This logical property sets the color for the inline borders of an element. The actual physical 
/// borders it affects depend on the element's writing mode, directionality, and text orientation.
/// For example, in horizontal top-to-bottom writing mode, `border-inline-color` sets the color
/// of the left and right borders.
///
/// Visual Reference:
/// ```
/// horizontal-tb writing mode:
/// ┌─────┬─────────────────┬─────┐
/// │     │                 │     │
/// │     │                 │     │
/// │     │                 │     │
/// │     │                 │     │
/// │     │                 │     │
/// └─────┴─────────────────┴─────┘
///   ↑                       ↑
///   border-inline-start-    border-inline-end-
///   color (left)            color (right)
///
/// vertical-rl writing mode:
/// ┌─────────────────────────────┐
/// │                             │   ← border-inline-start-color (top)
/// ├─────────────────────────────┤
/// │                             │
/// │                             │
/// │                             │
/// ├─────────────────────────────┤
/// │                             │   ← border-inline-end-color (bottom)
/// └─────────────────────────────┘
/// ```
///
/// Example:
/// ```swift
/// // Set the inline border color to red
/// .borderInlineColor(.red)
///
/// // Set the inline border color to a semi-transparent blue
/// .borderInlineColor(.rgba(0, 0, 255, 0.5))
///
/// // Set the inline border color to a hex value
/// .borderInlineColor(.hex("#32a1ce"))
///
/// // Use the current text color
/// .borderInlineColor(.currentColor)
/// ```
///
/// - Note: This logical property adapts to the writing mode of the document, 
///         making layout more flexible for different writing systems.
///
/// - SeeAlso: [MDN Web Docs on border-inline-color](https://developer.mozilla.org/en-US/docs/Web/CSS/border-inline-color)
public enum BorderInlineColor: Property, ColorConvertible {

    public static let property: String = "border-inline-color"

    /// A specific color for both inline borders
    case color(CSSTypeTypes.Color)

    /// Global CSS values
    case global(CSSTypeTypes.Global)

    /// Creates a border-inline-color with a specific color
    ///
    /// - Parameter color: The color for both inline borders
    public init(_ color: CSSTypeTypes.Color) {
        self = .color(color)
    }
}

/// Provides string conversion for CSS output
extension BorderInlineColor: CustomStringConvertible {
    /// Converts the border-inline-color to its CSS string representation
    ///
    /// This method generates CSS like:
    /// ```css
    /// border-inline-color: red;
    /// border-inline-color: #32a1ce;
    /// border-inline-color: rgba(0, 0, 255, 0.5);
    /// border-inline-color: currentcolor;
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

/// Convenience methods for creating BorderInlineColor values
extension BorderInlineColor {
    /// The default border-inline-color value (currentcolor)
    public static let `default` = BorderInlineColor(.currentColor)

    /// Creates a transparent border-inline-color
    public static let transparent = BorderInlineColor(.transparent)

    /// Creates a border-inline-color that uses the current text color
    public static let currentColor = BorderInlineColor(.currentColor)

    /// Creates a black border-inline-color
    public static let black = BorderInlineColor(.black)

    /// Creates a white border-inline-color
    public static let white = BorderInlineColor(.white)

    /// Creates a red border-inline-color
    public static let red = BorderInlineColor(.red)

    /// Creates a green border-inline-color
    public static let green = BorderInlineColor(.green)

    /// Creates a blue border-inline-color
    public static let blue = BorderInlineColor(.blue)
}
