import CSSTypeTypes
import Foundation

/// The CSS `opacity` property sets the opacity of an element. Opacity is the degree to 
/// which content behind an element is hidden, and is the opposite of transparency.
///
/// Example:
/// ```swift
/// .opacity(.value(0.5))  // opacity: 0.5
/// .opacity(.value(0))    // opacity: 0 (fully transparent)
/// .opacity(.value(1))    // opacity: 1 (fully opaque)
/// .opacity(0.5)          // opacity: 0.5 (using ExpressibleByFloatLiteral)
/// .opacity(0)            // opacity: 0 (fully transparent, using ExpressibleByIntegerLiteral)
/// .opacity(1)            // opacity: 1 (fully opaque, using ExpressibleByIntegerLiteral)
/// .opacity(.global(.inherit))  // opacity: inherit
/// ```
///
/// - Note: When opacity value is set to 0, the element and all of its children appear invisible, 
///         but they are still part of the DOM. They still register pointer events and can receive focus.
///
/// - Warning: Using opacity with a value other than 1 places the element in a new stacking context.
///            Opacity alone should not be used to provide information to screen readers.
///
/// - SeeAlso: [MDN Web Docs on opacity](https://developer.mozilla.org/en-US/docs/Web/CSS/opacity)
public enum Opacity: Property {
    public static let property: String = "opacity"

    /// A specific opacity value
    case value(Double)

    /// Global CSS values
    case global(CSSTypeTypes.Global)

    /// Creates an opacity with a specified value
    ///
    /// - Parameter value: The opacity value (0-1), values outside this range will be clamped
    public init(_ value: Double) {
        self = .value(max(0, min(1, value)))
    }

    /// Fully transparent (opacity: 0)
    public static let transparent: Opacity = .value(0)

    /// Fully opaque (opacity: 1)
    public static let opaque: Opacity = .value(1)
}

/// CSS Output conversion
extension Opacity: CustomStringConvertible {
    /// Converts the opacity value to its CSS string representation
    public var description: String {
        switch self {
        case .value(let value):
            return String(format: "%.2f", value)
        case .global(let global):
            return global.description
        }
    }
}

extension Opacity: ExpressibleByFloatLiteral {
    /// Creates an opacity value from a floating-point literal
    ///
    /// - Parameter value: The opacity value (0-1)
    public init(floatLiteral value: Double) {
        self.init(value)
    }
}

extension Opacity: ExpressibleByIntegerLiteral {
    /// Creates an opacity value from an integer literal
    ///
    /// - Parameter value: The opacity value (0 or 1)
    public init(integerLiteral value: Int) {
        self.init(Double(value))
    }
}
