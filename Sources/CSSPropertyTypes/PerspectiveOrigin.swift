import CSSTypeTypes
import Foundation

/// The CSS `perspective-origin` property determines the position at which the viewer is looking.
/// It is used as the vanishing point by the `perspective` property.
///
/// The `perspective-origin` and `perspective` properties are attached to the parent of a child
/// transformed in 3-dimensional space, unlike the `perspective()` transform function which is
/// placed on the element being transformed.
///
/// Example:
/// ```swift
/// .perspectiveOrigin(.center)                    // perspective-origin: center
/// .perspectiveOrigin(.top)                       // perspective-origin: top
/// .perspectiveOrigin(.bottomRight)               // perspective-origin: bottom right
/// .perspectiveOrigin(.percentage(-170, 50))         // perspective-origin: -170% 50%
/// .perspectiveOrigin(.percentage(500, 200))         // perspective-origin: 500% 200%
/// ```
///
/// - SeeAlso: [MDN Web Docs on perspective-origin](https://developer.mozilla.org/en-US/docs/Web/CSS/perspective-origin)
public enum PerspectiveOrigin: Property {
    public static let property: String = "perspective-origin"

    /// A position defined with CSS position values (keywords, lengths, percentages)
    case position(CSSTypeTypes.Position)

    /// Global values
    case global(CSSTypeTypes.Global)
}

/// CSS Output conversion
extension PerspectiveOrigin: CustomStringConvertible {
    /// Converts the perspective-origin to its CSS string representation
    public var description: String {
        switch self {
        case .position(let position):
            return position.description

        case .global(let global):
            return global.description
        }
    }
}

/// Convenience initializers and factory methods
extension PerspectiveOrigin {
    /// Creates a perspective origin with a horizontal position, defaulting to center vertically
    public static func horizontal(_ x: LengthPercentage) -> PerspectiveOrigin {
        .position(.value(x))
    }

    /// Creates a perspective origin with a horizontal keyword, defaulting to center vertically
    public static func horizontal(_ keyword: CSSTypeTypes.Position.Keyword) -> PerspectiveOrigin {
        .position(.keyword(keyword))
    }

    /// Creates a perspective origin with x and y coordinates
    public static func at(_ x: LengthPercentage, _ y: LengthPercentage) -> PerspectiveOrigin {
        .position(.values(x, y))
    }

//    /// Creates a perspective origin with x and y percentages
//    public static func percentage(_ x: Percentage, _ y: Percentage) -> PerspectiveOrigin {
//        .position(.percentage(x, y))
//    }
//    
//    /// Creates a perspective origin with x and y pixel values
//    public static func px(_ x: Double, _ y: Double) -> PerspectiveOrigin {
//        .position(.px(x, y))
//    }
//    
    /// Center position (50% 50%)
    public static let center: PerspectiveOrigin = .position(.center)

    /// Top position (50% 0%)
    public static let top: PerspectiveOrigin = .position(.top)

    /// Right position (100% 50%)
    public static let right: PerspectiveOrigin = .position(.right)

    /// Bottom position (50% 100%)
    public static let bottom: PerspectiveOrigin = .position(.bottom)

    /// Left position (0% 50%)
    public static let left: PerspectiveOrigin = .position(.left)

    /// Top-left position (0% 0%)
    public static let topLeft: PerspectiveOrigin = .position(.topLeft)

    /// Top-right position (100% 0%)
    public static let topRight: PerspectiveOrigin = .position(.topRight)

    /// Bottom-left position (0% 100%)
    public static let bottomLeft: PerspectiveOrigin = .position(.bottomLeft)

    /// Bottom-right position (100% 100%)
    public static let bottomRight: PerspectiveOrigin = .position(.bottomRight)
}
