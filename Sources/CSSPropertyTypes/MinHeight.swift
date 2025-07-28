import CSSTypeTypes
import Foundation

/// The CSS `min-height` property sets the minimum height of an element. It prevents 
/// the used value of the height property from becoming smaller than the value specified for min-height.
///
/// Example:
/// ```swift
/// .minHeight(.px(150))       // min-height: 150px
/// .minHeight(.em(20))        // min-height: 20em
/// .minHeight(.percentage(75))   // min-height: 75%
/// .minHeight(.ch(40))        // min-height: 40ch
/// .minHeight(.auto)          // min-height: auto
/// .minHeight(.maxContent)    // min-height: max-content
/// ```
///
/// - Note: The element's height is set to the value of min-height whenever min-height is larger 
///         than max-height or height.
///
/// - SeeAlso: [MDN Web Docs on min-height](https://developer.mozilla.org/en-US/docs/Web/CSS/min-height)
public enum MinHeight: Property, LengthPercentageConvertible {
    public static let property: String = "min-height"

    case lengthPercentage(LengthPercentage)

    case auto

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
extension MinHeight: CustomStringConvertible {
    /// Converts the min-height value to its CSS string representation
    public var description: String {
        switch self {
        case .lengthPercentage(let lengthPercentage):
            lengthPercentage.description
        case .auto:
            "auto"
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
extension MinHeight: ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {
    /// Creates a min-height with a pixel value from an integer literal
    ///
    /// - Parameter value: The pixel value as an integer
    public init(integerLiteral value: Int) {
        self = .px(Double(value))
    }

    /// Creates a min-height with a pixel value from a floating-point literal
    ///
    /// - Parameter value: The pixel value as a double
    public init(floatLiteral value: Double) {
        self = .px(value)
    }
}
