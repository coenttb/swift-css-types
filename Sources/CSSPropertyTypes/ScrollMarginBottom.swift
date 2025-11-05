//
// ScrollMarginBottom.swift

import CSSTypeTypes

/// The `scroll-margin-bottom` CSS property defines the bottom margin of the scroll snap area that is used
/// for snapping this element to the snapport. This property is not interpolable according to CSS standards.
///
/// Scroll snap areas are the parts of an element that are visually closest to the scroll container's
/// snapport when the scroll position is manipulated.
///
/// ```css
/// scroll-margin-bottom: 10px;
/// scroll-margin-bottom: 1em;
/// scroll-margin-bottom: 0;
/// ```
public enum ScrollMarginBottom: Property, LengthConvertible, ExpressibleByIntegerLiteral,
    ExpressibleByFloatLiteral, CustomStringConvertible
{
    public static let property: String = "scroll-margin-bottom"

    /// A length value for the bottom margin
    case length(Length)

    /// Global CSS value
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .length(let length): return length.description
        case .global(let global): return global.description
        }
    }

    /// Creates a ScrollMarginBottom using an integer literal (interpreted as pixels)
    public init(integerLiteral value: Int) {
        self = .length(.px(Double(value)))
    }

    /// Creates a ScrollMarginBottom using a floating-point literal (interpreted as pixels)
    public init(floatLiteral value: Double) {
        self = .length(.px(value))
    }
}
