import CSSTypeTypes
import Foundation

/// The CSS `outline` shorthand property sets all the outline properties in a single declaration.
///
/// This shorthand sets the width, style, and color of an element's outline.
/// An outline is a line that is drawn around elements, outside the border edge.
/// Unlike borders, outlines don't take up space in the box model.
///
/// Example:
/// ```swift
/// .outline(.solid)                    // outline: solid
/// .outline(.dashed, .red)             // outline: dashed red
/// .outline(.rem(1), .solid)           // outline: 1rem solid
/// .outline(.thick, .double, .hex("#32a1ce")) // outline: thick double #32a1ce
/// ```
///
/// - SeeAlso: [MDN Web Docs on outline](https://developer.mozilla.org/en-US/docs/Web/CSS/outline)
public enum Outline: Property {
    public static let property: String = "outline"

    /// Style-only outline
    case style(OutlineStyle)

    /// Style and color outline
    case styleColor(OutlineStyle, OutlineColor)

    /// Width and style outline
    case widthStyle(OutlineWidth, OutlineStyle)

    /// Complete outline with width, style, and color
    case widthStyleColor(OutlineWidth, OutlineStyle, OutlineColor)

    /// Global value
    case global(CSSTypeTypes.Global)
}

/// CSS Output conversion
extension Outline: CustomStringConvertible {
    /// Converts the outline value to its CSS string representation
    public var description: String {
        switch self {
        case .style(let style):
            return style.description

        case .styleColor(let style, let color):
            return "\(style) \(color)"

        case .widthStyle(let width, let style):
            return "\(width) \(style)"

        case .widthStyleColor(let width, let style, let color):
            return "\(width) \(style) \(color)"

        case .global(let global):
            return global.description
        }
    }
}

/// Convenience initializers for commonly used outlines
extension Outline {
    /// Creates a standard outline with style, optional width, and optional color
    ///
    /// - Parameters:
    ///   - width: Optional width of the outline
    ///   - style: Style of the outline
    ///   - color: Optional color of the outline
    /// - Returns: An Outline configured with the specified properties
    public static func outline(
        _ width: OutlineWidth? = nil,
        _ style: OutlineStyle,
        _ color: OutlineColor? = nil
    ) -> Self {
        if let width = width, let color = color {
            return .widthStyleColor(width, style, color)
        } else if let width = width {
            return .widthStyle(width, style)
        } else if let color = color {
            return .styleColor(style, color)
        } else {
            return .style(style)
        }
    }

    /// Creates a solid outline with the specified width and color
    ///
    /// - Parameters:
    ///   - width: Width of the outline
    ///   - color: Color of the outline
    /// - Returns: A solid outline with the specified width and color
    public static func solid(_ width: OutlineWidth, _ color: OutlineColor) -> Self {
        .widthStyleColor(width, .solid, color)
    }

    /// Creates a dashed outline with the specified width and color
    ///
    /// - Parameters:
    ///   - width: Width of the outline
    ///   - color: Color of the outline
    /// - Returns: A dashed outline with the specified width and color
    public static func dashed(_ width: OutlineWidth, _ color: OutlineColor) -> Self {
        .widthStyleColor(width, .dashed, color)
    }

    /// Creates a dotted outline with the specified width and color
    ///
    /// - Parameters:
    ///   - width: Width of the outline
    ///   - color: Color of the outline
    /// - Returns: A dotted outline with the specified width and color
    public static func dotted(_ width: OutlineWidth, _ color: OutlineColor) -> Self {
        .widthStyleColor(width, .dotted, color)
    }

    /// Creates a double outline with the specified width and color
    ///
    /// - Parameters:
    ///   - width: Width of the outline
    ///   - color: Color of the outline
    /// - Returns: A double outline with the specified width and color
    public static func double(_ width: OutlineWidth, _ color: OutlineColor) -> Self {
        .widthStyleColor(width, .double, color)
    }
}
