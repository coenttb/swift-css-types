import CSSTypeTypes
import Foundation

/// The CSS `margin-inline` shorthand property defines both the logical inline start and end margins
/// of an element, which maps to physical margins depending on the element's writing mode,
/// directionality, and text orientation.
///
/// This property is essential for proper internationalization as it adapts to different writing systems:
/// - In `horizontal-tb` with `ltr` direction, it maps to `margin-left` and `margin-right`
/// - In `horizontal-tb` with `rtl` direction, it maps to `margin-right` and `margin-left` (reversed)
/// - In `vertical-rl`, it maps to `margin-top` and `margin-bottom`
/// - In `vertical-lr`, it maps to `margin-top` and `margin-bottom`
///
/// Example:
/// ```swift
/// .marginInline(.px(10))                      // margin-inline: 10px
/// .marginInline(.auto)                        // margin-inline: auto
/// .marginInline(.px(20), .px(40))             // margin-inline: 20px 40px
/// .marginInline(.percentage(5), .em(2))       // margin-inline: 5% 2em
/// ```
///
/// - SeeAlso: [MDN Web Docs on margin-inline](https://developer.mozilla.org/en-US/docs/Web/CSS/margin-inline)
public enum MarginInline: Property {
    public static let property: String = "margin-inline"
    /// Single value for both inline-start and inline-end margins
    case single(Margin)

    /// Different values for inline-start and inline-end margins
    case double(Margin, Margin)

    /// Global values
    case global(CSSTypeTypes.Global)

}

extension MarginInline {

    /// Factory method for auto margins (centers the element in its container if used with both sides)
    public static var auto: MarginInline {
        .single(.auto)
    }

    /// Factory method for percentage values with different start and end
    public static func percentage(_ start: Percentage, _ end: Percentage) -> MarginInline {
        .double(.percentage(start), .percentage(end))
    }
}

extension MarginInline: LengthConvertible {
    public static func length(_ length: CSSTypeTypes.Length) -> MarginInline {
        .single(.length(length))
    }
}

extension MarginInline: PercentageConvertible {
    public static func percentage(_ length: CSSTypeTypes.Percentage) -> MarginInline {
        .single(.percentage(length))
    }
}

/// CSS Output conversion
extension MarginInline: CustomStringConvertible {
    /// Converts the margin-inline value to its CSS string representation
    public var description: String {
        switch self {
        case .single(let margin):
            return margin.description

        case .double(let start, let end):
            return "\(start) \(end)"

        case .global(let global):
            return global.description
        }
    }
}
