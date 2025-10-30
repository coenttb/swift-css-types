import CSSTypeTypes
import Foundation

/// The CSS view-timeline-inset property specifies adjustments to the position of the scrollport
/// in which the subject element of a named view progress timeline animation is deemed to be visible.
///
/// This allows specifying start and/or end inset (or outset) values that offset the position of the timeline.
/// It can be combined with or used instead of animation-range and its longhand properties.
///
/// Example:
/// ```swift
/// .viewTimelineInset(.auto)                    // view-timeline-inset: auto
/// .viewTimelineInset(.length(200))             // view-timeline-inset: 200px
/// .viewTimelineInset(.percentage(20))          // view-timeline-inset: 20%
/// .viewTimelineInset(.percentage(20), .auto)   // view-timeline-inset: 20% auto
/// .viewTimelineInset(.auto, .length(200))      // view-timeline-inset: auto 200px
/// .viewTimelineInset(.percentage(20), .length(-100)) // view-timeline-inset: 20% -100px
/// ```
///
/// - Note: If the value is positive, the animation's start/end position moves inside the scrollport.
///         If negative, it moves outside, meaning it starts before appearing or finishes after leaving.
///
/// - SeeAlso: [MDN Web Docs on view-timeline-inset](https://developer.mozilla.org/en-US/docs/Web/CSS/view-timeline-inset)
public enum ViewTimelineInset: Property {

  public static let property: String = "view-timeline-inset"

  /// A single value for both start and end
  case single(ViewTimelineInsetValue)

  /// Separate values for start and end
  case double(ViewTimelineInsetValue, ViewTimelineInsetValue)

  /// Global values
  case global(CSSTypeTypes.Global)
}

/// Represents the possible values for view-timeline-inset
public enum ViewTimelineInsetValue: Sendable, Hashable {
  /// Uses scroll-padding for edge of scrollport
  case auto

  /// A length value (in pixels, em, etc.)
  case length(Length)

  /// A percentage value
  case percentage(Percentage)
}

/// CSS Output conversion for ViewTimelineInsetValue
extension ViewTimelineInsetValue: CustomStringConvertible {
  /// Converts the view-timeline-inset value to its CSS string representation
  public var description: String {
    switch self {
    case .auto:
      return "auto"

    case .length(let length):
      return length.description

    case .percentage(let percentage):
      return percentage.description
    }
  }
}

/// CSS Output conversion for ViewTimelineInset
extension ViewTimelineInset: CustomStringConvertible {
  /// Converts the view-timeline-inset value to its CSS string representation
  public var description: String {
    switch self {
    case .single(let value):
      return value.description

    case .double(let start, let end):
      return "\(start) \(end)"

    case .global(let global):
      return global.description
    }
  }
}

extension ViewTimelineInset: LengthConvertible {
  public static func length(_ length: CSSTypeTypes.Length) -> ViewTimelineInset {
    .single(.length(length))
  }
}

// Convenience initializers
extension ViewTimelineInset {
  /// Creates an auto view timeline inset
  public static func auto() -> Self {
    return .single(.auto)
  }
}
