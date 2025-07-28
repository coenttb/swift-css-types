import CSSTypeTypes
import Foundation

/// The `contain` CSS property indicates that an element and its contents are, as much as possible,
/// independent from the rest of the document tree.
///
/// Containment enables isolating a subsection of the DOM, providing performance benefits by limiting 
/// calculations of layout, style, paint, size, or any combination to a DOM subtree rather than the entire page.
/// Containment can also be used to scope CSS counters and quotes.
///
/// - SeeAlso: [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/CSS/contain)
public enum Contain: Property, GlobalConvertible {
    public static let property: String = "contain"

    /// The element renders as normal, with no containment applied.
    case none

    /// All containment rules are applied to the element. This is equivalent to `contain: size layout paint style`.
    case strict

    /// All containment rules except size are applied to the element. This is equivalent to `contain: layout paint style`.
    case content

    /// Size containment is applied to the element in both the inline and block directions.
    case size

    /// Inline size containment is applied to the element.
    case inlineSize

    /// The internal layout of the element is isolated from the rest of the page.
    case layout

    /// Scopes effects that can escape the element to the element and its contents (like counters and quotes).
    case style

    /// Descendants of the element don't display outside its bounds.
    case paint

    /// Combined containment values
    case combined([ContainValue])

    /// Global values
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .none:
            return "none"
        case .strict:
            return "strict"
        case .content:
            return "content"
        case .size:
            return "size"
        case .inlineSize:
            return "inline-size"
        case .layout:
            return "layout"
        case .style:
            return "style"
        case .paint:
            return "paint"
        case .combined(let values):
            return values.map(\.description).joined(separator: " ")
        case .global(let value):
            return value.description
        }
    }
}

/// Allowed values for the `contain` property when using the combined case
public enum ContainValue: Sendable, Hashable, CustomStringConvertible {
    /// Size containment is applied to the element in both the inline and block directions.
    case size

    /// Inline size containment is applied to the element.
    case inlineSize

    /// The internal layout of the element is isolated from the rest of the page.
    case layout

    /// Scopes effects that can escape the element to the element and its contents (like counters and quotes).
    case style

    /// Descendants of the element don't display outside its bounds.
    case paint

    public var description: String {
        switch self {
        case .size:
            return "size"
        case .inlineSize:
            return "inline-size"
        case .layout:
            return "layout"
        case .style:
            return "style"
        case .paint:
            return "paint"
        }
    }
}

// MARK: - Factory Methods

public extension Contain {
    /// Apply size and layout containment
    static var sizeLayout: Self { .combined([.size, .layout]) }

    /// Apply size and paint containment
    static var sizePaint: Self { .combined([.size, .paint]) }

    /// Apply size, layout and paint containment
    static var sizeLayoutPaint: Self { .combined([.size, .layout, .paint]) }

    /// Apply layout and paint containment
    static var layoutPaint: Self { .combined([.layout, .paint]) }

    /// Apply layout and style containment
    static var layoutStyle: Self { .combined([.layout, .style]) }

    /// Apply layout, style and paint containment
    static var layoutStylePaint: Self { .combined([.layout, .style, .paint]) }

    /// Apply inline-size and layout containment
    static var inlineSizeLayout: Self { .combined([.inlineSize, .layout]) }

    /// Apply style and paint containment
    static var stylePaint: Self { .combined([.style, .paint]) }
}
