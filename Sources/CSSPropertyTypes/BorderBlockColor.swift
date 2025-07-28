import CSSTypeTypes
import Foundation

/// Represents the CSS `border-block-color` property, which sets the color of the logical block borders.
///
/// This logical property sets the color for the block borders of an element. The actual physical 
/// borders it affects depend on the element's writing mode, directionality, and text orientation.
/// For example, in horizontal top-to-bottom writing mode, `border-block-color` sets the color
/// of the top and bottom borders.
///
/// Visual Reference:
/// ```
/// horizontal-tb writing mode:
/// ┌───────────────────────────┐
/// │                           │   ← border-block-start-color (top)
/// │                           │
/// │                           │
/// │                           │
/// └───────────────────────────┘   ← border-block-end-color (bottom)
///
/// vertical-rl writing mode:
/// ┌───────────────────────────┐
/// │                           │
/// │                           │
/// │                           │ ↑
/// │                           │ border-block-start-color (right)
/// └───────────────────────────┘
///   ↑
///   border-block-end-color (left)
/// ```
///
/// Example:
/// ```swift
/// // Set the block border color to red
/// .borderBlockColor(.red)
///
/// // Set the block border color to a semi-transparent blue
/// .borderBlockColor(.rgba(0, 0, 255, 0.5))
///
/// // Set the block border color to a hex value
/// .borderBlockColor(.hex("#32a1ce"))
///
/// // Use the current text color
/// .borderBlockColor(.currentColor)
/// ```
///
/// - Note: This logical property adapts to the writing mode of the document, 
///         making layout more flexible for different writing systems.
///
/// - SeeAlso: [MDN Web Docs on border-block-color](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-color)
public enum BorderBlockColor: Property, ColorConvertible {

    public static let property: String = "border-block-color"

    /// A specific color for both block borders
    case color(CSSTypeTypes.Color)

    /// Global CSS values
    case global(CSSTypeTypes.Global)

    /// Creates a border-block-color with a specific color
    ///
    /// - Parameter color: The color for both block borders
    public init(_ color: CSSTypeTypes.Color) {
        self = .color(color)
    }
}

/// Provides string conversion for CSS output
extension BorderBlockColor: CustomStringConvertible {
    /// Converts the border-block-color to its CSS string representation
    ///
    /// This method generates CSS like:
    /// ```css
    /// border-block-color: red;
    /// border-block-color: #32a1ce;
    /// border-block-color: rgba(0, 0, 255, 0.5);
    /// border-block-color: currentcolor;
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

/// Convenience methods for creating BorderBlockColor values
extension BorderBlockColor {
    /// The default border-block-color value (currentcolor)
    public static let `default` = BorderBlockColor(.currentColor)

    /// Creates a transparent border-block-color
    public static let transparent = BorderBlockColor(.transparent)

    /// Creates a border-block-color that uses the current text color
    public static let currentColor = BorderBlockColor(.currentColor)

    /// Creates a black border-block-color
    public static let black = BorderBlockColor(.black)

    /// Creates a white border-block-color
    public static let white = BorderBlockColor(.white)

    /// Creates a red border-block-color
    public static let red = BorderBlockColor(.red)

    /// Creates a green border-block-color
    public static let green = BorderBlockColor(.green)

    /// Creates a blue border-block-color
    public static let blue = BorderBlockColor(.blue)
}
