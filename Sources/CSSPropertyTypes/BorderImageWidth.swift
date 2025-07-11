import Foundation
import CSSTypeTypes

/// Represents the CSS `border-image-width` property, which sets the width of an element's border image.
///
/// This property defines the width of the element's border image. The border image width can differ
/// from the element's border-width and can make the border image extend beyond the border box.
///
/// Visual Reference:
/// ```
/// border-image-width: 1         border-image-width: 2
/// (same as border width)        (twice the border width)
/// ┌───────────────────┐         ┌───────────────────┐
/// │                   │         │                   │
/// │                   │         │                   │
/// │                   │         │                   │
/// └───────────────────┘         └───────────────────┘
///  ↑                    →        ↑                    →
///  │                    │        │                    │
///  │  Border image      │        │ Border image width │
///  │  width = 1         │        │ extends beyond the │
///  │  (border width)    │        │ border box         │
/// ```
///
/// Example:
/// ```swift
/// // Set equal width for all sides
/// .borderImageWidth(.px(20))
///
/// // Set width as a percentage
/// .borderImageWidth(.percentage(10))
///
/// // Set width as a multiple of the border-width
/// .borderImageWidth(.number(2))
///
/// // Auto width (uses intrinsic dimensions)
/// .borderImageWidth(.auto)
///
/// // Different widths for vertical and horizontal sides
/// .borderImageWidth(.px(10), .percentage(20))
///
/// // Different widths for top, horizontal, and bottom
/// .borderImageWidth(.px(5), .number(2), .percentage(15))
///
/// // Different widths for all sides
/// .borderImageWidth(.px(10), .number(2), .percentage(15), .auto)
/// ```
///
/// - Note: If the border-image-width is greater than the element's border-width, the border image
///         extends beyond the padding edge into the element's padding area.
///
/// - SeeAlso: [MDN Web Docs on border-image-width](https://developer.mozilla.org/en-US/docs/Web/CSS/border-image-width)
public enum BorderImageWidth: Property {
    
    public static let property: String = "border-image-width"
    
    /// All four sides have the same width value
    case all(WidthValue)
    
    /// Top and bottom sides have the same value, and left and right sides have the same value
    case vertical_horizontal(WidthValue, WidthValue)
    
    /// Top, horizontal sides (left and right), and bottom have different values
    case top_horizontal_bottom(WidthValue, WidthValue, WidthValue)
    
    /// Each side (top, right, bottom, left) has a different value
    case top_right_bottom_left(WidthValue, WidthValue, WidthValue, WidthValue)
    
    /// Global CSS values
    case global(CSSTypeTypes.Global)
    
    /// Represents a value for border-image-width
    public enum WidthValue: Sendable, Hashable, CustomStringConvertible, LengthPercentageConvertible {
        /// A length value
        case lengthPercentage(LengthPercentage)
        
        /// A number value (multiple of the border width)
        case number(Number)
        
        /// Automatic width (uses intrinsic dimensions)
        case auto
        
        /// String representation of the width value
        public var description: String {
            switch self {
            case .lengthPercentage(let value):
                return value.description
            case .number(let number):
                return number.description
            case .auto:
                return "auto"
            }
        }
    }
    
    /// Creates a border-image-width with the same value for all sides
    ///
    /// - Parameter value: The width value for all sides
    public init(_ value: WidthValue) {
        self = .all(value)
    }
    
    /// Creates a border-image-width with different values for vertical and horizontal sides
    ///
    /// - Parameters:
    ///   - vertical: The width value for top and bottom sides
    ///   - horizontal: The width value for left and right sides
    public init(_ vertical: WidthValue, _ horizontal: WidthValue) {
        self = .vertical_horizontal(vertical, horizontal)
    }
    
    /// Creates a border-image-width with different values for top, horizontal sides, and bottom
    ///
    /// - Parameters:
    ///   - top: The width value for the top side
    ///   - horizontal: The width value for the left and right sides
    ///   - bottom: The width value for the bottom side
    public init(_ top: WidthValue, _ horizontal: WidthValue, _ bottom: WidthValue) {
        self = .top_horizontal_bottom(top, horizontal, bottom)
    }
    
    /// Creates a border-image-width with different values for each side
    ///
    /// - Parameters:
    ///   - top: The width value for the top side
    ///   - right: The width value for the right side
    ///   - bottom: The width value for the bottom side
    ///   - left: The width value for the left side
    public init(_ top: WidthValue, _ right: WidthValue, _ bottom: WidthValue, _ left: WidthValue) {
        self = .top_right_bottom_left(top, right, bottom, left)
    }
    
    /// Creates a border-image-width with a number value for all sides
    ///
    /// - Parameter number: The number multiplier
    /// - Returns: A border-image-width with the specified number
    public static func number(_ number: Number) -> BorderImageWidth {
        return BorderImageWidth(.number(number))
    }
    
    /// Creates a border-image-width with auto value for all sides
    public static let auto = BorderImageWidth(.auto)
    
    /// Default value (1 - matches the border-width)
    public static let `default` = BorderImageWidth(.number(1))
}

extension BorderImageWidth: LengthPercentageConvertible {
    public static func lengthPercentage(_ value: CSSTypeTypes.LengthPercentage) -> BorderImageWidth {
        .all(.lengthPercentage(value))
    }
}

/// Provides string conversion for CSS output
extension BorderImageWidth: CustomStringConvertible {
    /// Converts the border-image-width to its CSS string representation
    ///
    /// This method generates CSS like:
    /// ```css
    /// border-image-width: 20px;
    /// border-image-width: 10%;
    /// border-image-width: 2;
    /// border-image-width: auto;
    /// border-image-width: 10px 20%;
    /// border-image-width: 5px 2 15%;
    /// border-image-width: 10px 2 15% auto;
    /// ```
    public var description: String {
        switch self {
        case .all(let value):
            return value.description
        case .vertical_horizontal(let vertical, let horizontal):
            return "\(vertical.description) \(horizontal.description)"
        case .top_horizontal_bottom(let top, let horizontal, let bottom):
            return "\(top.description) \(horizontal.description) \(bottom.description)"
        case .top_right_bottom_left(let top, let right, let bottom, let left):
            return "\(top.description) \(right.description) \(bottom.description) \(left.description)"
        case .global(let global):
            return global.description
        }
    }
}
