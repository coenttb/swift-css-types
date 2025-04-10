//
// ScrollMarginInline.swift
//


import CSSTypeTypes

/// The `scroll-margin-inline` CSS property is a shorthand property for setting the scroll-margin in the inline
/// dimension. This property is not interpolable according to CSS standards.
///
/// Scroll snap areas are the parts of an element that are visually closest to the scroll container's
/// snapport when the scroll position is manipulated.
///
/// ```css
/// scroll-margin-inline: 10px;
/// scroll-margin-inline: 1em 2em;
/// scroll-margin-inline: 0;
/// ```
public enum ScrollMarginInline: Property, LengthConvertible, ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral, CustomStringConvertible {
    public static let property: String = "scroll-margin-inline"
    
    /// A single length value for both the start and end inlines
    case all(Length)
    
    /// Two length values for start and end inline margins
    case start_end(Length, Length)
    
    /// Global CSS value
    case global(CSSTypeTypes.Global)
    
    public var description: String {
        switch self {
        case .all(let length):
            return length.description
        case .start_end(let start, let end):
            return "\(start.description) \(end.description)"
        case .global(let global):
            return global.description
        }
    }
    
    /// Creates a ScrollMarginInline from a length value
    public static func length(_ length: Length) -> Self {
        .all(length)
    }
    
    /// Creates a ScrollMarginInline using an integer literal (interpreted as pixels)
    public init(integerLiteral value: Int) {
        self = .all(.px(Double(value)))
    }
    
    /// Creates a ScrollMarginInline using a floating-point literal (interpreted as pixels)
    public init(floatLiteral value: Double) {
        self = .all(.px(value))
    }
}
