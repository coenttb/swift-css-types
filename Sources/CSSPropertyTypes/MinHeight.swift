import Foundation
import CSSTypeTypes

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
public enum MinHeight: Property {
    public static let property: String = "min-height"
    
    /// A specific size value (length, percentage, or calculated value)
    case size(Size)
    
    /// A global CSS value
    case global(CSSTypeTypes.Global)
}

/// CSS Output conversion
extension MinHeight: CustomStringConvertible {
    /// Converts the min-height value to its CSS string representation
    public var description: String {
        switch self {
        case .size(let size):
            return size.description
        case .global(let global):
            return global.description
        }
    }
}


extension MinHeight: LengthConvertible {
    public static func length(_ length: CSSTypeTypes.Length) -> MinHeight {
        .size(.single(length))
    }
}
extension MinHeight {    
    /// Automatic sizing (often resolves to 0)
    public static let auto: MinHeight = .size(.auto)
    
    /// Size based on the content's preferred height
    public static let maxContent: MinHeight = .size(.maxContent)
    
    /// Size based on the content's minimum height
    public static let minContent: MinHeight = .size(.minContent)
    
    /// Size that uses available space up to the max-content size
    public static let fitContent: MinHeight = .size(.fitContent)
    
    /// Size to fit within the element while preserving aspect ratio
    public static let contain: MinHeight = .size(.contain)
    
    /// Size to cover the entire element while preserving aspect ratio
    public static let cover: MinHeight = .size(.cover)
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
