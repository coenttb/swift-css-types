import CSSTypeTypes
import Foundation

/// The CSS `flex-basis` property sets the initial main size of a flex item.
///
/// It specifies the initial size of a flex item before the remaining space is distributed
/// according to the flex factors (flex-grow and flex-shrink).
///
/// Example:
/// ```swift
/// .flexBasis(.auto)               // flex-basis: auto
/// .flexBasis(.px(200))            // flex-basis: 200px
/// .flexBasis(.percentage(50))     // flex-basis: 50%
/// .flexBasis(.content)            // flex-basis: content
/// .flexBasis(.global(.inherit))   // flex-basis: inherit
/// ```
///
/// - SeeAlso: [MDN Web Docs on flex-basis](https://developer.mozilla.org/en-US/docs/Web/CSS/flex-basis)
public enum FlexBasis: Property, LengthPercentageConvertible, ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {
    public static let property: String = "flex-basis"
    /// Default value. The item's base size is determined by its width/height properties or by its content.
    case auto

    /// Use automatic sizing based on the content size
    case content

    /// Use the minimum content size
    case minContent

    /// Use the maximum content size
    case maxContent

    /// Use the fit-content algorithm
    case fitContent

    /// A length or percentage value measured from the beginning of the timeline
    case lengthPercentage(LengthPercentage)

    /// Global values
    case global(CSSTypeTypes.Global)

    // MARK: - Initializers for literal expressions

    /// Create a flex-basis using an integer literal (converted to pixels)
    public init(integerLiteral value: Int) {
        self = .length(.px(Double(value)))
    }

    /// Create a flex-basis using a float literal (converted to pixels)
    public init(floatLiteral value: Double) {
        self = .length(.px(value))
    }

    public var description: String {
        switch self {
        case .auto:
            return "auto"
        case .content:
            return "content"
        case .minContent:
            return "min-content"
        case .maxContent:
            return "max-content"
        case .fitContent:
            return "fit-content"
        case .lengthPercentage(let lengthPercentage):
            return lengthPercentage.description
        case .global(let value):
            return value.description
        }
    }
}
