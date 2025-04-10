import Foundation
import CSSTypeTypes

/// Represents the CSS `border-block-end-color` property, which sets the color of the logical block-end border.
///
/// This logical property sets the color for the block-end border of an element. The actual physical
/// border it affects depends on the element's writing mode, directionality, and text orientation.
/// For example, in horizontal top-to-bottom writing mode, `border-block-end-color` sets the color
/// of the bottom border.
///
/// Visual Reference:
/// ```
/// horizontal-tb writing mode:
/// ┌───────────────────────────┐
/// │                           │
/// │                           │
/// │                           │
/// │                           │
/// └───────────────────────────┘   ← border-block-end-color (bottom)
///
/// vertical-rl writing mode:
/// ┌───────────────────────────┐
/// │                           │
/// │                           │
/// │                           │
/// │                           │
/// └───────────────────────────┘
///   ↑
///   border-block-end-color (left)
/// ```
///
/// Example:
/// ```swift
/// // Set the block-end border color to red
/// .borderBlockEndColor(.red)
///
/// // Set the block-end border color to a semi-transparent blue
/// .borderBlockEndColor(.rgba(0, 0, 255, 0.5))
///
/// // Set the block-end border color to a hex value
/// .borderBlockEndColor(.hex("#32a1ce"))
///
/// // Use the current text color
/// .borderBlockEndColor(.currentColor)
/// ```
///
/// - Note: This logical property adapts to the writing mode of the document, 
///         making layout more flexible for different writing systems.
///
/// - SeeAlso: [MDN Web Docs on border-block-end-color](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-end-color)
public enum BorderBlockEndColor: Property, ColorConvertible {
    
    public static let property: String = "border-block-end-color"
    
    /// A specific color for the block-end border
    case color(CSSTypeTypes.Color)
    
    /// Global CSS values
    case global(CSSTypeTypes.Global)
    
    /// Creates a border-block-end-color with a specific color
    ///
    /// - Parameter color: The color for the block-end border
    public init(_ color: Color) {
        self = .color(color)
    }
}

/// Provides string conversion for CSS output
extension BorderBlockEndColor: CustomStringConvertible {
    /// Converts the border-block-end-color to its CSS string representation
    ///
    /// This method generates CSS like:
    /// ```css
    /// border-block-end-color: red;
    /// border-block-end-color: #32a1ce;
    /// border-block-end-color: rgba(0, 0, 255, 0.5);
    /// border-block-end-color: currentcolor;
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

/// Convenience methods for creating BorderBlockEndColor values
extension BorderBlockEndColor {
    /// The default border-block-end-color value (currentcolor)
    public static let `default` = BorderBlockEndColor(.currentColor)
    
    /// Creates a transparent border-block-end-color
    public static let transparent = BorderBlockEndColor(.transparent)
    
    /// Creates a border-block-end-color that uses the current text color
    public static let currentColor = BorderBlockEndColor(.currentColor)
    
    /// Creates a black border-block-end-color
    public static let black = BorderBlockEndColor(.black)
    
    /// Creates a white border-block-end-color
    public static let white = BorderBlockEndColor(.white)
    
    /// Creates a red border-block-end-color
    public static let red = BorderBlockEndColor(.red)
    
    /// Creates a green border-block-end-color
    public static let green = BorderBlockEndColor(.green)
    
    /// Creates a blue border-block-end-color
    public static let blue = BorderBlockEndColor(.blue)
}
