import Foundation
import CSSTypeTypes

/// The CSS `padding` shorthand property sets the padding area on all four sides of an element at once.
///
/// An element's padding area is the space between its content and its border.
///
/// The `padding` property can be specified using one, two, three, or four values:
/// - When one value is specified, it applies the same padding to all four sides.
/// - When two values are specified, the first applies to the top and bottom, the second to the left and right.
/// - When three values are specified, the first applies to the top, the second to the right and left, the third to the bottom.
/// - When four values are specified, they apply to the top, right, bottom, and left, respectively.
///
/// Example:
/// ```swift
/// .padding(.px(20))                                   // padding: 20px
/// .padding(.percentage(10))                              // padding: 10%
/// .padding(.vertical(.px(10)), .horizontal(.px(20)))  // padding: 10px 20px
/// .padding(.top(.px(10)), .horizontal(.px(20)), .bottom(.px(30))) // padding: 10px 20px 30px
/// .padding(.top(.px(10)), .right(.px(20)), .bottom(.px(30)), .left(.px(40))) // padding: 10px 20px 30px 40px
/// ```
///
/// - SeeAlso: [MDN Web Docs on padding](https://developer.mozilla.org/en-US/docs/Web/CSS/padding)
public enum Padding: Property, LengthPercentageConvertible {
    public static let property: String = "padding"
    
    /// Single value for all sides
    case all(LengthPercentage)
    
    /// Two values: top/bottom (vertical) and left/right (horizontal)
    case verticalHorizontal(LengthPercentage, LengthPercentage)
    
    /// Three values: top, left/right (horizontal), and bottom
    case topHorizontalBottom(LengthPercentage, LengthPercentage, LengthPercentage)
    
    /// Four values: top, right, bottom, and left (clockwise)
    case sides(LengthPercentage, LengthPercentage, LengthPercentage, LengthPercentage)
    
    /// Named sides: top, right, bottom, left in any combination
    case named(NamedSides)
    
    /// Global values
    case global(CSSTypeTypes.Global)
    
    /// Named sides for padding
    public struct NamedSides: Sendable, Hashable {
        /// Top padding value, if specified
        public var top: LengthPercentage?
        
        /// Right padding value, if specified
        public var right: LengthPercentage?
        
        /// Bottom padding value, if specified
        public var bottom: LengthPercentage?
        
        /// Left padding value, if specified
        public var left: LengthPercentage?
        
        /// Initialize with named sides
        public init(top: LengthPercentage? = nil, right: LengthPercentage? = nil, bottom: LengthPercentage? = nil, left: LengthPercentage? = nil) {
            self.top = top
            self.right = right
            self.bottom = bottom
            self.left = left
        }
        
        /// Initialize with vertical and horizontal values
        public init(vertical: LengthPercentage? = nil, horizontal: LengthPercentage? = nil) {
            self.top = vertical
            self.right = horizontal
            self.bottom = vertical
            self.left = horizontal
        }
    }
}

extension Padding {
    public static func lengthPercentage(_ value: CSSTypeTypes.LengthPercentage) -> Padding {
        .all(value)
    }
}

