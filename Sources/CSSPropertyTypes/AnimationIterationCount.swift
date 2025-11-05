import CSSTypeTypes
import Foundation

/// The CSS animation-iteration-count property sets the number of times
/// an animation sequence should be played before stopping.
///
/// Example:
/// ```swift
/// .animationIterationCount(.infinite)  // animation-iteration-count: infinite
/// .animationIterationCount(3)          // animation-iteration-count: 3
/// .animationIterationCount(2.5)        // animation-iteration-count: 2.5
/// ```
///
/// - SeeAlso: [MDN Web Docs on animation-iteration-count](https://developer.mozilla.org/en-US/docs/Web/CSS/animation-iteration-count)
public enum AnimationIterationCount: Property {

    public static let property: String = "animation-iteration-count"

    /// The animation will repeat forever
    case infinite

    /// The number of times the animation will repeat (default is 1)
    case count(Number)

    /// Global value
    case global(CSSTypeTypes.Global)
}

/// CSS Output conversion
extension AnimationIterationCount: CustomStringConvertible {
    /// Converts the animation iteration count to its CSS string representation
    public var description: String {
        switch self {
        case .infinite:
            return "infinite"
        case .count(let count):
            return count.description
        case .global(let global):
            return global.description
        }
    }
}

// Convenience extensions for creating iteration counts
extension AnimationIterationCount: ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {
    /// Creates an iteration count from an integer literal
    public init(integerLiteral value: Int) {
        if value <= 0 {
            self = .count(1)  // Default to 1 for invalid values
        } else {
            self = .count(.init(value))
        }
    }

    /// Creates an iteration count from a floating-point literal
    public init(floatLiteral value: Double) {
        if value <= 0 {
            self = .count(1)  // Default to 1 for invalid values
        } else {
            self = .count(.init(value))
        }
    }
}
