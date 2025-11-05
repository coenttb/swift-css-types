import CSSTypeTypes
import Foundation

/// Represents the CSS `border-inline-end` shorthand property, which sets border properties for
/// the logical inline-end border of an element.
///
/// This logical property is a shorthand for setting `border-inline-end-width`, `border-inline-end-style`,
/// and `border-inline-end-color` in a single declaration. The physical border it affects depends on
/// the element's writing mode, directionality, and text orientation.
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
///      border-inline-end       border-inline-end
///           (right)                 (left)
///
/// vertical-rl:                vertical-lr:
/// ┌─────────────────────┐     ┌─────────────────────┐
/// │                     │     │                     │
/// ├─────────────────────┤     ├─────────────────────┤
/// │                     │     │                     │
/// │                     │     │                     │
/// └─────────────────────┘     └─────────────────────┘
///  ▲                                               ▲
/// border-inline-end                  border-inline-end
///    (bottom)                             (top)
/// ```
///
/// Example:
/// ```swift
/// // Set only border style
/// .borderInlineEnd(.style(.solid))
///
/// // Set border style and color
/// .borderInlineEnd(.styleAndColor(.dashed, .red))
///
/// // Set border width and style
/// .borderInlineEnd(.widthAndStyle(.px(2), .dotted))
///
/// // Set all three properties
/// .borderInlineEnd(.properties(width: .px(3), style: .double, color: .blue))
///
/// // Use a global value
/// .borderInlineEnd(.global(.inherit))
/// ```
///
/// - SeeAlso: [MDN Web Docs on border-inline-end](https://developer.mozilla.org/en-US/docs/Web/CSS/border-inline-end)
public enum BorderInlineEnd: Property {

    public static let property: String = "border-inline-end"

    /// Represents the possible border property combinations
    case properties(width: BorderWidth.Width?, style: LineStyle?, color: Color?)

    /// Global CSS values
    case global(CSSTypeTypes.Global)

    /// Creates a border-inline-end with just a style
    public static func style(_ style: LineStyle) -> BorderInlineEnd {
        .properties(width: nil, style: style, color: nil)
    }

    /// Creates a border-inline-end with a width, style, and color
    public static func all(
        _ width: BorderWidth.Width,
        _ style: LineStyle,
        _ color: Color
    ) -> BorderInlineEnd {
        .properties(width: width, style: style, color: color)
    }
}

/// Convenience initializers for BorderInlineEnd
extension BorderInlineEnd {
    /// Creates a border-inline-end with just a style
    ///
    /// - Parameter style: The inline-end border style
    public init(_ style: LineStyle) {
        self = .style(style)
    }

    //    /// Creates a border-inline-end with a style and color
    //    ///
    //    /// - Parameters:
    //    ///   - style: The inline-end border style
    //    ///   - color: The inline-end border color
    //    public init(_ style: LineStyle, _ color: Color) {
    //        self = .init(style, color)
    //    }
    //
    //    /// Creates a border-inline-end with a width and style
    //    ///
    //    /// - Parameters:
    //    ///   - width: The inline-end border width
    //    ///   - style: The inline-end border style
    //    public init(_ width: BorderWidth.Width, _ style: LineStyle) {
    //        self = .init(width, style)
    //    }
    //
    /// Creates a border-inline-end with a width, style, and color
    ///
    /// - Parameters:
    ///   - width: The inline-end border width
    ///   - style: The inline-end border style
    ///   - color: The inline-end border color
    public init(_ width: BorderWidth.Width, _ style: LineStyle, _ color: Color) {
        self = .all(width, style, color)
    }

    /// Creates a border-inline-end with specific properties
    ///
    /// - Parameters:
    ///   - width: The width of the inline-end border
    ///   - style: The style of the inline-end border
    ///   - color: The color of the inline-end border
    public init(width: BorderWidth.Width? = nil, style: LineStyle? = nil, color: Color? = nil) {
        self = .properties(width: width, style: style, color: color)
    }
}

/// Provides string conversion for CSS output
extension BorderInlineEnd: CustomStringConvertible {
    /// Converts the border-inline-end to its CSS string representation
    ///
    /// This method generates CSS like:
    /// ```css
    /// border-inline-end: solid;
    /// border-inline-end: dashed red;
    /// border-inline-end: 2px dotted;
    /// border-inline-end: 3px double blue;
    /// border-inline-end: inherit;
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

/// Convenience methods for creating BorderInlineEnd values
extension BorderInlineEnd {
    /// Creates a none border-inline-end (invisible)
    public static let none = BorderInlineEnd(.none)

    /// Creates a hidden border-inline-end (invisible, high priority in border collapsing)
    public static let hidden = BorderInlineEnd(.hidden)

    /// Creates a solid border-inline-end with default width and color
    public static let solid = BorderInlineEnd(.solid)

    /// Creates a dotted border-inline-end with default width and color
    public static let dotted = BorderInlineEnd(.dotted)

    /// Creates a dashed border-inline-end with default width and color
    public static let dashed = BorderInlineEnd(.dashed)

    /// Creates a double border-inline-end with default width and color
    public static let double = BorderInlineEnd(.double)

    /// Creates a groove border-inline-end with default width and color
    public static let groove = BorderInlineEnd(.groove)

    /// Creates a ridge border-inline-end with default width and color
    public static let ridge = BorderInlineEnd(.ridge)

    /// Creates a inset border-inline-end with default width and color
    public static let inset = BorderInlineEnd(.inset)

    /// Creates a outset border-inline-end with default width and color
    public static let outset = BorderInlineEnd(.outset)

}
