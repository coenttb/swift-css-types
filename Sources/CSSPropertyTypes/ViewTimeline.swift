import CSSTypeTypes
import Foundation

/// The CSS view-timeline shorthand property defines a named view progress timeline, which is
/// progressed through based on the change in visibility of an element (subject) inside a scrollable
/// element (scroller).
///
/// This property combines view-timeline-name and view-timeline-axis to define both the name of the
/// timeline and the scroll axis to track. The name can then be referenced in animation-timeline to
/// indicate the element that will be animated as the timeline progresses.
///
/// Example:
/// ```swift
/// .viewTimeline(.custom("--slide-reveal"))           // view-timeline: --slide-reveal
/// .viewTimeline(.custom("--fade-in"), .block)        // view-timeline: --fade-in block
/// .viewTimeline(.custom("--rotate"), .inline)        // view-timeline: --rotate inline
/// .viewTimeline(.custom("--grow"), .x)               // view-timeline: --grow x
/// .viewTimeline(.none, .y)                           // view-timeline: none y
/// ```
///
/// - Note: By default, the timeline is at 0% when the subject is first visible at one edge of the
///         scroller and 100% when it reaches the opposite edge.
///
/// - SeeAlso: [MDN Web Docs on view-timeline](https://developer.mozilla.org/en-US/docs/Web/CSS/view-timeline)
public enum ViewTimeline: Property {

    public static let property: String = "view-timeline"

    /// Just a name for the timeline (axis defaults to .block)
    case name(ViewTimelineName)

    /// Name and axis for the timeline
    case nameAndAxis(ViewTimelineName, ViewTimelineAxis)

    /// Global values
    case global(CSSTypeTypes.Global)
}

/// CSS Output conversion
extension ViewTimeline: CustomStringConvertible {
    /// Converts the view-timeline value to its CSS string representation
    public var description: String {
        switch self {
        case .name(let name):
            return name.description

        case .nameAndAxis(let name, let axis):
            return "\(name) \(axis)"

        case .global(let global):
            return global.description
        }
    }
}

// Convenience initializers
extension ViewTimeline {
    /// Creates a view timeline with a custom name
    ///
    /// - Parameter name: The name for the timeline (with or without -- prefix)
    /// - Returns: A ViewTimeline with just the specified name
    public static func custom(_ name: String) -> Self {
        return .name(.custom(name))
    }

    /// Creates a view timeline with a custom name and specific axis
    ///
    /// - Parameters:
    ///   - name: The name for the timeline (with or without -- prefix)
    ///   - axis: The axis to track for the timeline
    /// - Returns: A ViewTimeline with the specified name and axis
    public static func custom(_ name: String, _ axis: ViewTimelineAxis) -> Self {
        return .nameAndAxis(.custom(name), axis)
    }
}
