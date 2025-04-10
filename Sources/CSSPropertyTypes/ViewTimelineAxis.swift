import Foundation
import CSSTypeTypes

/// The CSS view-timeline-axis property specifies the scrollbar direction that provides the timeline
/// for a named view progress timeline animation, which is progressed based on the visibility of a subject
/// element inside a scrollable element.
///
/// Example:
/// ```swift
/// .viewTimelineAxis(.block)     // view-timeline-axis: block
/// .viewTimelineAxis(.inline)    // view-timeline-axis: inline
/// .viewTimelineAxis(.y)         // view-timeline-axis: y
/// .viewTimelineAxis(.x)         // view-timeline-axis: x
/// ```
///
/// - Note: If the scroller element doesn't overflow its container in the axis dimension or if the overflow
///         is hidden or clipped, no scroll progress timeline will be created.
///
/// - SeeAlso: [MDN Web Docs on view-timeline-axis](https://developer.mozilla.org/en-US/docs/Web/CSS/view-timeline-axis)
public enum ViewTimelineAxis: Property {
    
    public static let property: String = "view-timeline-axis"
    
    /// The scrollbar on the block axis of the scroller element
    /// For horizontal writing modes (like English), this is the same as y (vertical)
    /// For vertical writing modes, this is the same as x (horizontal)
    case block
    
    /// The scrollbar on the inline axis of the scroller element
    /// For horizontal writing modes (like English), this is the same as x (horizontal)
    /// For vertical writing modes, this is the same as y (vertical)
    case inline
    
    /// The scrollbar on the vertical axis of the scroller element
    case y
    
    /// The scrollbar on the horizontal axis of the scroller element
    case x
    
    /// Global values
    case global(CSSTypeTypes.Global)
}

/// CSS Output conversion
extension ViewTimelineAxis: CustomStringConvertible {
    /// Converts the view-timeline-axis value to its CSS string representation
    public var description: String {
        switch self {
        case .block:
            return "block"
            
        case .inline:
            return "inline"
            
        case .y:
            return "y"
            
        case .x:
            return "x"
            
        case .global(let global):
            return global.description
        }
    }
}
