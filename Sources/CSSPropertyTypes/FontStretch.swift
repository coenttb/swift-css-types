import Foundation
import CSSTypeTypes

/// The CSS `font-stretch` property selects a normal, condensed, or expanded face from a font.
///
/// This property allows you to make text appear narrower or wider depending on the selected
/// font face. It can be specified using keywords or percentage values.
///
/// Example:
/// ```swift
/// .fontStretch(.normal)             // font-stretch: normal
/// .fontStretch(.condensed)          // font-stretch: condensed
/// .fontStretch(.expanded)           // font-stretch: expanded
/// .fontStretch(.percentage(120))    // font-stretch: 120%
/// .fontStretch(.global(.inherit))   // font-stretch: inherit
/// ```
///
/// - SeeAlso: [MDN Web Docs on font-stretch](https://developer.mozilla.org/en-US/docs/Web/CSS/font-stretch)
public enum FontStretch: Property, PercentageConvertible {
    
    public static let property: String = "font-stretch"
    
    /// Keyword value for font stretch
    case keyword(Keyword)
    
    /// Percentage value for font stretch (between 50% and 200%)
    case percentage(Percentage)
    
    /// Global values
    case global(CSSTypeTypes.Global)
    
    /// Font stretch keyword values
    public enum Keyword: String, Sendable, Hashable {
        /// Ultra-condensed font (50% of normal width)
        case ultraCondensed = "ultra-condensed"
        
        /// Extra-condensed font (62.5% of normal width)
        case extraCondensed = "extra-condensed"
        
        /// Condensed font (75% of normal width)
        case condensed
        
        /// Semi-condensed font (87.5% of normal width)
        case semiCondensed = "semi-condensed"
        
        /// Normal font width (100%)
        case normal
        
        /// Semi-expanded font (112.5% of normal width)
        case semiExpanded = "semi-expanded"
        
        /// Expanded font (125% of normal width)
        case expanded
        
        /// Extra-expanded font (150% of normal width)
        case extraExpanded = "extra-expanded"
        
        /// Ultra-expanded font (200% of normal width)
        case ultraExpanded = "ultra-expanded"
        
        /// Returns the equivalent percentage value for the keyword
        public var percentage: Percentage {
            switch self {
            case .ultraCondensed: return 50
            case .extraCondensed: return 62.5
            case .condensed: return 75
            case .semiCondensed: return 87.5
            case .normal: return 100
            case .semiExpanded: return 112.5
            case .expanded: return 125
            case .extraExpanded: return 150
            case .ultraExpanded: return 200
            }
        }
    }
    
    // MARK: - Convenience static properties for keyword values
    
    public static let ultraCondensed: FontStretch = .keyword(.ultraCondensed)
    public static let extraCondensed: FontStretch = .keyword(.extraCondensed)
    public static let condensed: FontStretch = .keyword(.condensed)
    public static let semiCondensed: FontStretch = .keyword(.semiCondensed)
    public static let normal: FontStretch = .keyword(.normal)
    public static let semiExpanded: FontStretch = .keyword(.semiExpanded)
    public static let expanded: FontStretch = .keyword(.expanded)
    public static let extraExpanded: FontStretch = .keyword(.extraExpanded)
    public static let ultraExpanded: FontStretch = .keyword(.ultraExpanded)
    
    public var description: String {
        switch self {
        case .keyword(let keyword):
            return keyword.rawValue
        case .percentage(let percentage):
            // Clamp percentage percentage between 50% and 200% as per spec
            return max(50, min(200, percentage)).description
            
        case .global(let value):
            return value.description
        }
    }
}
