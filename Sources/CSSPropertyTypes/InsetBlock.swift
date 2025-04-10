import Foundation
import CSSTypeTypes

/// The CSS `inset-block` property is a shorthand that defines the logical block start and end
/// offsets of an element, which map to physical offsets depending on the element's writing mode,
/// directionality, and text orientation.
///
/// This property corresponds to the `top` and `bottom`, or `right` and `left` properties
/// depending on the values defined for `writing-mode`, `direction`, and `text-orientation`.
///
/// This property is essential for creating layouts that adapt properly to different writing systems:
/// - In `horizontal-tb` (horizontal top-to-bottom) writing mode, it maps to `top` and `bottom`
/// - In `vertical-rl` (vertical right-to-left) writing mode, it maps to `right` and `left`
/// - In `vertical-lr` (vertical left-to-right) writing mode, it maps to `left` and `right`
///
/// This property has no effect on non-positioned elements.
///
/// Example:
/// ```swift
/// .insetBlock(.auto)                              // inset-block: auto
/// .insetBlock(.all(.px(20)))                      // inset-block: 20px
/// .insetBlock(.sides(.px(10), .px(20)))           // inset-block: 10px 20px
/// .insetBlock(.sides(.percentage(5), .auto))      // inset-block: 5% auto
/// .insetBlock(.start(.px(10)), .end(.em(2)))      // inset-block: 10px 2em
/// ```
///
/// - SeeAlso: [MDN Web Docs on inset-block](https://developer.mozilla.org/en-US/docs/Web/CSS/inset-block)
public enum InsetBlock: Property, LengthPercentageConvertible {
    public static let property: String = "inset-block"
    
    /// Auto value for both start and end
    case auto
    
    /// Different values for start and end
    case sides(start: LengthPercentage, end: LengthPercentage)

    /// Global values
    case global(CSSTypeTypes.Global)
    
    public init(
        start: LengthPercentage,
        end: LengthPercentage
    ){
        self = .sides(start: start, end: end)
    }
    
    
    
    
    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .sides(let start, let end):
            return "\(start) \(end)"
      
        case .global(let global):
            return global.description
        }
    }
}

/// Convenience initializers for inset-block
extension InsetBlock {
    /// Creates an inset-block with the same value for both start and end
    ///
    /// - Parameter value: The value to use for both start and end
    /// - Returns: An InsetBlock instance with the same value for both sides
    public static func same(_ value: LengthPercentage) -> InsetBlock {
        .init(start: value, end: value)
    }
    
    public static func lengthPercentage(_ value: LengthPercentage) -> InsetBlock {
        .init(start: value, end: value)
    }
}
