import Foundation
import CSSTypeTypes

/// Represents the CSS `border-inline-end-color` property, which defines the color of the logical inline-end
/// border of an element.
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
///                    ▲         ▲
///   border-inline-end-color    border-inline-end-color
///        (right)                     (left)
///
/// vertical-rl:                vertical-lr:
/// ┌─────────────────────┐     ┌─────────────────────┐
/// │                     │     │                     │
/// ├─────────────────────┤     ├─────────────────────┤
/// │                     │     │                     │
/// │                     │     │                     │
/// └─────────────────────┘     └─────────────────────┘
///  ▲                                               ▲
/// border-inline-end-color              border-inline-end-color
///     (bottom)                              (top)
/// ```
///
/// Example:
/// ```swift
/// // Set the inline-end border color to red
/// .borderInlineEndColor(.red)
///
/// // Set the inline-end border color to a hex value
/// .borderInlineEndColor(.hex("#32a1ce"))
///
/// // Set the inline-end border color to a semi-transparent color
/// .borderInlineEndColor(.rgba(170, 50, 220, 0.6))
///
/// // Use the current text color
/// .borderInlineEndColor(.currentColor)
/// ```
///
/// - SeeAlso: [MDN Web Docs on border-inline-end-color](https://developer.mozilla.org/en-US/docs/Web/CSS/border-inline-end-color)
public enum BorderInlineEndColor: Property, ColorConvertible {
    
    public static let property: String = "border-inline-end-color"
    
    /// A specific color for the inline-end border
    case color(CSSTypeTypes.Color)
    
    /// Global CSS values
    case global(CSSTypeTypes.Global)
    
    /// Creates a border-inline-end-color with a specific color
    ///
    /// - Parameter color: The color for the inline-end border
    public init(_ color: CSSTypeTypes.Color) {
        self = .color(color)
    }
}

/// Provides string conversion for CSS output
extension BorderInlineEndColor: CustomStringConvertible {
    /// Converts the border-inline-end-color to its CSS string representation
    ///
    /// This method generates CSS like:
    /// ```css
    /// border-inline-end-color: red;
    /// border-inline-end-color: #32a1ce;
    /// border-inline-end-color: rgba(170, 50, 220, 0.6);
    /// border-inline-end-color: currentcolor;
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

/// Convenience methods for creating BorderInlineEndColor values
extension BorderInlineEndColor {
    /// The default border-inline-end-color value (currentcolor)
    public static let `default` = BorderInlineEndColor(.currentColor)
    
    /// Creates a transparent border-inline-end-color
    public static let transparent = BorderInlineEndColor(.transparent)
    
    /// Creates a border-inline-end-color that uses the current text color
    public static let currentColor = BorderInlineEndColor(.currentColor)
    
    /// Creates a black border-inline-end-color
    public static let black = BorderInlineEndColor(.black)
    
    /// Creates a white border-inline-end-color
    public static let white = BorderInlineEndColor(.white)
    
    /// Creates a red border-inline-end-color
    public static let red = BorderInlineEndColor(.red)
    
    /// Creates a green border-inline-end-color
    public static let green = BorderInlineEndColor(.green)
    
    /// Creates a blue border-inline-end-color
    public static let blue = BorderInlineEndColor(.blue)
}
