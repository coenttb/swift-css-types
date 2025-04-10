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
public enum MinWidth: Property, LengthPercentageConvertible {
    public static let property: String = "min-width"
    
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
extension MinWidth: CustomStringConvertible {
    /// Converts the min-width value to its CSS string representation
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
