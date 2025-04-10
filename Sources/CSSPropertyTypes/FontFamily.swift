import Foundation
import CSSTypeTypes

/// The CSS `font-family` property specifies a prioritized list of font family names and/or generic family names.
///
/// It allows multiple font family names to be specified as a fallback system, ensuring
/// the browser can select an available font from the list.
///
/// Example:
/// ```swift
/// .fontFamily([.specific("Helvetica"), .specific("Arial"), .generic(.sansSerif)])  // font-family: Helvetica, Arial, sans-serif
/// .fontFamily([.generic(.monospace)])                                              // font-family: monospace
/// .fontFamily([.specific("Comic Sans MS"), .generic(.cursive)])                    // font-family: "Comic Sans MS", cursive
/// .fontFamily(.global(.inherit))                                                   // font-family: inherit
/// ```
///
/// - SeeAlso: [MDN Web Docs on font-family](https://developer.mozilla.org/en-US/docs/Web/CSS/font-family)
public enum FontFamily: Property {
    public static let property: String = "font-family"
    
    /// A list of font families, both specific and generic
    case families([Family])
    
    /// A single family
    case family(Family)
    
    /// Global values
    case global(CSSTypeTypes.Global)
    
    /// Represents a font family either specific or generic
    public enum Family: Sendable, Equatable, CustomStringConvertible {
        /// A specifically named font family
        case specific(String)
        
        /// A generic font family
        case generic(GenericFamily)
        
        /// Multiple font families with fallbacks
        case multiple([Family])
        
        /// String representation of the family with proper escaping
        public var description: String {
            switch self {
            case .specific(let name):
                // If name contains spaces or special characters, wrap in quotes
                if name.contains(" ") || name.contains("-") || name.contains(".") {
                    return "\"\(name)\""
                }
                return name
            case .generic(let family):
                return family.description
            case .multiple(let families):
                return families.map { $0.description }.joined(separator: ", ")
            }
        }
    }
    
    // MARK: - Convenience initializers
    
    /// Create a font family list from specific names
    public static func specific(_ names: String...) -> FontFamily {
        .families(names.map { Family.specific($0) })
    }
    
    /// Create a font family with a specific generic family
    public static func generic(_ family: GenericFamily) -> FontFamily {
        .family(.generic(family))
    }
    
    /// Create a font family list ending with a generic family
    public static func withFallback(_ specificNames: [String], fallback: GenericFamily) -> FontFamily {
        var families = specificNames.map { Family.specific($0) }
        families.append(.generic(fallback))
        return .families(families)
    }
    
    // MARK: - Convenience properties for common generic families
    
    public static let serif: FontFamily = .generic(.serif)
    public static let sansSerif: FontFamily = .generic(.sansSerif)
    public static let monospace: FontFamily = .generic(.monospace)
    public static let cursive: FontFamily = .generic(.cursive)
    public static let fantasy: FontFamily = .generic(.fantasy)
    public static let systemUi: FontFamily = .generic(.systemUi)
    
    public var description: String {
        switch self {
        case .families(let families):
            return families.map { $0.description }.joined(separator: ", ")
        case .family(let family):
            return family.description
        case .global(let value):
            return value.description
        }
    }
}
