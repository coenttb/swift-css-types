import Foundation
import CSSTypeTypes

/// The CSS `outline-color` property sets the color of an element's outline.
///
/// An outline is a line drawn around an element, outside the border.
/// This property defines the color of that line.
///
/// Example:
/// ```swift
/// .outlineColor(.red)                   // outline-color: red
/// .outlineColor(.hex("#32a1ce"))        // outline-color: #32a1ce
/// .outlineColor(.rgba(170, 50, 220, 0.6)) // outline-color: rgba(170, 50, 220, 0.6)
/// .outlineColor(.currentColor)         // outline-color: currentcolor
/// ```
///
/// - SeeAlso: [MDN Web Docs on outline-color](https://developer.mozilla.org/en-US/docs/Web/CSS/outline-color)
public enum OutlineColor: Property, ColorConvertible {
    public static let property: String = "outline-color"
    
    /// A specific color value
    case color(CSSTypeTypes.Color)
    
    /// Automatically determined color (typically the inverse of the background)
    case auto
    
    /// Global value
    case global(CSSTypeTypes.Global)
}

/// CSS Output conversion
extension OutlineColor: CustomStringConvertible {
    /// Converts the outline-color value to its CSS string representation
    public var description: String {
        switch self {
        case .color(let color):
            return color.description
        case .auto:
            return "auto"
        case .global(let global):
            return global.description
        }
    }
}

/// Allow factory methods for common colors
extension OutlineColor {
    /// Creates an outline-color with a named CSS color
    ///
    /// - Parameter namedColor: The named color
    /// - Returns: An OutlineColor with the specified named color
    public static func namedColor(_ namedColor: NamedColor) -> Self {
        .color(.named(namedColor))
    }
    
    /// Creates an outline-color with a hex color
    ///
    /// - Parameter hex: The hex color string
    /// - Returns: An OutlineColor with the specified hex color
    public static func hex(_ hex: String) -> Self {
        .color(.hex(hex))
    }
    
    /// Creates an outline-color with RGB values
    ///
    /// - Parameters:
    ///   - red: Red component (0-255)
    ///   - green: Green component (0-255)
    ///   - blue: Blue component (0-255)
    /// - Returns: An OutlineColor with the specified RGB color
    public static func rgb(_ red: Int, _ green: Int, _ blue: Int) -> Self {
        .color(.rgb(red, green, blue))
    }
    
    /// Creates an outline-color with RGBA values
    ///
    /// - Parameters:
    ///   - red: Red component (0-255)
    ///   - green: Green component (0-255)
    ///   - blue: Blue component (0-255)
    ///   - alpha: Alpha component (0.0-1.0)
    /// - Returns: An OutlineColor with the specified RGBA color
    public static func rgba(_ red: Int, _ green: Int, _ blue: Int, _ alpha: Double) -> Self {
        .color(.rgba(red, green, blue, alpha))
    }
    
    /// Creates an outline-color using the current text color
    public static let currentColor: Self = .color(.currentColor)
    
    /// Creates an outline-color using transparent color
    public static let transparent: Self = .color(.transparent)
    
    // Named color convenience properties
    public static let black: Self = .namedColor(.black)
    public static let silver: Self = .namedColor(.silver)
    public static let gray: Self = .namedColor(.gray)
    public static let white: Self = .namedColor(.white)
    public static let maroon: Self = .namedColor(.maroon)
    public static let red: Self = .namedColor(.red)
    public static let purple: Self = .namedColor(.purple)
    public static let fuchsia: Self = .namedColor(.fuchsia)
    public static let green: Self = .namedColor(.green)
    public static let lime: Self = .namedColor(.lime)
    public static let olive: Self = .namedColor(.olive)
    public static let yellow: Self = .namedColor(.yellow)
    public static let navy: Self = .namedColor(.navy)
    public static let blue: Self = .namedColor(.blue)
    public static let teal: Self = .namedColor(.teal)
    public static let aqua: Self = .namedColor(.aqua)
}
