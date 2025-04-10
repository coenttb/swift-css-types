import Foundation
import CSSTypeTypes

/// The CSS `padding-inline` shorthand property defines the logical inline start and end padding of an element,
/// which maps to physical padding properties depending on the element's writing mode, directionality, and text orientation.
///
/// This is part of CSS Logical Properties, which are writing-mode aware equivalents of physical properties.
/// For example, in a left-to-right horizontal writing mode (like English), `padding-inline` is equivalent
/// to `padding-left` and `padding-right`.
///
/// Example:
/// ```swift
/// .paddingInline(.px(20))                  // padding-inline: 20px
/// .paddingInline(.px(10), .px(20))         // padding-inline: 10px 20px
/// .paddingInline(.em(1), .percentage(5))      // padding-inline: 1em 5%
/// .paddingInline(0)                        // padding-inline: 0
/// ```
///
/// - SeeAlso: [MDN Web Docs on padding-inline](https://developer.mozilla.org/en-US/docs/Web/CSS/padding-inline)
public enum PaddingInline: Property {
    public static let property: String = "padding-inline"
    
    /// Single value for both inline-start and inline-end padding
    case uniform(LengthPercentage)
    
    /// Two values: the first for inline-start and the second for inline-end padding
    case separate(LengthPercentage, LengthPercentage)
    
    /// Global values
    case global(CSSTypeTypes.Global)
}

/// CSS Output conversion
extension PaddingInline: CustomStringConvertible {
    /// Converts the padding-inline value to its CSS string representation
    public var description: String {
        switch self {
        case .uniform(let value):
            return value.description
            
        case .separate(let start, let end):
            return "\(start) \(end)"
            
        case .global(let global):
            return global.description
        }
    }
}

/// Convenience initializers
extension PaddingInline {
    
    /// Creates a padding-inline with separate start and end values
    ///
    /// - Parameters:
    ///   - start: The inline-start padding
    ///   - end: The inline-end padding
    /// - Returns: A PaddingInline instance
    public static func separate(start: LengthPercentage, end: LengthPercentage) -> PaddingInline {
        .separate(start, end)
    }
    
    /// Creates a padding-inline with pixel values
    ///
    /// - Parameters:
    ///   - start: The inline-start padding in pixels
    ///   - end: The optional inline-end padding in pixels (if not provided, start is used for both)
    /// - Returns: A PaddingInline instance
    public static func px(_ start: Double, _ end: Double? = nil) -> PaddingInline {
        if let end = end {
            return .separate(.px(start), .px(end))
        }
        return .uniform(.px(start))
    }
    
    /// Creates a padding-inline with em values
    ///
    /// - Parameters:
    ///   - start: The inline-start padding in ems
    ///   - end: The optional inline-end padding in ems (if not provided, start is used for both)
    /// - Returns: A PaddingInline instance
    public static func em(_ start: Double, _ end: Double? = nil) -> PaddingInline {
        if let end = end {
            return .separate(.em(start), .em(end))
        }
        return .uniform(.em(start))
    }
    
    /// Creates a padding-inline with percentage values
    ///
    /// - Parameters:
    ///   - start: The inline-start padding as a percentage
    ///   - end: The optional inline-end padding as a percentage (if not provided, start is used for both)
    /// - Returns: A PaddingInline instance
    public static func percentage(_ start: Percentage, _ end: Percentage? = nil) -> PaddingInline {
        if let end = end {
            return .separate(.percentage(start), .percentage(end))
        }
        return .uniform(.percentage(start))
    }
    
    /// Creates a padding-inline with a zero value for both sides
    public static let zero: PaddingInline = .uniform(.px(0))
}

extension PaddingInline: ExpressibleByIntegerLiteral {
    /// Creates a padding-inline from an integer literal (interpreted as pixels for both sides)
    ///
    /// - Parameter value: The padding in pixels
    public init(integerLiteral value: Int) {
        self = .uniform(.px(Double(value)))
    }
}

extension PaddingInline: ExpressibleByFloatLiteral {
    /// Creates a padding-inline from a floating-point literal (interpreted as pixels for both sides)
    ///
    /// - Parameter value: The padding in pixels
    public init(floatLiteral value: Double) {
        self = .uniform(.px(value))
    }
}
