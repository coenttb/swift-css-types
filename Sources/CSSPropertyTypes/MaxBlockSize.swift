import Foundation
import CSSTypeTypes

/// The CSS `max-block-size` property defines the maximum size of an element in the block direction.
/// When writing mode is horizontal, this refers to the element's maximum height. When writing mode
/// is vertical, this refers to the element's maximum width.
///
/// Example:
/// ```swift
/// .maxBlockSize(.px(150))            // max-block-size: 150px
/// .maxBlockSize(.em(20))             // max-block-size: 20em
/// .maxBlockSize(.percentage(75))     // max-block-size: 75%
/// .maxBlockSize(.none)               // max-block-size: none
/// .maxBlockSize(.maxContent)         // max-block-size: max-content
/// ```
///
/// - Note: This is a logical property that adapts to the writing mode of the document.
///
/// - SeeAlso: [MDN Web Docs on max-block-size](https://developer.mozilla.org/en-US/docs/Web/CSS/max-block-size)
public enum MaxBlockSize: Property {
    public static let property: String = "max-block-size"
    
    /// A specific size value (length, percentage, or calculated value)
    case size(Size)
    
    /// No maximum block-size constraint
    case none
    
    /// A global CSS value
    case global(CSSTypeTypes.Global)
}

/// CSS Output conversion
extension MaxBlockSize: CustomStringConvertible {
    /// Converts the max-block-size value to its CSS string representation
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

extension MaxBlockSize: LengthConvertible {
    public static func length(_ length: CSSTypeTypes.Length) -> MaxBlockSize {
        .size(.single(length))
    }
}

extension MaxBlockSize {    
    /// Size based on the content's preferred size
    public static let maxContent: MaxBlockSize = .size(.maxContent)
    
    /// Size based on the content's minimum size
    public static let minContent: MaxBlockSize = .size(.minContent)
    
    /// Size that uses available space up to the max-content size
    public static let fitContent: MaxBlockSize = .size(.fitContent)
    
    /// Size to fit within the element while preserving aspect ratio
    public static let contain: MaxBlockSize = .size(.contain)
    
    /// Size to cover the entire element while preserving aspect ratio
    public static let cover: MaxBlockSize = .size(.cover)
}

/// Allow for numeric literals to be used directly
extension MaxBlockSize: ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {
    /// Creates a max-block-size with a pixel value from an integer literal
    ///
    /// - Parameter value: The pixel value as an integer
    public init(integerLiteral value: Int) {
        self = .px(Double(value))
    }
    
    /// Creates a max-block-size with a pixel value from a floating-point literal
    ///
    /// - Parameter value: The pixel value as a double
    public init(floatLiteral value: Double) {
        self = .px(value)
    }
}
