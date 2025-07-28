import CSSTypeTypes
import Foundation

/// Sets the style of lines used for text decoration (underline, overline, line-through).
///
/// The text-decoration-style CSS property sets the style of the lines specified by text-decoration-line.
/// The style applies to all lines specified in text-decoration-line.
///
/// [Learn more at MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration-style)
///
/// # Example
/// ```swift
/// let style = Text.textDecorationStyle(.solid)
/// let style = Text.textDecorationStyle(.double)
/// let style = Text.textDecorationStyle(.dotted)
/// let style = Text.textDecorationStyle(.dashed)
/// let style = Text.textDecorationStyle(.wavy)
/// ```
///
/// # CSS Values
/// ```css
/// text-decoration-style: solid;
/// text-decoration-style: double;
/// text-decoration-style: dotted;
/// text-decoration-style: dashed;
/// text-decoration-style: wavy;
/// ```
public enum TextDecorationStyle: Property {
    public static let property: String = "text-decoration-style"

    /// A single line. This is the default style.
    case solid

    /// Two lines.
    case double

    /// A series of dots.
    case dotted

    /// A series of dashes.
    case dashed

    /// A wavy line.
    case wavy

    /// Global CSS values
    case global(CSSTypeTypes.Global)
}

extension TextDecorationStyle: CustomStringConvertible {
    public var description: String {
        switch self {
        case .solid:
            return "solid"
        case .double:
            return "double"
        case .dotted:
            return "dotted"
        case .dashed:
            return "dashed"
        case .wavy:
            return "wavy"
        case .global(let global):
            return global.description
        }
    }
}
