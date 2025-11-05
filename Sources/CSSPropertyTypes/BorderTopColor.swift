import CSSTypeTypes
import Foundation

/// Represents the CSS `border-top-color` property, which sets the color of the top border.
///
/// This property sets the color for the top border of an element.
///
/// Visual Reference:
/// ```
/// ┌───────────────────────────┐
/// │                           │   ← border-top-color
/// │                           │
/// │                           │
/// │                           │
/// └───────────────────────────┘
/// ```
///
/// Example:
/// ```swift
/// // Set the top border color to red
/// .borderTopColor(.red)
///
/// // Set the top border color to a semi-transparent blue
/// .borderTopColor(.rgba(0, 0, 255, 0.5))
///
/// // Set the top border color to a hex value
/// .borderTopColor(.hex("#32a1ce"))
///
/// // Use the current text color
/// .borderTopColor(.currentColor)
/// ```
///
/// - Note: For the border to be visible, you must also set `border-top-style` to a value other than `none`.
///
/// - SeeAlso: [MDN Web Docs on border-top-color](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-color)
public enum BorderTopColor: Property, ColorConvertible {

    public static let property: String = "border-top-color"

    /// A specific color for the top border
    case color(CSSTypeTypes.Color)

    /// Global CSS values
    case global(CSSTypeTypes.Global)

    /// Creates a border-top-color with a specific color
    ///
    /// - Parameter color: The color for the top border
    public init(_ color: CSSTypeTypes.Color) {
        self = .color(color)
    }
}

/// Provides string conversion for CSS output
extension BorderTopColor: CustomStringConvertible {
    /// Converts the border-top-color to its CSS string representation
    ///
    /// This method generates CSS like:
    /// ```css
    /// border-top-color: red;
    /// border-top-color: #32a1ce;
    /// border-top-color: rgba(0, 0, 255, 0.5);
    /// border-top-color: currentcolor;
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
