import Foundation
import CSSTypeTypes

/// The CSS `font-size` property sets the size of the font.
///
/// Changing the font size also updates the sizes of relative length units like em and rem.
/// Font size can be specified with absolute keywords, relative keywords, lengths, or percentages.
///
/// Example:
/// ```swift
/// .fontSize(.medium)             // font-size: medium
/// .fontSize(.larger)             // font-size: larger
/// .fontSize(.px(16))             // font-size: 16px
/// .fontSize(.percentage(120))    // font-size: 120%
/// .fontSize(.global(.inherit))   // font-size: inherit
/// ```
///
/// - SeeAlso: [MDN Web Docs on font-size](https://developer.mozilla.org/en-US/docs/Web/CSS/font-size)
public enum FontSize: Property, LengthPercentageConvertible {
    public static let property: String = "font-size"
    
    /// Absolute size keyword
    case absoluteSize(AbsoluteSize)
    
    /// Relative size keyword
    case relativeSize(RelativeSize)
    
    case lengthPercentage(LengthPercentage)
    
    /// Math keyword for math-related elements
    case math
    
    /// Global values
    case global(CSSTypeTypes.Global)
    
    // MARK: - Convenience properties
    
    // Absolute sizes
    public static let xxSmall: FontSize = .absoluteSize(.xxSmall)
    public static let xSmall: FontSize = .absoluteSize(.xSmall)
    public static let small: FontSize = .absoluteSize(.small)
    public static let medium: FontSize = .absoluteSize(.medium)
    public static let large: FontSize = .absoluteSize(.large)
    public static let xLarge: FontSize = .absoluteSize(.xLarge)
    public static let xxLarge: FontSize = .absoluteSize(.xxLarge)
    public static let xxxLarge: FontSize = .absoluteSize(.xxxLarge)
    
    // Relative sizes
    public static let smaller: FontSize = .relativeSize(.smaller)
    public static let larger: FontSize = .relativeSize(.larger)
    
    public var description: String {
        switch self {
        case .absoluteSize(let size):
            return size.description
        case .relativeSize(let size):
            return size.description
        case .lengthPercentage(let lengthPercentage):
            return lengthPercentage.description
        case .math:
            return "math"
        case .global(let value):
            return value.description
        }
    }
}
