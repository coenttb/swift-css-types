import CSSTypeTypes
import Foundation

/// Represents the CSS `border-inline-start` shorthand property, which sets border properties for
/// the logical inline-start border of an element.
///
/// This logical property is a shorthand for setting `border-inline-start-width`, `border-inline-start-style`,
/// and `border-inline-start-color` in a single declaration. The physical border it affects depends on
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
///  ▲                                                ▲
/// border-inline-start             border-inline-start
///      (left)                           (right)
///
/// vertical-rl:                vertical-lr:
/// ┌─────────────────────┐     ┌─────────────────────┐
/// │                     │     │                     │
/// ├─────────────────────┤     ├─────────────────────┤
/// │                     │     │                     │
/// │                     │     │                     │
/// └─────────────────────┘     └─────────────────────┘
///                     ▲        ▲
///        border-inline-start    border-inline-start
///            (top)                  (bottom)
/// ```
///
/// Example:
/// ```swift
/// // Set only border style
/// .borderInlineStart(.style(.solid))
///
/// // Set border style and color
/// .borderInlineStart(.styleAndColor(.dashed, .red))
///
/// // Set border width and style
/// .borderInlineStart(.widthAndStyle(.px(2), .dotted))
///
/// // Set all three properties
/// .borderInlineStart(.properties(width: .px(3), style: .double, color: .blue))
///
/// // Use a global value
/// .borderInlineStart(.global(.inherit))
/// ```
///
/// - SeeAlso: [MDN Web Docs on border-inline-start](https://developer.mozilla.org/en-US/docs/Web/CSS/border-inline-start)
public enum BorderInlineStart: Property {

    public static let property: String = "border-inline-start"

    /// Represents the possible border property combinations
    case properties(width: BorderWidth.Width?, style: LineStyle?, color: Color?)

    /// Global CSS values
    case global(CSSTypeTypes.Global)

    /// Creates a border-inline-start with just a style
    public static func style(_ style: LineStyle) -> BorderInlineStart {
        .properties(width: nil, style: style, color: nil)
    }

    /// Creates a border-inline-start with a width, style, and color
    public static func all(
        _ width: BorderWidth.Width,
        _ style: LineStyle,
        _ color: Color
    ) -> BorderInlineStart {
        .properties(width: width, style: style, color: color)
    }
}

/// Convenience initializers for BorderInlineStart
extension BorderInlineStart {
    /// Creates a border-inline-start with just a style
    ///
    /// - Parameter style: The inline-start border style
    public init(_ style: LineStyle) {
        self = .style(style)
    }

    //    /// Creates a border-inline-start with a style and color
    //    ///
    //    /// - Parameters:
    //    ///   - style: The inline-start border style
    //    ///   - color: The inline-start border color
    //    public init(_ style: LineStyle, _ color: Color) {
    //        self = .init(style, color)
    //    }
    //
    //    /// Creates a border-inline-start with a width and style
    //    ///
    //    /// - Parameters:
    //    ///   - width: The inline-start border width
    //    ///   - style: The inline-start border style
    //    public init(_ width: BorderWidth.Width, _ style: LineStyle) {
    //        self = .init(width, style)
    //    }

    /// Creates a border-inline-start with a width, style, and color
    ///
    /// - Parameters:
    ///   - width: The inline-start border width
    ///   - style: The inline-start border style
    ///   - color: The inline-start border color
    public init(_ width: BorderWidth.Width, _ style: LineStyle, _ color: Color) {
        self = .all(width, style, color)
    }

    /// Creates a border-inline-start with specific properties
    ///
    /// - Parameters:
    ///   - width: The width of the inline-start border
    ///   - style: The style of the inline-start border
    ///   - color: The color of the inline-start border
    public init(width: BorderWidth.Width? = nil, style: LineStyle? = nil, color: Color? = nil) {
        self = .properties(width: width, style: style, color: color)
    }
}

/// Provides string conversion for CSS output
extension BorderInlineStart: CustomStringConvertible {
    /// Converts the border-inline-start to its CSS string representation
    ///
    /// This method generates CSS like:
    /// ```css
    /// border-inline-start: solid;
    /// border-inline-start: dashed red;
    /// border-inline-start: 2px dotted;
    /// border-inline-start: 3px double blue;
    /// border-inline-start: inherit;
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
