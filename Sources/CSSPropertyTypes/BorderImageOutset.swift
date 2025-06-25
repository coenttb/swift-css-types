import Foundation
import CSSTypeTypes

/// Represents the CSS `border-image-outset` property, which sets the distance by which an element's
/// border image is set out from its border box.
///
/// This property defines how far the border image extends beyond the border box. The parts of
/// the border image that are rendered outside the element's border box with border-image-outset
/// do not trigger overflow scrollbars and don't capture mouse events.
///
/// Visual Reference:
/// ```
/// ┌─────────────────────────┐
/// │                         │
/// │                         │
/// │                         │
/// │                         │  ← Border image extends beyond the border box
/// │                         │    by the outset amount
/// │                         │
/// └─────────────────────────┘
///   ↑
///   Border box
/// ```
///
/// Example:
/// ```swift
/// // Set the outset for all sides
/// .borderImageOutset(.px(10))
///
/// // Set the outset as a multiple of the border-width
/// .borderImageOutset(.number(1.5))
///
/// // Set different outsets for vertical and horizontal sides
/// .borderImageOutset(.px(10), .number(2))
///
/// // Set different outsets for each side
/// .borderImageOutset(.px(7), .px(12), .px(14), .px(5))
/// ```
///
/// - Note: The parts of the border image outside the border box do not affect layout; they may
///         overlap other elements or extend outside the containing block, potentially
///         appearing as though they're not part of the element.
///
/// - SeeAlso: [MDN Web Docs on border-image-outset](https://developer.mozilla.org/en-US/docs/Web/CSS/border-image-outset)
public enum BorderImageOutset: Property {
    
    public static let property: String = "border-image-outset"
    
    /// All four sides have the same outset value
    case all(OutsetValue)
    
    /// Top and bottom sides have the same value, and left and right sides have the same value
    case vertical_horizontal(OutsetValue, OutsetValue)
    
    /// Top, horizontal sides (left and right), and bottom have different values
    case top_horizontal_bottom(OutsetValue, OutsetValue, OutsetValue)
    
    /// Each side (top, right, bottom, left) has a different value
    case top_right_bottom_left(OutsetValue, OutsetValue, OutsetValue, OutsetValue)
    
    /// Global CSS values
    case global(CSSTypeTypes.Global)
    
    /// Represents a value for border-image-outset
    public enum OutsetValue: Sendable, Hashable, CustomStringConvertible, LengthConvertible {
        /// A length value
        case length(Length)
        
        /// A number value (multiple of the border width)
        case number(Number)
        
        /// String representation of the outset value
        public var description: String {
            switch self {
            case .length(let length):
                return length.description
            case .number(let number):
                return number.description
            }
        }
    }
    
    /// Creates a border-image-outset with the same value for all sides
    ///
    /// - Parameter value: The outset value for all sides
    public init(_ value: OutsetValue) {
        self = .all(value)
    }
    
    /// Creates a border-image-outset with different values for vertical and horizontal sides
    ///
    /// - Parameters:
    ///   - vertical: The outset value for top and bottom sides
    ///   - horizontal: The outset value for left and right sides
    public init(_ vertical: OutsetValue, _ horizontal: OutsetValue) {
        self = .vertical_horizontal(vertical, horizontal)
    }
    
    /// Creates a border-image-outset with different values for top, horizontal sides, and bottom
    ///
    /// - Parameters:
    ///   - top: The outset value for the top side
    ///   - horizontal: The outset value for the left and right sides
    ///   - bottom: The outset value for the bottom side
    public init(_ top: OutsetValue, _ horizontal: OutsetValue, _ bottom: OutsetValue) {
        self = .top_horizontal_bottom(top, horizontal, bottom)
    }
    
    /// Creates a border-image-outset with different values for each side
    ///
    /// - Parameters:
    ///   - top: The outset value for the top side
    ///   - right: The outset value for the right side
    ///   - bottom: The outset value for the bottom side
    ///   - left: The outset value for the left side
    public init(_ top: OutsetValue, _ right: OutsetValue, _ bottom: OutsetValue, _ left: OutsetValue) {
        self = .top_right_bottom_left(top, right, bottom, left)
    }

    /// Creates a border-image-outset with a number value for all sides
    ///
    /// - Parameter number: The number multiplier
    /// - Returns: A border-image-outset with the specified number
    public static func number(_ number: Number) -> BorderImageOutset {
        return BorderImageOutset(.number(number))
    }
}

extension BorderImageOutset: LengthConvertible {
    public static func length(_ length: CSSTypeTypes.Length) -> BorderImageOutset {
        .all(.length(length))
    }
}

/// Provides string conversion for CSS output
extension BorderImageOutset: CustomStringConvertible {
    /// Converts the border-image-outset to its CSS string representation
    ///
    /// This method generates CSS like:
    /// ```css
    /// border-image-outset: 10px;
    /// border-image-outset: 1.5;
    /// border-image-outset: 10px 2;
    /// border-image-outset: 10px 20px 15px;
    /// border-image-outset: 7px 12px 14px 5px;
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
