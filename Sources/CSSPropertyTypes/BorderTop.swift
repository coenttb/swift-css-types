import Foundation
import CSSTypeTypes

/// Represents the CSS `border-top` shorthand property, which sets all the top border properties at once.
///
/// The border-top property is a shorthand that sets the width, style, and color for the top border
/// of an element. It combines the following properties:
/// - border-top-width: Sets the width of the top border
/// - border-top-style: Sets the style of the top border (required for the border to be visible)
/// - border-top-color: Sets the color of the top border
///
/// Visual Reference:
/// ```
/// ┌───────────────────────────┐
/// │                           │   ← border-top
/// │                           │
/// │                           │
/// │                           │
/// └───────────────────────────┘
///
/// Different styles:
/// ┌───────────────────────────┐   ┌- - - - - - - - - - - - - -┐
/// │                           │   │                           │
/// │                           │   │                           │
/// │                           │   │                           │
/// │                           │   │                           │
/// └───────────────────────────┘   └───────────────────────────┘
///  solid                           dashed
///
/// ┌·······················┐   ┌═══════════════════════════┐
/// │                       │   │                           │
/// │                       │   │                           │
/// │                       │   │                           │
/// │                       │   │                           │
/// └───────────────────────┘   └───────────────────────────┘
///  dotted                      double
/// ```
///
/// Example:
/// ```swift
/// // Set only border style (width and color use defaults)
/// .borderTop(.solid)
///
/// // Set border style and color
/// .borderTop(.dashed, .red)
///
/// // Set border width and style
/// .borderTop(.px(2), .dotted)
///
/// // Set all three properties
/// .borderTop(.px(3), .double, .blue)
///
/// // Create a thick ridge border with partial transparency
/// .borderTop(.thick, .ridge, .rgba(50, 161, 206, 0.8))
///
/// // Use a global value
/// .borderTop(.global(.inherit))
/// ```
///
/// - Note: If the border style is not specified, the border will be invisible since the default style is `none`.
///
/// - SeeAlso: [MDN Web Docs on border-top](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top)
public enum BorderTop: Property {
    
    public static let property: String = "border-top"
    
    /// Border top properties
    case properties(Properties)
    
    /// Global CSS values
    case global(CSSTypeTypes.Global)
    
    /// Creates a border-top with just a style
    public init(_ style: LineStyle) {
        self = .properties(Properties(style: style))
    }
    
    /// Creates a border-top with width and style
    public init(_ width: BorderWidth, _ style: LineStyle) {
        self = .properties(Properties(width: width, style: style))
    }
    
    /// Creates a border-top with style and color
    public init(_ style: LineStyle, _ color: Color) {
        self = .properties(Properties(style: style, color: color))
    }
    
    /// Creates a border-top with width, style, and color
    public init(_ width: BorderWidth, _ style: LineStyle, _ color: Color) {
        self = .properties(Properties(width: width, style: style, color: color))
    }
    
    /// Creates a border-top with the specified properties
    public init(width: BorderWidth? = nil, style: LineStyle? = nil, color: Color? = nil) {
        self = .properties(Properties(width: width, style: style, color: color))
    }
}

extension BorderTop {
    /// Properties for the border-top shorthand
    public struct Properties: Sendable, Equatable, CustomStringConvertible {
        /// The width of the top border
        public let width: BorderWidth?
        
        /// The style of the top border (required for the border to be visible)
        public let style: LineStyle?
        
        /// The color of the top border
        public let color: Color?
        
        /// Creates border-top properties with the specified values
        public init(width: BorderWidth? = nil, style: LineStyle? = nil, color: Color? = nil) {
            self.width = width
            self.style = style
            self.color = color
        }
        
        /// CSS string representation of the border-top properties
        public var description: String {
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
        }
    }
}

/// Provides string conversion for CSS output
extension BorderTop: CustomStringConvertible {
    /// Converts the border-top to its CSS string representation
    ///
    /// This method generates CSS like:
    /// ```css
    /// border-top: solid;
    /// border-top: dashed red;
    /// border-top: 2px dotted;
    /// border-top: 3px double blue;
    /// border-top: thick ridge rgba(50, 161, 206, 0.8);
    /// border-top: inherit;
    /// ```
    public var description: String {
        switch self {
        case .properties(let properties):
            return properties.description
        case .global(let global):
            return global.description
        }
    }
}

/// Convenience factories for creating BorderTop values
extension BorderTop {
    /// Creates a none border-top (invisible)
    public static let none = BorderTop(.none)
    
    /// Creates a hidden border-top (invisible, high priority in border collapsing)
    public static let hidden = BorderTop(.hidden)
    
    /// Creates a solid border-top with default width and color
    public static let solid = BorderTop(.solid)
    
    /// Creates a dotted border-top with default width and color
    public static let dotted = BorderTop(.dotted)
    
    /// Creates a dashed border-top with default width and color
    public static let dashed = BorderTop(.dashed)
    
    /// Creates a double border-top with default width and color
    public static let double = BorderTop(.double)
    
    /// Creates a groove border-top with default width and color
    public static let groove = BorderTop(.groove)
    
    /// Creates a ridge border-top with default width and color
    public static let ridge = BorderTop(.ridge)
    
    /// Creates a inset border-top with default width and color
    public static let inset = BorderTop(.inset)
    
    /// Creates a outset border-top with default width and color
    public static let outset = BorderTop(.outset)
    
    /// Creates a thin border-top with the specified style
    ///
    /// - Parameter style: The border style
    /// - Returns: A thin border-top with the specified style
    public static func thin(_ style: LineStyle) -> BorderTop {
        .properties(Properties(width: .thin, style: style))
    }
    
    /// Creates a medium border-top with the specified style
    ///
    /// - Parameter style: The border style
    /// - Returns: A medium border-top with the specified style
    public static func medium(_ style: LineStyle) -> BorderTop {
        .properties(Properties(width: .medium, style: style))
    }
    
    /// Creates a thick border-top with the specified style
    ///
    /// - Parameter style: The border style
    /// - Returns: A thick border-top with the specified style
    public static func thick(_ style: LineStyle) -> BorderTop {
        .properties(Properties(width: .thick, style: style))
    }
}
