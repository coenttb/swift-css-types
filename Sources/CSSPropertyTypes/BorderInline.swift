import Foundation
import CSSTypeTypes

/// Represents the CSS `border-inline` shorthand property, which sets border properties for the inline dimension.
///
/// This logical property sets border width, style, and color for the inline borders of an element,
/// which map to different physical borders depending on the element's writing mode, directionality,
/// and text orientation. For example, in horizontal top-to-bottom writing mode, `border-inline` affects
/// the left and right borders.
///
/// Visual Reference:
/// ```
/// horizontal-tb writing mode:
/// ┌─────┬─────────────────┬─────┐
/// │     │                 │     │
/// │     │                 │     │
/// │     │                 │     │   ← border-inline borders 
/// │     │                 │     │    (left and right)
/// │     │                 │     │
/// └─────┴─────────────────┴─────┘
///   ↑                       ↑
///   border-inline-start     border-inline-end
///   (left)                  (right)
///
/// vertical-rl writing mode:
/// ┌─────────────────────────────┐
/// │                             │   ← border-inline-start (top)
/// ├─────────────────────────────┤
/// │                             │
/// │                             │
/// │                             │
/// ├─────────────────────────────┤
/// │                             │   ← border-inline-end (bottom)
/// └─────────────────────────────┘
/// ```
///
/// Example:
/// ```swift
/// // Set only border style
/// .borderInline(.style(.solid))
///
/// // Set border style and color
/// .borderInline(.styleAndColor(.dashed, .red))
///
/// // Set border width and style
/// .borderInline(.widthAndStyle(.px(2), .dotted))
///
/// // Set all three properties
/// .borderInline(.properties(width: .px(3), style: .double, color: .blue))
///
/// // Use a global value
/// .borderInline(.global(.inherit))
/// ```
///
/// - Note: This logical property adapts to the writing mode of the document, 
///         making layout more flexible for different writing systems.
///
/// - SeeAlso: [MDN Web Docs on border-inline](https://developer.mozilla.org/en-US/docs/Web/CSS/border-inline)
public enum BorderInline: Property {
    
    public static let property: String = "border-inline"
    
    /// Represents the possible border property combinations
    case properties(width: BorderWidth.Width?, style: LineStyle?, color: Color?)
    
    /// Global CSS values
    case global(CSSTypeTypes.Global)
    
    /// Creates a border-inline with just a style
    public static func style(_ style: LineStyle) -> BorderInline {
        .properties(width: nil, style: style, color: nil)
    }
    
    /// Creates a border-inline with a width, style, and color
    public static func all(_ width: BorderWidth.Width, _ style: LineStyle, _ color: Color) -> BorderInline {
        .properties(width: width, style: style, color: color)
    }
}

/// Convenience initializers for BorderInline
extension BorderInline {
   
    
    /// Creates a border-inline with a width, style, and color
    ///
    /// - Parameters:
    ///   - width: The inline border width
    ///   - style: The inline border style
    ///   - color: The inline border color
    public init(_ width: BorderWidth.Width, _ style: LineStyle, _ color: Color) {
        self = .all(width, style, color)
    }
    
    /// Creates a border-inline with specific properties
    ///
    /// - Parameters:
    ///   - width: The width of the inline borders
    ///   - style: The style of the inline borders
    ///   - color: The color of the inline borders
    public init(width: BorderWidth.Width? = nil, style: LineStyle? = nil, color: Color? = nil) {
        self = .properties(width: width, style: style, color: color)
    }
}


/// Provides string conversion for CSS output
extension BorderInline: CustomStringConvertible {
    /// Converts the border-inline to its CSS string representation
    ///
    /// This method generates CSS like:
    /// ```css
    /// border-inline: solid;
    /// border-inline: dashed red;
    /// border-inline: 2px dotted;
    /// border-inline: 3px double blue;
    /// border-inline: inherit;
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
            
            return parts.joined(separator: " ")
            
        case .global(let global):
            return global.description
        }
    }
}

/// Convenience methods for creating BorderInline values
extension BorderInline {
    /// Creates a thin border-inline with the specified style
    ///
    /// - Parameter style: The border style
    /// - Returns: A thin border-inline with the specified style
    public static func thin(_ style: LineStyle) -> BorderInline {
        .init(width: .thin, style: style)
    }
    
    /// Creates a medium border-inline with the specified style
    ///
    /// - Parameter style: The border style
    /// - Returns: A medium border-inline with the specified style
    public static func medium(_ style: LineStyle) -> BorderInline {
        .init(width: .medium, style: style)
    }
    
    /// Creates a thick border-inline with the specified style
    ///
    /// - Parameter style: The border style
    /// - Returns: A thick border-inline with the specified style
    public static func thick(_ style: LineStyle) -> BorderInline {
        .init(width: .thick, style: style)
    }
}
