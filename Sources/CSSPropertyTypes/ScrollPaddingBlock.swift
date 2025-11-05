//
// ScrollPaddingBlock.swift

import CSSTypeTypes

/// The `scroll-padding-block` CSS property is a shorthand property that sets the scroll padding of an element
/// in the block dimension. This allows the author to exclude regions of the scrollport that are obscured
/// by other content (such as fixed-positioned toolbars or sidebars) or to put more breathing room between
/// a targeted element and the edges of the scrollport.
///
/// ```css
/// scroll-padding-block: auto;
/// scroll-padding-block: 10px;
/// scroll-padding-block: 1em 0.5em;
/// scroll-padding-block: 10%;
/// ```
public enum ScrollPaddingBlock: Property, LengthPercentageConvertible, CustomStringConvertible {
    public static let property: String = "scroll-padding-block"

    /// Keyword values
    case auto

    /// A single value for both the start and end block paddings
    case all(LengthPercentage)

    /// Two values for start and end block paddings
    case start_end(LengthPercentage, LengthPercentage)

    /// Global CSS value
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .auto:
            return "auto"
        case .all(let value):
            return value.description
        case .start_end(let start, let end):
            return "\(start.description) \(end.description)"
        case .global(let global):
            return global.description
        }
    }

    /// Creates a ScrollPaddingBlock using a length
    public static func px(_ value: Double) -> Self {
        .all(.length(.px(value)))
    }
    public static func lengthPercentage(_ value: LengthPercentage) -> ScrollPaddingBlock {
        .all(value)
    }
}
