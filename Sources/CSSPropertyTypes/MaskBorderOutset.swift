import CSSTypeTypes
import Foundation

/// Represents the CSS `mask-border-outset` property, which sets the distance by which an element's
/// mask border is set out from its border box.
///
/// This property defines how far the mask border extends beyond the border box. The parts of
/// the mask border image that are rendered outside the element's border box with mask-border-outset
/// do not trigger overflow scrollbars and don't capture mouse events.
///
/// Visual Reference:
/// ```
/// ┌─────────────────────────┐
/// │                         │
/// │                         │
/// │                         │
/// │                         │  ← Mask border extends beyond the border box
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
/// .maskBorderOutset(.px(10))
///
/// // Set the outset as a multiple of the border-width
/// .maskBorderOutset(.number(1.5))
///
/// // Set different outsets for vertical and horizontal sides
/// .maskBorderOutset(.px(10), .number(2))
///
/// // Set different outsets for each side
/// .maskBorderOutset(.px(7), .px(12), .px(14), .px(5))
/// ```
///
/// - Note: The parts of the mask border outside the border box do not affect layout; they may
///         overlap other elements or extend outside the containing block, potentially
///         appearing as though they're not part of the element.
///
/// - SeeAlso: [MDN Web Docs on mask-border-outset](https://developer.mozilla.org/en-US/docs/Web/CSS/mask-border-outset)
public enum MaskBorderOutset: Property, LengthConvertible {

    public static let property: String = "mask-border-outset"

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

    public static func length(_ length: CSSTypeTypes.Length) -> MaskBorderOutset {
        .init(.length(length))
    }

    /// Represents a value for mask-border-outset
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

    /// Creates a mask-border-outset with the same value for all sides
    ///
    /// - Parameter value: The outset value for all sides
    public init(_ value: OutsetValue) {
        self = .all(value)
    }

    /// Creates a mask-border-outset with different values for vertical and horizontal sides
    ///
    /// - Parameters:
    ///   - vertical: The outset value for top and bottom sides
    ///   - horizontal: The outset value for left and right sides
    public init(_ vertical: OutsetValue, _ horizontal: OutsetValue) {
        self = .vertical_horizontal(vertical, horizontal)
    }

    /// Creates a mask-border-outset with different values for top, horizontal sides, and bottom
    ///
    /// - Parameters:
    ///   - top: The outset value for the top side
    ///   - horizontal: The outset value for the left and right sides
    ///   - bottom: The outset value for the bottom side
    public init(_ top: OutsetValue, _ horizontal: OutsetValue, _ bottom: OutsetValue) {
        self = .top_horizontal_bottom(top, horizontal, bottom)
    }

    /// Creates a mask-border-outset with different values for each side
    ///
    /// - Parameters:
    ///   - top: The outset value for the top side
    ///   - right: The outset value for the right side
    ///   - bottom: The outset value for the bottom side
    ///   - left: The outset value for the left side
    public init(
        _ top: OutsetValue,
        _ right: OutsetValue,
        _ bottom: OutsetValue,
        _ left: OutsetValue
    ) {
        self = .top_right_bottom_left(top, right, bottom, left)
    }

    /// Creates a mask-border-outset with a number value for all sides
    ///
    /// - Parameter number: The number multiplier
    /// - Returns: A mask-border-outset with the specified number
    public static func number(_ number: Number) -> MaskBorderOutset {
        return MaskBorderOutset(.number(number))
    }

    /// Default value (0)
    public static let `default` = MaskBorderOutset(.number(0))
}

/// Provides string conversion for CSS output
extension MaskBorderOutset: CustomStringConvertible {
    /// Converts the mask-border-outset to its CSS string representation
    ///
    /// This method generates CSS like:
    /// ```css
    /// mask-border-outset: 10px;
    /// mask-border-outset: 1.5;
    /// mask-border-outset: 10px 2;
    /// mask-border-outset: 10px 20px 15px;
    /// mask-border-outset: 7px 12px 14px 5px;
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
            return
                "\(top.description) \(right.description) \(bottom.description) \(left.description)"
        case .global(let global):
            return global.description
        }
    }
}
