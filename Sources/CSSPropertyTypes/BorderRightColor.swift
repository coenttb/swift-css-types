import CSSTypeTypes
import Foundation

/// Represents the CSS `border-right-color` property, which sets the color of the right border.
///
/// This property sets the color for the right border of an element.
///
/// Visual Reference:
/// ```
/// ┌───────────────────────┬─────┐
/// │                       │     │
/// │                       │     │
/// │                       │     │
/// │                       │     │
/// │                       │     │
/// └───────────────────────┴─────┘
///                           ↑
///                           border-right-color
/// ```
///
/// Example:
/// ```swift
/// // Set the right border color to red
/// .borderRightColor(.red)
///
/// // Set the right border color to a semi-transparent blue
/// .borderRightColor(.rgba(0, 0, 255, 0.5))
///
/// // Set the right border color to a hex value
/// .borderRightColor(.hex("#32a1ce"))
///
/// // Use the current text color
/// .borderRightColor(.currentColor)
/// ```
///
/// - Note: For the border to be visible, you must also set `border-right-style` to a value other than `none`.
///
/// - SeeAlso: [MDN Web Docs on border-right-color](https://developer.mozilla.org/en-US/docs/Web/CSS/border-right-color)
public enum BorderRightColor: Property, ColorConvertible {

    public static let property: String = "border-right-color"

    /// A specific color for the right border
    case color(CSSTypeTypes.Color)

    /// Global CSS values
    case global(CSSTypeTypes.Global)

    /// Creates a border-right-color with a specific color
    ///
    /// - Parameter color: The color for the right border
    public init(_ color: CSSTypeTypes.Color) {
        self = .color(color)
    }
}

/// Provides string conversion for CSS output
extension BorderRightColor: CustomStringConvertible {
    /// Converts the border-right-color to its CSS string representation
    ///
    /// This method generates CSS like:
    /// ```css
    /// border-right-color: red;
    /// border-right-color: #32a1ce;
    /// border-right-color: rgba(0, 0, 255, 0.5);
    /// border-right-color: currentcolor;
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
