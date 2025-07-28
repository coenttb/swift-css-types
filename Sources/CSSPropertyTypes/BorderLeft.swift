import CSSTypeTypes
import Foundation

/// Represents the CSS `border-left` shorthand property, which sets all the left border properties at once.
///
/// The border-left property is a shorthand that sets the width, style, and color for the left border
/// of an element. It combines the following properties:
/// - border-left-width: Sets the width of the left border
/// - border-left-style: Sets the style of the left border (required for the border to be visible)
/// - border-left-color: Sets the color of the left border
///
/// Visual Reference:
/// ```
/// ┌─────┬───────────────────────┐
/// │     │                       │
/// │     │                       │
/// │     │                       │
/// │     │                       │
/// │     │                       │
/// └─────┴───────────────────────┘
///   ↑
///   border-left
///
/// Different styles:
/// ┌─────┐        ┌╍╍╍╍╍┐
/// │     │        ┆     ┆
/// │     │        ┆     ┆
/// │     │        ┆     ┆
/// │     │        ┆     ┆
/// └─────┘        └╍╍╍╍╍┘
///  solid          dashed
///
/// ┌·····┐        ┌═════┐
/// ┆     ┆        ┃     ┃
/// ┆     ┆        ┃     ┃
/// ┆     ┆        ┃     ┃
/// ┆     ┆        ┃     ┃
/// └·····┘        └═════┘
///  dotted         double
/// ```
///
/// Example:
/// ```swift
/// // Set only border style (width and color use defaults)
/// .borderLeft(.style(.solid))
///
/// // Set border style and color
/// .borderLeft(.styleAndColor(.dashed, .red))
///
/// // Set border width and style
/// .borderLeft(.widthAndStyle(.px(2), .dotted))
///
/// // Set all three properties
/// .borderLeft(.properties(width: .px(3), style: .double, color: .blue))
///
/// // Create a thick ridge border with partial transparency
/// .borderLeft(.properties(width: .thick, style: .ridge, color: .rgba(50, 161, 206, 0.8)))
///
/// // Use a global value
/// .borderLeft(.global(.inherit))
/// ```
///
/// - Note: If the border style is not specified, the border will be invisible since the default style is `none`.
///
/// - SeeAlso: [MDN Web Docs on border-left](https://developer.mozilla.org/en-US/docs/Web/CSS/border-left)
public enum BorderLeft: Property {
    public static let property: String = "border-left"
    /// Represents the possible border property combinations
    case properties(width: BorderWidth.Width?, style: LineStyle?, color: Color?)

    /// Global CSS values
    case global(CSSTypeTypes.Global)

    /// Creates a border-left with just a style
    public static func style(_ style: LineStyle) -> BorderLeft {
        .properties(width: nil, style: style, color: nil)
    }

    /// Creates a border-left with a width, style, and color
    public static func all(_ width: BorderWidth.Width, _ style: LineStyle, _ color: Color) -> BorderLeft {
        .properties(width: width, style: style, color: color)
    }
}

/// Convenience initializers for BorderLeft
extension BorderLeft {
    /// Creates a border-left with just a style
    ///
    /// - Parameter style: The left border style
    public init(_ style: LineStyle) {
        self = .style(style)
    }
//    
//    /// Creates a border-left with a style and color
//    ///
//    /// - Parameters:
//    ///   - style: The left border style
//    ///   - color: The left border color
//    public init(_ style: LineStyle, _ color: Color) {
//        self = .init(style, color)
//    }
//    
//    /// Creates a border-left with a width and style
//    ///
//    /// - Parameters:
//    ///   - width: The left border width
//    ///   - style: The left border style
//    public init(_ width: BorderWidth.Width, _ style: LineStyle) {
//        self = .init(width, style)
//    }

    /// Creates a border-left with a width, style, and color
    ///
    /// - Parameters:
    ///   - width: The left border width
    ///   - style: The left border style
    ///   - color: The left border color
    public init(_ width: BorderWidth.Width, _ style: LineStyle, _ color: Color) {
        self = .all(width, style, color)
    }

    /// Creates a border-left with specific properties
    ///
    /// - Parameters:
    ///   - width: The width of the left border
    ///   - style: The style of the left border
    ///   - color: The color of the left border
    public init(width: BorderWidth.Width? = nil, style: LineStyle? = nil, color: Color? = nil) {
        self = .properties(width: width, style: style, color: color)
    }
}

/// Provides string conversion for CSS output
extension BorderLeft: CustomStringConvertible {
    /// Converts the border-left to its CSS string representation
    ///
    /// This method generates CSS like:
    /// ```css
    /// border-left: solid;
    /// border-left: dashed red;
    /// border-left: 2px dotted;
    /// border-left: 3px double blue;
    /// border-left: thick ridge rgba(50, 161, 206, 0.8);
    /// border-left: inherit;
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

/// Convenience methods for creating BorderLeft values
extension BorderLeft {
    /// Creates a none border-left (invisible)
    public static let none = BorderLeft(.none)

    /// Creates a hidden border-left (invisible, high priority in border collapsing)
    public static let hidden = BorderLeft(.hidden)

    /// Creates a solid border-left with default width and color
    public static let solid = BorderLeft(.solid)

    /// Creates a dotted border-left with default width and color
    public static let dotted = BorderLeft(.dotted)

    /// Creates a dashed border-left with default width and color
    public static let dashed = BorderLeft(.dashed)

    /// Creates a double border-left with default width and color
    public static let double = BorderLeft(.double)

    /// Creates a groove border-left with default width and color
    public static let groove = BorderLeft(.groove)

    /// Creates a ridge border-left with default width and color
    public static let ridge = BorderLeft(.ridge)

    /// Creates a inset border-left with default width and color
    public static let inset = BorderLeft(.inset)

    /// Creates a outset border-left with default width and color
    public static let outset = BorderLeft(.outset)

}
