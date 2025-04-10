import Foundation
import CSSTypeTypes

/// The CSS `min-width` property sets the minimum width of an element. It prevents 
/// the used value of the width property from becoming smaller than the value specified for min-width.
///
/// Example:
/// ```swift
/// .minWidth(.px(150))       // min-width: 150px
/// .minWidth(.em(20))        // min-width: 20em
/// .minWidth(.percentage(75))   // min-width: 75%
/// .minWidth(.ch(40))        // min-width: 40ch
/// .minWidth(.auto)          // min-width: auto
/// .minWidth(.maxContent)    // min-width: max-content
/// ```
///
/// - Note: The element's width is set to the value of min-width whenever min-width is larger 
///         than max-width or width.
///
/// - SeeAlso: [MDN Web Docs on min-width](https://developer.mozilla.org/en-US/docs/Web/CSS/min-width)
public enum MinWidth: Property {
    public static let property: String = "min-width"
    
    /// A specific size value (length, percentage, or calculated value)
    case size(Size)
    
    /// A global CSS value
    case global(CSSTypeTypes.Global)
}

/// CSS Output conversion
extension MinWidth: CustomStringConvertible {
    /// Converts the min-width value to its CSS string representation
    public var description: String {
        switch self {
        case .size(let size):
            return size.description
        case .global(let global):
            return global.description
        }
    }
}


extension MinWidth: LengthConvertible {
    public static func length(_ length: CSSTypeTypes.Length) -> MinWidth {
        .size(.single(length))
    }
}
extension MinWidth {    
    /// Automatic sizing (often resolves to 0)
    public static let auto: MinWidth = .size(.auto)
    
    /// Size based on the content's preferred width
    public static let maxContent: MinWidth = .size(.maxContent)
    
    /// Size based on the content's minimum width
    public static let minContent: MinWidth = .size(.minContent)
    
    /// Size that uses available space up to the max-content size
    public static let fitContent: MinWidth = .size(.fitContent)
    
    /// Size to fit within the element while preserving aspect ratio
    public static let contain: MinWidth = .size(.contain)
    
    /// Size to cover the entire element while preserving aspect ratio
    public static let cover: MinWidth = .size(.cover)
}

/// Allow for numeric literals to be used directly
extension MinWidth: ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {
    /// Creates a min-width with a pixel value from an integer literal
    ///
    /// - Parameter value: The pixel value as an integer
    public init(integerLiteral value: Int) {
        self = .px(Double(value))
    }
    
    /// Creates a min-width with a pixel value from a floating-point literal
    ///
    /// - Parameter value: The pixel value as a double
    public init(floatLiteral value: Double) {
        self = .px(value)
    }
}
