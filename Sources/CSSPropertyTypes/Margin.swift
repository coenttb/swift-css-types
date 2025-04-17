import Foundation
import CSSTypeTypes

/// The CSS `margin` shorthand property sets the margin area on all four sides of an element at once.
///
/// An element's margin area is the space between its content and its border.
///
/// The `margin` property can be specified using one, two, three, or four values:
/// - When one value is specified, it applies the same margin to all four sides.
/// - When two values are specified, the first applies to the top and bottom, the second to the left and right.
/// - When three values are specified, the first applies to the top, the second to the right and left, the third to the bottom.
/// - When four values are specified, they apply to the top, right, bottom, and left, respectively.
///
/// Example:
/// ```swift
/// .margin(.px(20))                                   // margin: 20px
/// .margin(.percentage(10))                              // margin: 10%
/// .margin(.vertical(.px(10)), .horizontal(.px(20)))  // margin: 10px 20px
/// .margin(.top(.px(10)), .horizontal(.px(20)), .bottom(.px(30))) // margin: 10px 20px 30px
/// .margin(.top(.px(10)), .right(.px(20)), .bottom(.px(30)), .left(.px(40))) // margin: 10px 20px 30px 40px
/// ```
///
/// - SeeAlso: [MDN Web Docs on margin](https://developer.mozilla.org/en-US/docs/Web/CSS/margin)
public enum Margin: Property, LengthPercentageConvertible {
    public static let property: String = "margin"
    
    case auto
    
    /// Single value for all sides
    case all(LengthPercentage)
    
    /// Two values: top/bottom (vertical) and left/right (horizontal)
    case verticalHorizontal(LengthPercentage, LengthPercentage)
    
    /// Three values: top, left/right (horizontal), and bottom
    case topHorizontalBottom(LengthPercentage, LengthPercentage, LengthPercentage)
    
    /// Four values: top, right, bottom, and left (clockwise)
    case sides(LengthPercentage, LengthPercentage, LengthPercentage, LengthPercentage)

    /// Global values
    case global(CSSTypeTypes.Global)
}

extension Margin {
    public static func lengthPercentage(_ value: CSSTypeTypes.LengthPercentage) -> Margin {
        .all(value)
    }
}

/// CSS Output conversion
extension Margin {
    /// Converts the margin to its CSS string representation
    public var description: String {
        switch self {
        case .auto: return "auto"
            
        case .all(let value):
            return value.description
            
        case .verticalHorizontal(let vertical, let horizontal):
            return "\(vertical) \(horizontal)"
            
        case .topHorizontalBottom(let top, let horizontal, let bottom):
            return "\(top) \(horizontal) \(bottom)"
            
        case .sides(let top, let right, let bottom, let left):
            return "\(top) \(right) \(bottom) \(left)"
            
        
            
        case .global(let global):
            return global.description
        }
    }
}

/// Convenience initializers for margin
extension Margin {
    /// Creates a margin with vertical and horizontal values
    ///
    /// - Parameters:
    ///   - vertical: The top and bottom margin
    ///   - horizontal: The left and right margin
    /// - Returns: A Margin instance with the specified vertical and horizontal values
    public static func sides(vertical: LengthPercentage, horizontal: LengthPercentage) -> Margin {
        .verticalHorizontal(vertical, horizontal)
    }

    /// Creates a margin with named sides
    ///
    /// - Parameters:
    ///   - top: The top margin value (optional)
    ///   - right: The right margin value (optional)
    ///   - bottom: The bottom margin value (optional)
    ///   - left: The left margin value (optional)
    /// - Returns: A Margin instance with the specified sides
    public static func sides(
        top: LengthPercentage? = nil,
        right: LengthPercentage? = nil,
        bottom: LengthPercentage? = nil,
        left: LengthPercentage? = nil
    ) -> Margin {
        .sides(top ?? .zero, right ?? .zero, bottom ?? .zero, left ?? .zero)
    }
    
    /// Creates a margin with vertical (top/bottom) and horizontal (left/right) values
    ///
    /// - Parameters:
    ///   - vertical: The vertical margin value (optional)
    ///   - horizontal: The horizontal margin value (optional)
    /// - Returns: A Margin instance with the specified vertical and horizontal values
    public static func sides(
        vertical: LengthPercentage? = nil,
        horizontal: LengthPercentage? = nil
    ) -> Margin {
        .verticalHorizontal(vertical ?? .zero, horizontal ?? .zero)
    }
    
    /// Creates a margin with zero on all sides
    public static let zero: Margin = .all(.px(0))
}

extension Margin: ExpressibleByIntegerLiteral {
    /// Creates a margin from an integer literal (interpreted as pixels for all sides)
    ///
    /// - Parameter value: The margin in pixels
    public init(integerLiteral value: Int) {
        self = .all(.px(Double(value)))
    }
}



extension Margin: ExpressibleByFloatLiteral {
    /// Creates a margin from a floating-point literal (interpreted as pixels for all sides)
    ///
    /// - Parameter value: The margin in pixels
    public init(floatLiteral value: Double) {
        self = .all(.px(value))
    }
}
