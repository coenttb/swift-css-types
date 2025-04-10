import Foundation
import CSSTypeTypes

/// The CSS `font-size-adjust` property provides a way to modify the size of lowercase letters
/// relative to the size of uppercase letters, which defines the overall font-size. 
/// This property is useful for situations where font fallback can occur.
///
/// Example:
/// ```swift
/// .fontSizeAdjust(.none)                    // font-size-adjust: none
/// .fontSizeAdjust(.value(0.5))              // font-size-adjust: 0.5
/// .fontSizeAdjust(.fromFont)                // font-size-adjust: from-font
/// .fontSizeAdjust(.metric(.exHeight, 0.5))  // font-size-adjust: ex-height 0.5
/// .fontSizeAdjust(.global(.inherit))        // font-size-adjust: inherit
/// ```
///
/// - SeeAlso: [MDN Web Docs on font-size-adjust](https://developer.mozilla.org/en-US/docs/Web/CSS/font-size-adjust)
public enum FontSizeAdjust: Property {
    public static let property: String = "font-size-adjust"
    
    /// No adjustment is applied to the font-size value for the fallback font.
    case none
    
    /// Adjusts the font size used. 
    /// The number value adjusts the font size of the fallback font so that its x-height is the 
    /// specified multiple of the font size.
    case value(Double)
    
    /// Uses the number value for the specified font metric from the first available font.
    case fromFont
    
    /// Adjusts the font size used with a specific font metric.
    case metric(Metric, ValueOrFromFont)
    
    /// Global values
    case global(CSSTypeTypes.Global)
    
    /// Font metrics that can be used for font-size-adjust
    public enum Metric: String, Sendable, CustomStringConvertible {
        /// Uses the ratio of x-height (height of lowercase "x" in a font) to font size (aspect value)
        /// to adjust the fallback font size.
        case exHeight = "ex-height"
        
        /// Uses the ratio of cap-height (height of uppercase letters) to font size
        /// to adjust fallback font size.
        case capHeight = "cap-height"
        
        /// Uses the ratio of the advance width of the character "0" (ZERO, U+0030) to font size.
        case chWidth = "ch-width"
        
        /// Uses the ratio of the advance width of the character "水" (CJK water ideograph, U+6C34) to font size.
        case icWidth = "ic-width"
        
        /// Uses the ratio of the advance height of the character "水" (CJK water ideograph, U+6C34) to font size.
        case icHeight = "ic-height"
        
        public var description: String {
            return rawValue
        }
    }
    
    /// Represents either a numeric value or the from-font keyword
    public enum ValueOrFromFont: Sendable, Equatable, CustomStringConvertible {
        /// A numeric value
        case value(Double)
        
        /// The from-font keyword
        case fromFont
        
        public var description: String {
            switch self {
            case .value(let number):
                return String(number)
            case .fromFont:
                return "from-font"
            }
        }
    }
    
    public var description: String {
        switch self {
        case .none:
            return "none"
        case .value(let number):
            return String(number)
        case .fromFont:
            return "from-font"
        case .metric(let metric, let value):
            return "\(metric.description) \(value.description)"
        case .global(let value):
            return value.description
        }
    }
}
