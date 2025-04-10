import Foundation
import CSSTypeTypes

/// The CSS `text-size-adjust` property controls the text inflation algorithm used on some smartphones and tablets.
///
/// Mobile browsers often apply a text inflation algorithm to enlarge text to make it more readable.
/// This is especially important for websites not designed with small screens and international text in mind.
/// This property allows web authors to control this behavior.
///
/// - Note: This is an experimental property and is not supported by all browsers.
///         Additionally, different browsers may have different implementations of this property.
///
/// Example:
/// ```swift
/// .textSizeAdjust(.auto)                 // text-size-adjust: auto
/// .textSizeAdjust(.none)                 // text-size-adjust: none
/// .textSizeAdjust(.percentage(80))       // text-size-adjust: 80%
/// ```
///
/// - SeeAlso: [MDN Web Docs on text-size-adjust](https://developer.mozilla.org/en-US/docs/Web/CSS/text-size-adjust)
public enum TextSizeAdjust: Property {
    public static let property: String = "text-size-adjust"
    
    /// Enables the browser's inflation algorithm. This value is used to cancel a none value
    /// previously set with CSS.
    case auto
    
    /// Disables the browser's inflation algorithm.
    case none
    
    /// Enables the browser's inflation algorithm, specifying a percentage value
    /// with which to increase the font size.
    case percentage(Percentage)
    
    /// Global values
    case global(CSSTypeTypes.Global)
}

/// CSS Output conversion
extension TextSizeAdjust: CustomStringConvertible {
    /// Converts the text-size-adjust value to its CSS string representation
    public var description: String {
        switch self {
        case .auto:
            return "auto"
            
        case .none:
            return "none"
            
        case .percentage(let percentage):
            return percentage.description
            
        case .global(let global):
            return global.description
        }
    }
}
