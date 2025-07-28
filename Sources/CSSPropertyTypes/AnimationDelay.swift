import CSSTypeTypes
import Foundation

/// The CSS animation-delay property specifies the amount of time to wait from applying
/// the animation to an element before beginning to perform the animation.
///
/// The animation can start later, immediately from its beginning, or immediately and partway through the animation.
///
/// Example:
/// ```swift
/// .animationDelay(.s(2))       // animation-delay: 2s
/// .animationDelay(.ms(500))    // animation-delay: 500ms
/// .animationDelay(.s(-1))      // animation-delay: -1s (starts from the middle)
/// ```
///
/// - SeeAlso: [MDN Web Docs on animation-delay](https://developer.mozilla.org/en-US/docs/Web/CSS/animation-delay)
public enum AnimationDelay: Property {

    public static let property: String = "animation-delay"

    /// The delay time value
    case time(Time)

    /// Global values
    case global(CSSTypeTypes.Global)

    /// Creates a delay in seconds
    public static func s(_ seconds: Double) -> AnimationDelay {
        return .time(Time.s(seconds))
    }

    /// Creates a delay in milliseconds
    public static func ms(_ milliseconds: Double) -> AnimationDelay {
        return .time(Time.ms(milliseconds))
    }

    /// Zero delay (animation starts immediately)
    public static let zero = AnimationDelay.time(Time.zero)
}

/// CSS Output conversion
extension AnimationDelay: CustomStringConvertible {
    /// Converts the animation delay to its CSS string representation
    public var description: String {
        switch self {
        case .time(let time):
            return time.description
        case .global(let global):
            return global.description
        }
    }
}
