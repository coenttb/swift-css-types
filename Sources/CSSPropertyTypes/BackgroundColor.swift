import Foundation
import CSSTypeTypes

/// Represents the CSS `background-color` property, which sets the background color of an element.
///
/// This property sets a solid color as the background for an element. The color is rendered
/// behind any background images, though it will be visible through any transparency in the images.
///
/// Visual Reference:
/// ```
/// ┌───────────────────────────┐  ┌───────────────────────────┐
/// │                           │  │                           │
/// │    Element with red       │  │    Element with blue      │
/// │    background-color       │  │    background-color       │
/// │                           │  │                           │
/// └───────────────────────────┘  └───────────────────────────┘
///
/// ┌───────────────────────────┐  ┌───────────────────────────┐
/// │                           │  │                           │
/// │    Element with           │  │    Element with           │
/// │    semi-transparent       │  │    gradient               │
/// │    background-color       │  │    background-image       │
/// │                           │  │    and background-color   │
/// └───────────────────────────┘  └───────────────────────────┘
/// ```
///
/// Example:
/// ```swift
/// // Basic color using keyword
/// .backgroundColor(.red)
///
/// // Using RGB values
/// .backgroundColor(.rgb(255, 200, 100))
///
/// // Using RGBA with transparency
/// .backgroundColor(.rgba(255, 0, 0, 0.5))
///
/// // Using HSL color
/// .backgroundColor(.hsl(120, 100, 50))
///
/// // Using a hex color
/// .backgroundColor(.hex("#ff00ff"))
///
/// // Using transparent (default)
/// .backgroundColor(.transparent)
/// ```
///
/// - Note: When choosing background colors, ensure sufficient contrast with text for accessibility.
///
/// - SeeAlso: [MDN Web Docs on background-color](https://developer.mozilla.org/en-US/docs/Web/CSS/background-color)
public enum BackgroundColor: Property, ColorConvertible {
    public static let property: String = "background-color"
    
    /// A specific color value
    case color(CSSTypeTypes.Color)
    
    /// Global CSS values
    case global(CSSTypeTypes.Global)
    
    /// Creates a background color with a specific color
    ///
    /// - Parameter color: The color to use
    public init(_ color: CSSTypeTypes.Color) {
        self = .color(color)
    }
}

/// Provides string conversion for CSS output
extension BackgroundColor: CustomStringConvertible {
    /// Converts the background-color value to its CSS string representation
    ///
    /// This method generates CSS like:
    /// ```css
    /// background-color: red;
    /// background-color: rgba(255, 0, 0, 0.5);
    /// background-color: transparent;
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

/// Default value and predefined colors
extension BackgroundColor {
    /// The default value for background-color (`transparent`)
    public static let `default` = BackgroundColor(.transparent)
    
    /// Transparent background
    public static let transparent = BackgroundColor(.transparent)
    
    /// Current color value
    public static let currentColor = BackgroundColor(.currentColor)
    
    // Common color shortcuts
    
    /// Black background color
    public static let black = BackgroundColor(.black)
    
    /// White background color
    public static let white = BackgroundColor(.white)
    
    /// Red background color
    public static let red = BackgroundColor(.red)
    
    /// Green background color
    public static let green = BackgroundColor(.green)
    
    /// Blue background color
    public static let blue = BackgroundColor(.blue)
    
    /// Yellow background color
    public static let yellow = BackgroundColor(.yellow)
    
    /// Cyan background color
    public static let cyan = BackgroundColor(.cyan)
    
    /// Magenta background color
    public static let magenta = BackgroundColor(.magenta)
    
    /// Gray background color
    public static let gray = BackgroundColor(.gray)
}
