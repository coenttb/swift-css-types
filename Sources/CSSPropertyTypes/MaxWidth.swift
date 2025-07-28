import CSSTypeTypes
import Foundation

/// The CSS `max-width` property sets the maximum width of an element. It prevents 
/// the used value of the width property from becoming larger than the value specified for max-width.
///
/// Example:
/// ```swift
/// .maxWidth(.px(150))       // max-width: 150px
/// .maxWidth(.em(20))        // max-width: 20em
/// .maxWidth(.percentage(75))   // max-width: 75%
/// .maxWidth(.ch(40))        // max-width: 40ch
/// .maxWidth(.none)          // max-width: none
/// .maxWidth(.maxContent)    // max-width: max-content
/// ```
///
/// - Note: The element's width is set to the value of max-width whenever max-width is smaller
///         than width (but larger than min-width).
///
/// - SeeAlso: [MDN Web Docs on max-width](https://developer.mozilla.org/en-US/docs/Web/CSS/max-width)
public enum MaxWidth: Property, LengthPercentageConvertible {
    public static let property: String = "max-width"

    case lengthPercentage(LengthPercentage)

    /// No maximum width constraint
    case none

    case maxContent

    case minContent

    case fitContent(LengthPercentage? = nil)

    case stretch

    /// A global CSS value
    case global(CSSTypeTypes.Global)

    public static let fitContent: Self = .fitContent(nil)
}

/// CSS Output conversion
extension MaxWidth: CustomStringConvertible {
    /// Converts the max-width value to its CSS string representation
    public var description: String {
        switch self {
        case .lengthPercentage(let lengthPercentage):
            lengthPercentage.description
        case .none:
            "none"
        case .maxContent:
            "max-content"
        case .minContent:
            "min-content"
        case .fitContent(let lengthPercentage):
            if let description = lengthPercentage?.description {
                "fit-content(\(description)"
            } else {
                "fit-content"
            }
        case .stretch:
            "stretch"
        case .global(let global):
            global.description
        }
    }
}

/// Allow for numeric literals to be used directly
extension MaxWidth: ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {
    /// Creates a max-width with a pixel value from an integer literal
    ///
    /// - Parameter value: The pixel value as an integer
    public init(integerLiteral value: Int) {
        self = .px(Double(value))
    }

    /// Creates a max-width with a pixel value from a floating-point literal
    ///
    /// - Parameter value: The pixel value as a double
    public init(floatLiteral value: Double) {
        self = .px(value)
    }
}
