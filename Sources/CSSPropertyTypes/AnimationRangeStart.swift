import CSSTypeTypes
import Foundation

/// The CSS animation-range-start property is used to set the start of an animation's attachment range
/// along its timeline, i.e. where along the timeline an animation will start.
///
/// Example:
/// ```swift
/// .animationRangeStart(.normal)                      // animation-range-start: normal
/// .animationRangeStart(.percentage(20))              // animation-range-start: 20%
/// .animationRangeStart(.namedRange(.cover))          // animation-range-start: cover
/// .animationRangeStart(.namedRange(.entry, 25))      // animation-range-start: entry 25%
/// ```
///
/// - Note: This is an experimental property and browser support may be limited.
///
/// - SeeAlso: [MDN Web Docs on animation-range-start](https://developer.mozilla.org/en-US/docs/Web/CSS/animation-range-start)
public enum AnimationRangeStart: Property, LengthPercentageConvertible {

  public static let property: String = "animation-range-start"

  /// Represents the start of the timeline (default)
  case normal

  /// A length or percentage value measured from the beginning of the timeline
  case lengthPercentage(LengthPercentage)

  /// A specific named timeline range
  case namedRange(TimelineRangeName, Percentage? = nil)

  /// Global values
  case global(CSSTypeTypes.Global)
}

/// Named timeline range values for animations
public enum TimelineRangeName: String, Sendable, Hashable, CaseIterable {
  /// Full range of a named view progress timeline
  case cover

  /// Range where the subject element is fully contained by, or fully contains, the scroll port
  case contain

  /// Range from element entry start to complete entry
  case entry

  /// Range from element exit start to complete exit
  case exit

  /// Range from element starting to cross the scroll port's starting edge to complete crossing
  case entryCrossing = "entry-crossing"

  /// Range from element starting to cross the scroll port's end edge to complete crossing
  case exitCrossing = "exit-crossing"
}

/// CSS Output conversion
extension AnimationRangeStart: CustomStringConvertible {
  /// Converts the animation range start to its CSS string representation
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
