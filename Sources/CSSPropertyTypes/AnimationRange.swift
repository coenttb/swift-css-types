import CSSTypeTypes
import Foundation

/// The CSS animation-range shorthand property is used to set the start and end of an animation's
/// attachment range along its timeline, i.e. where along the timeline an animation will start and end.
///
/// Example:
/// ```swift
/// .animationRange(.normal)                                 // animation-range: normal
/// .animationRange(.percentage(20))                         // animation-range: 20%
/// .animationRange(.namedRange(.cover))                     // animation-range: cover
/// .animationRange(.startEnd(.normal, .percentage(50)))     // animation-range: normal 50%
/// .animationRange(.startEnd(.namedRange(.entry, 10), .namedRange(.contain, 75)))  // animation-range: entry 10% contain 75%
/// ```
///
/// - Note: This is an experimental property and browser support may be limited.
///
/// - SeeAlso: [MDN Web Docs on animation-range](https://developer.mozilla.org/en-US/docs/Web/CSS/animation-range)
public enum AnimationRange: Property, LengthPercentageConvertible {

    public static let property: String = "animation-range"

    /// A single value that sets both start and end
    case single(AnimationRangeValue)

    /// Separate start and end values
    case startEnd(AnimationRangeValue, AnimationRangeValue)

    /// Global values
    case global(CSSTypeTypes.Global)

    public static func lengthPercentage(_ value: CSSTypeTypes.LengthPercentage) -> AnimationRange {
        .single(.lengthPercentage(value))
    }

    /// Convenience method for specifying a named range without percentages
    public static func namedRange(_ name: TimelineRangeName) -> AnimationRange {
        return .single(.namedRange(name))
    }

    /// Default value (normal)
    public static let normal = AnimationRange.single(.normal)
}

/// A value for animation-range-start or animation-range-end
public enum AnimationRangeValue: Sendable, Hashable, LengthPercentageConvertible {
    /// Represents normal value (start/end of timeline)
    case normal

    /// A length or percentage value measured from the beginning of the timeline
    case lengthPercentage(LengthPercentage)

    /// A specific named timeline range
    case namedRange(TimelineRangeName, Percentage? = nil)
}

/// CSS Output conversion
extension AnimationRange: CustomStringConvertible {
    /// Converts the animation range to its CSS string representation
    public var description: String {
        switch self {
        case .single(let value):
            return value.description
        case .startEnd(let start, let end):
            return "\(start.description) \(end.description)"
        case .global(let global):
            return global.description
        }
    }
}

/// CSS Output conversion for the animation range value
extension AnimationRangeValue: CustomStringConvertible {
    /// Converts the animation range value to its CSS string representation
    public var description: String {
        switch self {
        case .normal:
            return "normal"
        case .lengthPercentage(let lp):
            return lp.description
        case .namedRange(let name, let percentage):
            if let percentage {
                return "\(name.rawValue) \(percentage.description)"
            } else {
                return name.rawValue
            }
        }
    }
}
