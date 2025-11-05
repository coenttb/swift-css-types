import CSSTypeTypes
import Foundation

/// The CSS `object-position` property specifies the alignment of the selected replaced element's
/// contents within the element's box. Areas of the box which aren't covered by the replaced
/// element's object will show the element's background.
///
/// Example:
/// ```swift
/// .objectPosition(.center)                // object-position: center
/// .objectPosition(.topRight)              // object-position: right top
/// .objectPosition(.px(10), .px(20))       // object-position: 10px 20px
/// .objectPosition(.percentage(100), .px(10)) // object-position: 100% 10px
/// ```
///
/// - Note: You can adjust how the replaced element's object's intrinsic size is adjusted to
///         fit within the element's box using the `object-fit` property.
/// - Note: The position can be set so that the replaced element is drawn outside its box.
///
/// - SeeAlso: [MDN Web Docs on object-position](https://developer.mozilla.org/en-US/docs/Web/CSS/object-position)
public enum ObjectPosition: Property, LengthPercentageConvertible {
    public static func lengthPercentage(_ value: CSSTypeTypes.LengthPercentage) -> ObjectPosition {
        .oneValue(.lengthPercentage(value))
    }

    public static let property: String = "object-position"

    /// A single position value type
    public enum Value: Sendable, Hashable, LengthPercentageConvertible {
        /// Keyword position (top, right, bottom, left, center)
        case keyword(CSSTypeTypes.Position.Keyword)

        /// Percentage value
        case lengthPercentage(LengthPercentage)
    }

    /// Single keyword position (top, right, bottom, left, center)
    case keyword(CSSTypeTypes.Position.Keyword)

    /// Single value position (defaults to horizontal positioning)
    case oneValue(Value)

    /// Two values for horizontal and vertical positioning
    case twoValues(Value, Value)

    /// A global CSS value
    case global(CSSTypeTypes.Global)

    /// Creates a positioning style with only the single value
    /// - Parameter value: The positioning value
    /// - Returns: An ObjectPosition instance
    public static func objectPosition(_ value: Value) -> ObjectPosition {
        .oneValue(value)
    }

    /// Creates a positioning style with horizontal and vertical values
    /// - Parameters:
    ///   - horizontal: The horizontal position value
    ///   - vertical: The vertical position value
    /// - Returns: An ObjectPosition instance
    public static func objectPosition(_ horizontal: Value, _ vertical: Value) -> ObjectPosition {
        .twoValues(horizontal, vertical)
    }

    /// Creates a positioning style with a keyword or global value
    /// - Parameter position: A Position.Keyword or Global
    /// - Returns: An ObjectPosition instance
    public static func objectPosition(_ position: CSSTypeTypes.Position.Keyword) -> ObjectPosition {
        .keyword(position)
    }

    /// Creates a positioning style with a global value
    /// - Parameter global: A Global value
    /// - Returns: An ObjectPosition instance
    public static func objectPosition(_ global: Global) -> ObjectPosition {
        .global(global)
    }
}

/// Convenience accessors
extension ObjectPosition {
    /// Position at the center of the element
    public static let center: ObjectPosition = .keyword(.center)

    /// Position at the top of the element
    public static let top: ObjectPosition = .keyword(.top)

    /// Position at the right of the element
    public static let right: ObjectPosition = .keyword(.right)

    /// Position at the bottom of the element
    public static let bottom: ObjectPosition = .keyword(.bottom)

    /// Position at the left of the element
    public static let left: ObjectPosition = .keyword(.left)

    /// Position at the top-left corner of the element
    public static let topLeft: ObjectPosition = .twoValues(.keyword(.left), .keyword(.top))

    /// Position at the top-center of the element
    public static let topCenter: ObjectPosition = .twoValues(.keyword(.center), .keyword(.top))

    /// Position at the top-right corner of the element
    public static let topRight: ObjectPosition = .twoValues(.keyword(.right), .keyword(.top))

    /// Position at the center-left of the element
    public static let centerLeft: ObjectPosition = .twoValues(.keyword(.left), .keyword(.center))

    /// Position at the center-right of the element
    public static let centerRight: ObjectPosition = .twoValues(.keyword(.right), .keyword(.center))

    /// Position at the bottom-left corner of the element
    public static let bottomLeft: ObjectPosition = .twoValues(.keyword(.left), .keyword(.bottom))

    /// Position at the bottom-center of the element
    public static let bottomCenter: ObjectPosition = .twoValues(
        .keyword(.center),
        .keyword(.bottom)
    )

    /// Position at the bottom-right corner of the element
    public static let bottomRight: ObjectPosition = .twoValues(.keyword(.right), .keyword(.bottom))

    /// Set just the X position, centering the Y position
    /// - Parameter x: The horizontal position value
    /// - Returns: An ObjectPosition instance
    public static func x(_ x: Value) -> ObjectPosition {
        .twoValues(x, .keyword(.center))
    }

    /// Set just the Y position, centering the X position
    /// - Parameter y: The vertical position value
    /// - Returns: An ObjectPosition instance
    public static func y(_ y: Value) -> ObjectPosition {
        .twoValues(.keyword(.center), y)
    }

    /// Set a position with pixel units
    /// - Parameter value: The pixel value
    /// - Returns: An ObjectPosition instance
    public static func px(_ value: Int) -> ObjectPosition {
        .oneValue(.px(Double(value)))
    }

    /// Set a position with pixel units for both X and Y
    /// - Parameters:
    ///   - x: Horizontal pixel value
    ///   - y: Vertical pixel value
    /// - Returns: An ObjectPosition instance
    public static func lengths(_ x: Value, _ y: Value) -> ObjectPosition {
        .twoValues(x, y)
    }

    /// Set a position with percentage units for both X and Y
    /// - Parameters:
    ///   - x: Horizontal percentage
    ///   - y: Vertical percentage
    /// - Returns: An ObjectPosition instance
    public static func percents(_ x: Percentage, _ y: Percentage) -> ObjectPosition {
        .twoValues(.percentage(x), .percentage(y))
    }

    /// Set the same value for both X and Y positions
    /// - Parameter value: The value to use for both axes
    /// - Returns: An ObjectPosition instance
    public static func symmetric(_ value: Value) -> ObjectPosition {
        .twoValues(value, value)
    }
}

/// CSS Output conversion
extension ObjectPosition: CustomStringConvertible {
    /// Converts the object-position value to its CSS string representation
    public var description: String {
        switch self {
        case .keyword(let keyword):
            return keyword.rawValue

        case .oneValue(let value):
            return value.description

        case .twoValues(let horizontal, let vertical):
            return "\(horizontal) \(vertical)"

        case .global(let global):
            return global.description
        }
    }
}

/// Object style container
public struct ObjectStyle: Sendable, Hashable {
    /// The object position
    public let position: ObjectPosition

    /// Creates an object style with a specified position
    /// - Parameter position: The object position
    public init(position: ObjectPosition) {
        self.position = position
    }
}

/// CSS Output conversion for ObjectPosition.Value
extension ObjectPosition.Value: CustomStringConvertible {
    /// Converts the value to its CSS string representation
    public var description: String {
        switch self {
        case .keyword(let keyword):
            return keyword.rawValue

        case .lengthPercentage(let lengthPercentage):
            return lengthPercentage.description
        }
    }
}
