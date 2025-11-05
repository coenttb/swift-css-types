import CSSTypeTypes
import Foundation

/// The CSS animation-duration property sets the length of time that an animation takes to complete one cycle.
///
/// Example:
/// ```swift
/// .animationDuration(.s(3))        // animation-duration: 3s
/// .animationDuration(.ms(750))     // animation-duration: 750ms
/// .animationDuration(.auto)        // animation-duration: auto
/// ```
///
/// - SeeAlso: [MDN Web Docs on animation-duration](https://developer.mozilla.org/en-US/docs/Web/CSS/animation-duration)
public enum AnimationDuration: Property {

    public static let property: String = "animation-duration"

    /// Auto duration (equivalent to 0s for time-based animations, fills the entire timeline for scroll-driven animations)
    case auto

    /// The time that an animation takes to complete one cycle
    case time(Time)

    /// Global values
    case global(CSSTypeTypes.Global)

    /// Creates a duration in seconds
    public static func s(_ seconds: Double) -> AnimationDuration {
        return .time(Time.s(max(0, seconds)))
    }

    /// Creates a duration in milliseconds
    public static func ms(_ milliseconds: Double) -> AnimationDuration {
        return .time(Time.ms(max(0, milliseconds)))
    }

    /// Zero duration
    public static let zero = AnimationDuration.time(Time.zero)
}

/// CSS Output conversion
extension AnimationDuration: CustomStringConvertible {
    /// Converts the animation duration to its CSS string representation
    public var description: String {
        switch self {
        case .auto:
            return "auto"
        case .time(let time):
            return time.description
        case .global(let global):
            return global.description
        }
    }
}
