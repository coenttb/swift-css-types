import Foundation
import CSSTypeTypes

/// The CSS `max-inline-size` property defines the maximum size of an element in the inline direction.
/// When writing mode is horizontal, this refers to the element's maximum width. When writing mode
/// is vertical, this refers to the element's maximum height.
///
/// Example:
/// ```swift
/// .maxInlineSize(.px(150))            // max-inline-size: 150px
/// .maxInlineSize(.em(20))             // max-inline-size: 20em
/// .maxInlineSize(.percentage(75))     // max-inline-size: 75%
/// .maxInlineSize(.none)               // max-inline-size: none
/// .maxInlineSize(.maxContent)         // max-inline-size: max-content
/// ```
///
/// - Note: This is a logical property that adapts to the writing mode of the document.
///
/// - SeeAlso: [MDN Web Docs on max-inline-size](https://developer.mozilla.org/en-US/docs/Web/CSS/max-inline-size)
public enum MaxInlineSize: Property {
    public static let property: String = "max-inline-size"
    
    /// A specific size value (length, percentage, or calculated value)
    case size(Size)
    
    /// No maximum inline-size constraint
    case none
    
    /// A global CSS value
    case global(CSSTypeTypes.Global)
}

/// CSS Output conversion
extension MaxInlineSize: CustomStringConvertible {
    /// Converts the max-inline-size value to its CSS string representation
    public var description: String {
        switch self {
        case .size(let size):
            return size.description
        case .none:
            return "none"
        case .global(let global):
            return global.description
        }
    }
}

extension MaxInlineSize: LengthConvertible {
    public static func length(_ length: CSSTypeTypes.Length) -> MaxInlineSize {
        .size(.single(length))
    }
}

extension MaxInlineSize {    
    /// Size based on the content's preferred size
    public static let maxContent: MaxInlineSize = .size(.maxContent)
    
    /// Size based on the content's minimum size
    public static let minContent: MaxInlineSize = .size(.minContent)
    
    /// Size that uses available space up to the max-content size
    public static let fitContent: MaxInlineSize = .size(.fitContent)
    
    /// Size to fit within the element while preserving aspect ratio
    public static let contain: MaxInlineSize = .size(.contain)
    
    /// Size to cover the entire element while preserving aspect ratio
    public static let cover: MaxInlineSize = .size(.cover)
}

/// Allow for numeric literals to be used directly
extension MaxInlineSize: ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {
    /// Creates a max-inline-size with a pixel value from an integer literal
    ///
    /// - Parameter value: The pixel value as an integer
    public init(integerLiteral value: Int) {
        self = .px(Double(value))
    }
    
    /// Creates a max-inline-size with a pixel value from a floating-point literal
    ///
    /// - Parameter value: The pixel value as a double
    public init(floatLiteral value: Double) {
        self = .px(value)
    }
}
