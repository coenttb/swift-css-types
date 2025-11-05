import CSSTypeTypes
import Foundation

/// Represents the CSS `border-inline-start-color` property, which defines the color of the logical
/// inline-start border of an element.
///
/// This logical property maps to a physical border color depending on the element's writing mode,
/// directionality, and text orientation. It corresponds to one of `border-top-color`, `border-right-color`,
/// `border-bottom-color`, or `border-left-color` properties.
///
/// Visual Reference:
/// ```
/// horizontal-tb + ltr:          horizontal-tb + rtl:
/// ┌─────────────────────┐       ┌─────────────────────┐
/// │                     │       │                     │
/// │                     │       │                     │
/// │                     │       │                     │
/// │                     │       │                     │
/// └─────────────────────┘       └─────────────────────┘
///  ▲                                                ▲
/// border-inline-start-color     border-inline-start-color
///        (left)                         (right)
///
/// vertical-rl:                vertical-lr:
/// ┌─────────────────────┐     ┌─────────────────────┐
/// │                     │     │                     │
/// ├─────────────────────┤     ├─────────────────────┤
/// │                     │     │                     │
/// │                     │     │                     │
/// └─────────────────────┘     └─────────────────────┘
///                     ▲        ▲
///   border-inline-start-color   border-inline-start-color
///           (top)                   (bottom)
/// ```
///
/// Example:
/// ```swift
/// // Set the inline-start border color to red
/// .borderInlineStartColor(.red)
///
/// // Set the inline-start border color to a hex value
/// .borderInlineStartColor(.hex("#32a1ce"))
///
/// // Set the inline-start border color to a semi-transparent color
/// .borderInlineStartColor(.rgba(170, 50, 220, 0.6))
///
/// // Use the current text color
/// .borderInlineStartColor(.currentColor)
/// ```
///
/// - SeeAlso: [MDN Web Docs on border-inline-start-color](https://developer.mozilla.org/en-US/docs/Web/CSS/border-inline-start-color)
public enum BorderInlineStartColor: Property, ColorConvertible {

    public static let property: String = "border-inline-start-color"

    /// A specific color for the inline-start border
    case color(CSSTypeTypes.Color)

    /// Global CSS values
    case global(CSSTypeTypes.Global)

    /// Creates a border-inline-start-color with a specific color
    ///
    /// - Parameter color: The color for the inline-start border
    public init(_ color: CSSTypeTypes.Color) {
        self = .color(color)
    }
}

/// Provides string conversion for CSS output
extension BorderInlineStartColor: CustomStringConvertible {
    /// Converts the border-inline-start-color to its CSS string representation
    ///
    /// This method generates CSS like:
    /// ```css
    /// border-inline-start-color: red;
    /// border-inline-start-color: #32a1ce;
    /// border-inline-start-color: rgba(170, 50, 220, 0.6);
    /// border-inline-start-color: currentcolor;
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
