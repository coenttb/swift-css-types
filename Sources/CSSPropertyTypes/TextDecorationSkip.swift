import CSSTypeTypes
import Foundation

/// Sets what parts of an element's content text decoration must skip over.
///
/// The text-decoration-skip CSS property sets what parts of an element's content any text decoration 
/// affecting the element must skip over. It controls all text decoration lines drawn by the element 
/// and also any text decoration lines drawn by its ancestors.
///
/// Note: This is an experimental property. Most browsers are converging on supporting the simpler
/// text-decoration-skip-ink property instead.
///
/// [Learn more at MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration-skip)
///
/// # Example
/// ```swift
/// let style = Text.textDecorationSkip(.none)
/// let style = Text.textDecorationSkip(.auto)
/// let style = Text.textDecorationSkip([.objects, .spaces])
/// let style = Text.textDecorationSkip([.edges, .boxDecoration])
/// ```
///
/// # CSS Values
/// ```css
/// text-decoration-skip: none;
/// text-decoration-skip: auto;
/// text-decoration-skip: objects spaces;
/// text-decoration-skip: edges box-decoration;
/// ```
public enum TextDecorationSkipValue: Sendable, Hashable, CustomStringConvertible {
    /// Nothing is skipped. Text decoration is drawn for all text content and across atomic inline-level boxes.
    case none

    /// The browser determines what should be skipped. This is the default in some browsers.
    case auto

    /// The margin box of the element is skipped if it is an atomic inline such as an image or inline-block.
    case objects

    /// All spacing is skipped: all Unicode white space characters and all word separators,
    /// plus any adjacent letter-spacing or word-spacing.
    case spaces

    /// The same as spaces, except that only leading spaces are skipped.
    case leadingSpaces

    /// The same as spaces, except that only trailing spaces are skipped.
    case trailingSpaces

    /// The start and end of the text decoration is inset slightly from the content edge of the decorating box.
    /// Thus, adjacent elements receive separate underlines.
    case edges

    /// The text decoration is skipped over the box's margin, border, and padding areas.
    case boxDecoration

    public var description: String {
        switch self {
        case .none:
            return "none"
        case .auto:
            return "auto"
        case .objects:
            return "objects"
        case .spaces:
            return "spaces"
        case .leadingSpaces:
            return "leading-spaces"
        case .trailingSpaces:
            return "trailing-spaces"
        case .edges:
            return "edges"
        case .boxDecoration:
            return "box-decoration"
        }
    }
}

public enum TextDecorationSkip: Property {
    public static let property: String = "text-decoration-skip"

    /// A single value
    case value(TextDecorationSkipValue)

    /// Multiple values
    case values([TextDecorationSkipValue])

    /// Global CSS values
    case global(CSSTypeTypes.Global)
}

extension TextDecorationSkip: CustomStringConvertible {
    public var description: String {
        switch self {
        case .value(let value):
            return value.description
        case .values(let values):
            return values.map { $0.description }.joined(separator: " ")
        case .global(let global):
            return global.description
        }
    }
}
