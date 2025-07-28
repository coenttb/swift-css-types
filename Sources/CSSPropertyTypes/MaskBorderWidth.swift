import CSSTypeTypes
import Foundation

/// Represents the CSS `mask-border-width` property, which sets the width of an element's mask border.
///
/// This property defines the width of the element's mask border. The mask border width can differ
/// from the element's border-width and can make the mask border extend beyond the border box.
///
/// Visual Reference:
/// ```
/// mask-border-width: 1         mask-border-width: 2
/// (same as border width)        (twice the border width)
/// ┌───────────────────┐         ┌───────────────────┐
/// │                   │         │                   │
/// │                   │         │                   │
/// │                   │         │                   │
/// └───────────────────┘         └───────────────────┘
///  ↑                    →        ↑                    →
///  │                    │        │                    │
///  │  Mask border       │        │ Mask border width  │
///  │  width = 1         │        │ extends beyond the │
///  │  (border width)    │        │ border box         │
/// ```
///
/// Example:
/// ```swift
/// // Set equal width for all sides
/// .maskBorderWidth(.px(20))
///
/// // Set width as a percentage
/// .maskBorderWidth(.percentage(10))
///
/// // Set width as a multiple of the border-width
/// .maskBorderWidth(.number(2))
///
/// // Auto width (uses intrinsic dimensions)
/// .maskBorderWidth(.auto)
///
/// // Different widths for vertical and horizontal sides
/// .maskBorderWidth(.px(10), .percentage(20))
///
/// // Different widths for top, horizontal, and bottom
/// .maskBorderWidth(.px(5), .number(2), .percentage(15))
///
/// // Different widths for all sides
/// .maskBorderWidth(.px(10), .number(2), .percentage(15), .auto)
/// ```
///
/// - Note: If the mask-border-width is greater than the element's border-width, the mask border
///         extends beyond the padding edge into the element's padding area.
///
/// - SeeAlso: [MDN Web Docs on mask-border-width](https://developer.mozilla.org/en-US/docs/Web/CSS/mask-border-width)
public enum MaskBorderWidth: Property {
    public static let property: String = "mask-border-width"

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

    /// Represents a value for mask-border-width
    public enum WidthValue: Sendable, Hashable, CustomStringConvertible, LengthConvertible {
        /// A length value
        case length(Length)

        /// A percentage value
        case percentage(Percentage)

        /// A number value (multiple of the border width)
        case number(Number)

        /// Automatic width (uses intrinsic dimensions)
        case auto

        /// String representation of the width value
        public var description: String {
            switch self {
            case .length(let length):
                return length.description
            case .percentage(let percentage):
                return percentage.description
            case .number(let number):
                return number.description
            case .auto:
                return "auto"
            }
        }
    }

    /// Creates a mask-border-width with the same value for all sides
    ///
    /// - Parameter value: The width value for all sides
    public init(_ value: WidthValue) {
        self = .all(value)
    }

    /// Creates a mask-border-width with different values for vertical and horizontal sides
    ///
    /// - Parameters:
    ///   - vertical: The width value for top and bottom sides
    ///   - horizontal: The width value for left and right sides
    public init(_ vertical: WidthValue, _ horizontal: WidthValue) {
        self = .vertical_horizontal(vertical, horizontal)
    }

    /// Creates a mask-border-width with different values for top, horizontal sides, and bottom
    ///
    /// - Parameters:
    ///   - top: The width value for the top side
    ///   - horizontal: The width value for the left and right sides
    ///   - bottom: The width value for the bottom side
    public init(_ top: WidthValue, _ horizontal: WidthValue, _ bottom: WidthValue) {
        self = .top_horizontal_bottom(top, horizontal, bottom)
    }

    /// Creates a mask-border-width with different values for each side
    ///
    /// - Parameters:
    ///   - top: The width value for the top side
    ///   - right: The width value for the right side
    ///   - bottom: The width value for the bottom side
    ///   - left: The width value for the left side
    public init(_ top: WidthValue, _ right: WidthValue, _ bottom: WidthValue, _ left: WidthValue) {
        self = .top_right_bottom_left(top, right, bottom, left)
    }

    /// Creates a mask-border-width with a length value for all sides
    ///
    /// - Parameter px: The pixel value
    /// - Returns: A mask-border-width with the specified length
    public static func px(_ px: Double) -> MaskBorderWidth {
        return MaskBorderWidth(.length(.px(px)))
    }

    /// Creates a mask-border-width with a percentage value for all sides
    ///
    /// - Parameter percentage: The percentage value
    /// - Returns: A mask-border-width with the specified percentage
    public static func percentage(_ percentage: Percentage) -> MaskBorderWidth {
        return MaskBorderWidth(.percentage(percentage))
    }

    /// Creates a mask-border-width with a number value for all sides
    ///
    /// - Parameter number: The number multiplier
    /// - Returns: A mask-border-width with the specified number
    public static func number(_ number: Number) -> MaskBorderWidth {
        return MaskBorderWidth(.number(number))
    }

    /// Creates a mask-border-width with auto value for all sides
    public static let auto = MaskBorderWidth(.auto)

    /// Default value (auto)
    public static let `default` = MaskBorderWidth(.auto)
}

/// Provides string conversion for CSS output
extension MaskBorderWidth: CustomStringConvertible {
    /// Converts the mask-border-width to its CSS string representation
    ///
    /// This method generates CSS like:
    /// ```css
    /// mask-border-width: 20px;
    /// mask-border-width: 10%;
    /// mask-border-width: 2;
    /// mask-border-width: auto;
    /// mask-border-width: 10px 20%;
    /// mask-border-width: 5px 2 15%;
    /// mask-border-width: 10px 2 15% auto;
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
