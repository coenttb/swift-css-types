import Foundation
import CSSTypeTypes

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
public enum MaxWidth: Property {
    public static let property: String = "max-width"
    
    /// A specific size value (length, percentage, or calculated value)
    case size(Size)
    
    /// No maximum width constraint
    case none
    
    /// A global CSS value
    case global(CSSTypeTypes.Global)
}

/// CSS Output conversion
extension MaxWidth: CustomStringConvertible {
    /// Converts the max-width value to its CSS string representation
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


extension MaxWidth: LengthConvertible {
    public static func length(_ length: CSSTypeTypes.Length) -> MaxWidth {
        .size(.single(length))
    }
}
extension MaxWidth {    
    /// Size based on the content's preferred width
    public static let maxContent: MaxWidth = .size(.maxContent)
    
    /// Size based on the content's minimum width
    public static let minContent: MaxWidth = .size(.minContent)
    
    /// Size that uses available space up to the max-content size
    public static let fitContent: MaxWidth = .size(.fitContent)
    
    /// Size to fit within the element while preserving aspect ratio
    public static let contain: MaxWidth = .size(.contain)
    
    /// Size to cover the entire element while preserving aspect ratio
    public static let cover: MaxWidth = .size(.cover)
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
