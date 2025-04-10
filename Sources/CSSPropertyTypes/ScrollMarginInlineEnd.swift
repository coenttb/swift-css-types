//
// ScrollMarginInlineEnd.swift
//


import CSSTypeTypes

/// The `scroll-margin-inline-end` CSS property defines the margin of the scroll snap area at the end of the inline
/// dimension. This property is not interpolable according to CSS standards.
///
/// Scroll snap areas are the parts of an element that are visually closest to the scroll container's
/// snapport when the scroll position is manipulated.
///
/// ```css
/// scroll-margin-inline-end: 10px;
/// scroll-margin-inline-end: 1em;
/// scroll-margin-inline-end: 0;
/// ```
public enum ScrollMarginInlineEnd: Property, LengthConvertible, ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral, CustomStringConvertible {
    public static let property: String = "scroll-margin-inline-end"
    
    /// A length value for the inline end margin
    case length(Length)
    
    /// Global CSS value
    case global(CSSTypeTypes.Global)
    
    public var description: String {
        switch self {
        case .length(let length): return length.description
        case .global(let global): return global.description
        }
    }

    /// Creates a ScrollMarginInlineEnd using an integer literal (interpreted as pixels)
    public init(integerLiteral value: Int) {
        self = .length(.px(Double(value)))
    }
    
    /// Creates a ScrollMarginInlineEnd using a floating-point literal (interpreted as pixels)
    public init(floatLiteral value: Double) {
        self = .length(.px(value))
    }
}