/// CSS Output conversion
extension Padding {
    /// Converts the padding to its CSS string representation
    public var description: String {
        switch self {
        case .all(let value):
            return value.description
            
        case .verticalHorizontal(let vertical, let horizontal):
            return "\(vertical) \(horizontal)"
            
        case .topHorizontalBottom(let top, let horizontal, let bottom):
            return "\(top) \(horizontal) \(bottom)"
            
        case .sides(let top, let right, let bottom, let left):
            return "\(top) \(right) \(bottom) \(left)"
            
        case .named(let sides):
            // Convert to the most compact representation based on which sides are specified
            if let top = sides.top, let right = sides.right, let bottom = sides.bottom, let left = sides.left {
                // All four sides are specified
                if top == right && right == bottom && bottom == left {
                    // All sides are equal
                    return top.description
                } else if top == bottom && right == left {
                    // Vertical and horizontal pairs are equal
                    return "\(top) \(right)"
                } else if right == left {
                    // Horizontal sides are equal
                    return "\(top) \(right) \(bottom)"
                } else {
                    // All sides are different
                    return "\(top) \(right) \(bottom) \(left)"
                }
            } else {
                // Only some sides are specified - use individual properties instead
                var individualProperties: [String] = []
                
                if let top = sides.top {
                    individualProperties.append("padding-top: \(top);")
                }
                if let right = sides.right {
                    individualProperties.append("padding-right: \(right);")
                }
                if let bottom = sides.bottom {
                    individualProperties.append("padding-bottom: \(bottom);")
                }
                if let left = sides.left {
                    individualProperties.append("padding-left: \(left);")
                }
                
                return individualProperties.joined(separator: " ")
            }
            
        case .global(let global):
            return global.description
        }
    }
}

/// Convenience initializers for padding
extension Padding {    
    /// Creates a padding with vertical and horizontal values
    ///
    /// - Parameters:
    ///   - vertical: The top and bottom padding
    ///   - horizontal: The left and right padding
    /// - Returns: A Padding instance with the specified vertical and horizontal values
    public static func sides(vertical: LengthPercentage, horizontal: LengthPercentage) -> Padding {
        .verticalHorizontal(vertical, horizontal)
    }
    
    /// Creates a padding with the same value for all sides using pixel units
    ///
    /// - Parameter px: The padding in pixels
    /// - Returns: A Padding instance with the same pixel value on all sides
    public static func px(_ px: Double) -> Padding {
        .all(.px(px))
    }
    
    /// Creates a padding with the same value for all sides using em units
    ///
    /// - Parameter em: The padding in ems
    /// - Returns: A Padding instance with the same em value on all sides
    public static func em(_ em: Double) -> Padding {
        .all(.em(em))
    }
    
    /// Creates a padding with the same value for all sides using percentage
    ///
    /// - Parameter percent: The padding percentage
    /// - Returns: A Padding instance with the same percentage value on all sides
    public static func percentage(_ percentage: Percentage) -> Padding {
        .all(.percentage(percentage))
    }
    
    /// Creates a padding with named sides
    ///
    /// - Parameters:
    ///   - top: The top padding value (optional)
    ///   - right: The right padding value (optional)
    ///   - bottom: The bottom padding value (optional)
    ///   - left: The left padding value (optional)
    /// - Returns: A Padding instance with the specified sides
    public static func sides(
        top: LengthPercentage? = nil,
        right: LengthPercentage? = nil,
        bottom: LengthPercentage? = nil,
        left: LengthPercentage? = nil
    ) -> Padding {
        .named(NamedSides(top: top, right: right, bottom: bottom, left: left))
    }
    
    /// Creates a padding with vertical (top/bottom) and horizontal (left/right) values
    ///
    /// - Parameters:
    ///   - vertical: The vertical padding value (optional)
    ///   - horizontal: The horizontal padding value (optional)
    /// - Returns: A Padding instance with the specified vertical and horizontal values
    public static func sides(
        vertical: LengthPercentage? = nil,
        horizontal: LengthPercentage? = nil
    ) -> Padding {
        .named(NamedSides(vertical: vertical, horizontal: horizontal))
    }
    
    /// Creates a padding with zero on all sides
    public static let zero: Padding = .all(.px(0))
}

extension Padding: ExpressibleByIntegerLiteral {
    /// Creates a padding from an integer literal (interpreted as pixels for all sides)
    ///
    /// - Parameter value: The padding in pixels
    public init(integerLiteral value: Int) {
        self = .all(.px(Double(value)))
    }
}

extension Padding: ExpressibleByFloatLiteral {
    /// Creates a padding from a floating-point literal (interpreted as pixels for all sides)
    ///
    /// - Parameter value: The padding in pixels
    public init(floatLiteral value: Double) {
        self = .all(.px(value))
    }
}
