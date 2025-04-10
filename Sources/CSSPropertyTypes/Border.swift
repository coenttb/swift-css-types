import Foundation
import CSSTypeTypes

/// Represents the CSS `border` shorthand property, which sets all border properties at once.
///
/// The border property is a shorthand for setting the border width, style, and color for all four sides
/// of an element. It combines the following properties:
/// - border-width: Sets the width of the border
/// - border-style: Sets the style of the border (required for the border to be visible)
/// - border-color: Sets the color of the border
///
/// Visual Reference:
/// ```
/// ┌───────────────────────────┐  ┌───────────────────────────┐
/// │                           │  │                           │
/// │  solid border             │  │  dashed border            │
/// │                           │  │                           │
/// │                           │  │                           │
/// └───────────────────────────┘  └- - - - - - - - - - - - - -┘
///
/// ┌∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙┐  ┌═══════════════════════════┐
/// │                           │  │                           │
/// │  dotted border            │  │  double border            │
/// │                           │  │                           │
/// │                           │  │                           │
/// └∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙┘  └═══════════════════════════┘
/// ```
///
/// Example:
/// ```swift
/// // Set only border style (width and color use defaults)
/// .border(.properties(style: .solid))
///
/// // Set border style and color
/// .border(.properties(style: .dashed, color: .red))
///
/// // Set border width and style
/// .border(.properties(width: .px(2), style: .dotted))
///
/// // Set all three properties
/// .border(.properties(width: .px(3), style: .double, color: .blue))
///
/// // Create a thick ridge border with partial transparency
/// .border(.properties(width: .thick, style: .ridge, color: .rgba(50, 161, 206, 0.8)))
/// ```
///
/// - Note: If the border style is not specified, the border will be invisible since the default style is `none`.
///
/// - SeeAlso: [MDN Web Docs on border](https://developer.mozilla.org/en-US/docs/Web/CSS/border)
public enum Border: Property {
    
    public static let property: String = "border"
    
    /// Specifies border properties (width, style, color)
    /// Note that per CSS spec, these can be specified in any order
    case properties(width: BorderWidth? = nil, style: LineStyle? = nil, color: Color? = nil)
    
    /// Global CSS values
    case global(CSSTypeTypes.Global)
    
    public init(
        width: BorderWidth? = nil,
        style: LineStyle? = nil,
        color: Color? = nil
    ) {
        self = .properties(width: width, style: style, color: color)
    }
}

/// Provides string conversion for CSS output
extension Border: CustomStringConvertible {
    /// Converts the border to its CSS string representation
    ///
    /// ```css
    /// border: solid;
    /// border: dashed red;
    /// border: 2px dotted;
    /// border: 3px double blue;
    /// border: thick ridge rgba(50, 161, 206, 0.8);
    /// border: inherit;
    /// ```
    public var description: String {
        switch self {
        case .properties(let width, let style, let color):
            var parts: [String] = []
            
            if let width = width {
                parts.append(width.description)
            }
            
            if let style = style {
                parts.append(style.description)
            }
            
            if let color = color {
                parts.append(color.description)
            }
            
            return parts.isEmpty ? "none" : parts.joined(separator: " ")
            
        case .global(let global):
            return global.description
        }
    }
}

/// Convenience methods for creating Border objects
extension Border {
    /// Creates a none border (invisible)
    public static let none = Border.properties(style: .none)
    
    /// Creates a hidden border (invisible, high priority in border collapsing)
    public static let hidden = Border.properties(style: .hidden)
    
    /// Creates a solid border with default width and color
    public static let solid = Border.properties(style: .solid)
    
    /// Creates a dotted border with default width and color
    public static let dotted = Border.properties(style: .dotted)
    
    /// Creates a dashed border with default width and color
    public static let dashed = Border.properties(style: .dashed)
    
    /// Creates a double border with default width and color
    public static let double = Border.properties(style: .double)
    
    /// Creates a groove border with default width and color
    public static let groove = Border.properties(style: .groove)
    
    /// Creates a ridge border with default width and color
    public static let ridge = Border.properties(style: .ridge)
    
    /// Creates a inset border with default width and color
    public static let inset = Border.properties(style: .inset)
    
    /// Creates a outset border with default width and color
    public static let outset = Border.properties(style: .outset)
    
    /// Creates a thin border with the specified style
    ///
    /// - Parameter style: The border style
    /// - Returns: A thin border with the specified style
    public static func thin(_ style: LineStyle) -> Border {
        .properties(width: .thin, style: style)
    }
    
    /// Creates a medium border with the specified style
    ///
    /// - Parameter style: The border style
    /// - Returns: A medium border with the specified style
    public static func medium(_ style: LineStyle) -> Border {
        .properties(width: .medium, style: style)
    }
    
    /// Creates a thick border with the specified style
    ///
    /// - Parameter style: The border style
    /// - Returns: A thick border with the specified style
    public static func thick(_ style: LineStyle) -> Border {
        .properties(width: .thick, style: style)
    }
    
    /// Inherits the value from the parent element
    public static let inherit = Border.global(.inherit)
    
    /// Uses the default value for the property
    public static let initial = Border.global(.initial)
    
    /// Reverts to the browser's default styling
    public static let revert = Border.global(.revert)
    
    /// Reverts to the value established in the previous cascade layer
    public static let revertLayer = Border.global(.revertLayer)
    
    /// Resets to its natural value (acts like `inherit` or `initial` depending on the property)
    public static let unset = Border.global(.unset)
}
