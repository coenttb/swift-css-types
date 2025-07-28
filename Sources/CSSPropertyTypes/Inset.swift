import CSSTypeTypes
import Foundation

/// The CSS `inset` property is a shorthand that corresponds to the `top`, `right`, `bottom`, and/or `left` properties.
///
/// This property defines the logical block and inline start and end offsets of a positioned element,
/// which map to physical offsets depending on the element's writing mode, directionality, and text orientation.
///
/// The `inset` property can be specified using one, two, three, or four values:
/// - When one value is specified, it applies the same inset to all four sides.
/// - When two values are specified, the first applies to the top and bottom, the second to the left and right.
/// - When three values are specified, the first applies to the top, the second to the right and left, the third to the bottom.
/// - When four values are specified, they apply to the top, right, bottom, and left, respectively.
///
/// This property has no effect on non-positioned elements (position: static).
///
/// Example:
/// ```swift
/// .inset(.auto)                                  // inset: auto
/// .inset(20)                                     // inset: 20px
/// .inset(vertical: 10, horizontal: 20)           // inset: 10px 20px
/// .inset(top: 10, horizontal: 20, bottom: 30)    // inset: 10px 20px 30px
/// .inset(top: 10, right: 20, bottom: 30, left: 40) // inset: 10px 20px 30px 40px
/// .inset(top: .auto, right: 20, bottom: 30, left: .auto) // inset: auto 20px 30px auto
/// ```
///
/// - SeeAlso: [MDN Web Docs on inset](https://developer.mozilla.org/en-US/docs/Web/CSS/inset)
public enum Inset: Property, LengthPercentageConvertible {
    public static let property: String = "inset"

    /// Auto value for all sides
    case auto

    /// Values for each side (top, right, bottom, left)
    case sides(top: Value, right: Value, bottom: Value, left: Value)

    /// Global values (inherit, initial, etc.)
    case global(CSSTypeTypes.Global)

    /// Represents a value for each side that can be either a length/percentage or auto
    public enum Value: Hashable, Sendable, LengthPercentageConvertible {
        /// Auto value (browser-determined)
        case auto

        /// Specific length or percentage value
        case lengthPercentage(LengthPercentage)

        public var description: String {
            switch self {
            case .auto:
                return "auto"
            case .lengthPercentage(let value):
                return value.description
            }
        }

        /// Converts a LengthPercentage to a Value
        public static func from(_ value: LengthPercentage) -> Value {
            .lengthPercentage(value)
        }
    }

    /// Initialize with the same value for all sides
    public init(_ value: LengthPercentage) {
        self = .sides(
            top: .lengthPercentage(value),
            right: .lengthPercentage(value),
            bottom: .lengthPercentage(value),
            left: .lengthPercentage(value)
        )
    }

    /// Initialize with auto for all sides
    public init(auto: Bool = true) {
        if auto {
            self = .auto
        } else {
            self = .sides(
                top: .length(.px(0)),
                right: .length(.px(0)),
                bottom: .length(.px(0)),
                left: .length(.px(0))
            )
        }
    }

    /// Initialize with vertical and horizontal values
    public init(vertical: LengthPercentage, horizontal: LengthPercentage) {
        self = .sides(
            top: .lengthPercentage(vertical),
            right: .lengthPercentage(horizontal),
            bottom: .lengthPercentage(vertical),
            left: .lengthPercentage(horizontal)
        )
    }

    /// Initialize with top, horizontal, and bottom values (three-value syntax)
    public init(top: LengthPercentage, horizontal: LengthPercentage, bottom: LengthPercentage) {
        self = .sides(
            top: .lengthPercentage(top),
            right: .lengthPercentage(horizontal),
            bottom: .lengthPercentage(bottom),
            left: .lengthPercentage(horizontal)
        )
    }

    /// Initialize with four specific values
    public init(
        top: LengthPercentage,
        right: LengthPercentage,
        bottom: LengthPercentage,
        left: LengthPercentage
    ) {
        self = .sides(
            top: .lengthPercentage(top),
            right: .lengthPercentage(right),
            bottom: .lengthPercentage(bottom),
            left: .lengthPercentage(left)
        )
    }

    /// Initialize with values that can be either lengths or auto
    public init(
        top: Value,
        right: Value,
        bottom: Value,
        left: Value
    ) {
        self = .sides(top: top, right: right, bottom: bottom, left: left)
    }

    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .sides(let top, let right, let bottom, let left):
            // Optimize output based on values
            if top == right && right == bottom && bottom == left {
                // All sides are equal - use single value
                return top.description
            } else if top == bottom && right == left {
                // Vertical sides equal and horizontal sides equal - use two values
                return "\(top.description) \(right.description)"
            } else if right == left {
                // Only horizontal sides are equal - use three values
                return "\(top.description) \(right.description) \(bottom.description)"
            } else {
                // All sides different - use four values
                return "\(top.description) \(right.description) \(bottom.description) \(left.description)"
            }

        case .global(let global):
            return global.description
        }
    }

    public static func lengthPercentage(_ value: LengthPercentage) -> Inset {
        .init(value)
    }

}

/// Literal expressions for Inset
extension Inset: ExpressibleByIntegerLiteral {
    /// Creates an inset from an integer literal (interpreted as pixels for all sides)
    ///
    /// - Parameter value: The inset in pixels
    public init(integerLiteral value: Int) {
        self.init(.px(Double(value)))
    }
}

extension Inset: ExpressibleByFloatLiteral {
    /// Creates an inset from a floating-point literal (interpreted as pixels for all sides)
    ///
    /// - Parameter value: The inset in pixels
    public init(floatLiteral value: Double) {
        self.init(.px(value))
    }
}
