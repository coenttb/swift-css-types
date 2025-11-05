import CSSTypeTypes
import Foundation

/// The CSS animation-range-end property is used to set the end of an animation's attachment range
/// along its timeline, i.e. where along the timeline an animation will end.
///
/// Example:
/// ```swift
/// .animationRangeEnd(.normal)                      // animation-range-end: normal
/// .animationRangeEnd(.percentage(75))              // animation-range-end: 75%
/// .animationRangeEnd(.namedRange(.cover))          // animation-range-end: cover
/// .animationRangeEnd(.namedRange(.exit, 75))       // animation-range-end: exit 75%
/// ```
///
/// - Note: This is an experimental property and browser support may be limited.
///
/// - SeeAlso: [MDN Web Docs on animation-range-end](https://developer.mozilla.org/en-US/docs/Web/CSS/animation-range-end)
public enum AnimationRangeEnd: Property, LengthPercentageConvertible {

    public static let property: String = "animation-range-end"

    /// Represents the end of the timeline (default)
    case normal

    /// A length or percentage value measured from the beginning of the timeline
    case lengthPercentage(LengthPercentage)

    /// A specific named timeline range
    case namedRange(TimelineRangeName, Percentage? = nil)

    /// Global values
    case global(CSSTypeTypes.Global)
}

/// CSS Output conversion
extension AnimationRangeEnd: CustomStringConvertible {
    /// Converts the animation range end to its CSS string representation
    public var description: String {
        switch self {
        case .normal:
            return "normal"
        case .lengthPercentage(let lp):
            return lp.description
        case .namedRange(let name, let percentage):
            if let percentage {
                return "\(name.rawValue) \(percentage)"
            } else {
                return name.rawValue
            }
        case .global(let global):
            return global.description
        }
    }
}
