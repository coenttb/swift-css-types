//
// ScrollMarginBlockStart.swift

import CSSTypeTypes

/// The `scroll-margin-block-start` CSS property defines the margin of the scroll snap area at the start of the block
/// dimension. This property is not interpolable according to CSS standards.
///
/// Scroll snap areas are the parts of an element that are visually closest to the scroll container's
/// snapport when the scroll position is manipulated.
///
/// ```css
/// scroll-margin-block-start: 10px;
/// scroll-margin-block-start: 1em;
/// scroll-margin-block-start: 0;
/// ```
public enum ScrollMarginBlockStart: Property, LengthConvertible, ExpressibleByIntegerLiteral,
    ExpressibleByFloatLiteral, CustomStringConvertible
{
    public static let property: String = "scroll-margin-block-start"
    /// A length value for the block start margin
    case length(Length)

    /// Global CSS value
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .length(let length): return length.description
        case .global(let global): return global.description
        }
    }

    /// Creates a ScrollMarginBlockStart using an integer literal (interpreted as pixels)
    public init(integerLiteral value: Int) {
        self = .length(.px(Double(value)))
    }

    /// Creates a ScrollMarginBlockStart using a floating-point literal (interpreted as pixels)
    public init(floatLiteral value: Double) {
        self = .length(.px(value))
    }
}
