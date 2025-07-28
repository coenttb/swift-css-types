import CSSTypeTypes
import Foundation

/// The CSS `outline-width` property sets the thickness of an element's outline.
///
/// An outline is a line that is drawn around an element, outside the border.
/// The width can be specified using predefined keywords or length values.
///
/// Example:
/// ```swift
/// .outlineWidth(.thin)     // outline-width: thin
/// .outlineWidth(.medium)   // outline-width: medium
/// .outlineWidth(.thick)    // outline-width: thick
/// .outlineWidth(.px(5))    // outline-width: 5px
/// ```
///
/// - SeeAlso: [MDN Web Docs on outline-width](https://developer.mozilla.org/en-US/docs/Web/CSS/outline-width)
public enum OutlineWidth: Property, LengthConvertible {
    public static let property: String = "outline-width"

    /// A specific length value
    case length(Length)

    /// Thin outline (typically 1px)
    case thin

    /// Medium outline (typically 3px)
    case medium

    /// Thick outline (typically 5px)
    case thick

    /// Global value
    case global(CSSTypeTypes.Global)
}

/// CSS Output conversion
extension OutlineWidth: CustomStringConvertible {
    /// Converts the outline-width value to its CSS string representation
    public var description: String {
        switch self {
        case .length(let length):
            return length.description
        case .thin:
            return "thin"
        case .medium:
            return "medium"
        case .thick:
            return "thick"
        case .global(let global):
            return global.description
        }
    }
}

/// Allow for numeric literals to be used directly
extension OutlineWidth: ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {
    /// Creates an outline-width with a pixel value from an integer literal
    ///
    /// - Parameter value: The pixel value as an integer
    public init(integerLiteral value: Int) {
        self = .px(Double(value))
    }

    /// Creates an outline-width with a pixel value from a floating-point literal
    ///
    /// - Parameter value: The pixel value as a double
    public init(floatLiteral value: Double) {
        self = .px(value)
    }
}
