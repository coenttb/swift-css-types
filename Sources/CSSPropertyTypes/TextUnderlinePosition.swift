import Foundation
import CSSTypeTypes

/// The CSS `text-underline-position` property specifies the position of the underline which is set using
/// the text-decoration property's underline value.
///
/// This property is particularly useful for ensuring legibility with chemical and mathematical
/// formulas, which make a large use of subscripts, and for ensuring proper rendering of
/// underlines in different writing systems.
///
/// Example:
/// ```swift
/// .textUnderlinePosition(.auto)              // text-underline-position: auto
/// .textUnderlinePosition(.under)             // text-underline-position: under
/// .textUnderlinePosition(.fromFont)          // text-underline-position: from-font
/// .textUnderlinePosition(.left)              // text-underline-position: left
/// .textUnderlinePosition(.right)             // text-underline-position: right
/// .textUnderlinePosition([.under, .left])    // text-underline-position: under left
/// ```
///
/// - SeeAlso: [MDN Web Docs on text-underline-position](https://developer.mozilla.org/en-US/docs/Web/CSS/text-underline-position)
public enum TextUnderlinePosition: Property {
    public static let property: String = "text-underline-position"
    
    /// The user agent uses its own algorithm to place the line at or under the alphabetic baseline.
    case auto
    
    /// If the font file includes information about a preferred position, use that value.
    /// If the font file doesn't include this information, behave as if auto was set,
    /// with the browser choosing an appropriate position.
    case fromFont
    
    /// Forces the line to be set below the alphabetic baseline, at a position where it
    /// won't cross any descenders. This is useful for ensuring legibility with chemical
    /// and mathematical formulas, which make a large use of subscripts.
    case under
    
    /// In vertical writing-modes, this keyword forces the line to be placed on the left
    /// side of the text. In horizontal writing-modes, it is a synonym of auto.
    case left
    
    /// In vertical writing-modes, this keyword forces the line to be placed on the right
    /// side of the text. In horizontal writing-modes, it is a synonym of auto.
    case right
    
    /// Allows combining the `under` value with either `left` or `right`.
    case combined(Set<TextUnderlinePositionValue>)
    
    /// Global values
    case global(CSSTypeTypes.Global)
    
    /// Initialize with a set of TextUnderlinePositionValue values
    public init(_ values: Set<TextUnderlinePositionValue>) {
        if values.isEmpty {
            self = .auto
            return
        }
        
        if values.count == 1, let value = values.first {
            switch value {
            case .auto:
                self = .auto
            case .fromFont:
                self = .fromFont
            case .under:
                self = .under
            case .left:
                self = .left
            case .right:
                self = .right
            }
            return
        }
        
        self = .combined(values)
    }
    
    /// Initialize with an array of TextUnderlinePositionValue values
    public init(_ values: [TextUnderlinePositionValue]) {
        self.init(Set(values))
    }
    
    /// Initialize with multiple TextUnderlinePositionValue values
    public init(_ values: TextUnderlinePositionValue...) {
        self.init(values)
    }
}

/// The possible individual values for text-underline-position
public enum TextUnderlinePositionValue: Hashable, Sendable, Equatable, CustomStringConvertible {
    /// The user agent uses its own algorithm to place the line at or under the alphabetic baseline.
    case auto
    
    /// If the font file includes information about a preferred position, use that value.
    /// If the font file doesn't include this information, behave as if auto was set,
    /// with the browser choosing an appropriate position.
    case fromFont
    
    /// Forces the line to be set below the alphabetic baseline, at a position where it
    /// won't cross any descenders.
    case under
    
    /// In vertical writing-modes, this keyword forces the line to be placed on the left
    /// side of the text. In horizontal writing-modes, it is a synonym of auto.
    case left
    
    /// In vertical writing-modes, this keyword forces the line to be placed on the right
    /// side of the text. In horizontal writing-modes, it is a synonym of auto.
    case right
    
    public var description: String {
        switch self {
        case .auto: return "auto"
        case .fromFont: return "from-font"
        case .under: return "under"
        case .left: return "left"
        case .right: return "right"
        }
    }
}

/// CSS Output conversion
extension TextUnderlinePosition: CustomStringConvertible {
    /// Converts the text-underline-position value to its CSS string representation
    public var description: String {
        switch self {
        case .auto:
            return "auto"
            
        case .fromFont:
            return "from-font"
            
        case .under:
            return "under"
            
        case .left:
            return "left"
            
        case .right:
            return "right"
            
        case .combined(let values):
            return values.map { $0.description }.joined(separator: " ")
            
        case .global(let global):
            return global.description
        }
    }
}
