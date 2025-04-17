import Foundation
import CSSTypeTypes

/// The CSS animation-timeline property specifies the timeline that is used to control
/// the progress of a CSS animation.
///
/// Example:
/// ```swift
/// .animationTimeline(.none)                // animation-timeline: none
/// .animationTimeline(.auto)                // animation-timeline: auto
/// .animationTimeline(.named("--timeline")) // animation-timeline: --timeline
/// .animationTimeline(.scroll())            // animation-timeline: scroll()
/// .animationTimeline(.scroll(.nearest, .block)) // animation-timeline: scroll(nearest block)
/// .animationTimeline(.view())             // animation-timeline: view()
/// ```
///
/// - Note: This is an experimental property and browser support may be limited.
///
/// - SeeAlso: [MDN Web Docs on animation-timeline](https://developer.mozilla.org/en-US/docs/Web/CSS/animation-timeline)
public enum AnimationTimeline: Property {
    public static let property: String = "animation-timeline"
    /// Animation is not associated with a timeline
    case none
    
    /// The animation's timeline is the document's default DocumentTimeline
    case auto
    
    /// A named timeline previously declared with scroll-timeline-name or view-timeline-name
    case named(DashedIdent)
    
    /// An anonymous scroll progress timeline
    case scroll(ScrollerValue? = nil, ScrollAxis? = nil)
    
    /// An anonymous view progress timeline
    case view(ScrollAxis? = nil, ViewTimelineInset? = nil)
    
    /// Global values
    case global(CSSTypeTypes.Global)
}

/// Scroller values for anonymous scroll progress timelines
public enum ScrollerValue: String, Sendable, Hashable, CaseIterable {
    /// Document root as a scroller
    case root
    
    /// Nearest scrollable ancestor
    case nearest
    
    /// The element itself
    case `self`
}

/// Scroll axis options for timelines
public enum ScrollAxis: String, Sendable, Hashable, CaseIterable {
    /// Block direction (typically vertical)
    case block
    
    /// Inline direction (typically horizontal)
    case inline
    
    /// Horizontal (x-axis)
    case x
    
    /// Vertical (y-axis)
    case y
}

/// CSS Output conversion
extension AnimationTimeline: CustomStringConvertible {
    /// Converts the animation timeline to its CSS string representation
    public var description: String {
        switch self {
        case .none:
            return "none"
        case .auto:
            return "auto"
        case .named(let name):
            return name.description
        case .scroll(let scroller, let axis):
            var params: [String] = []
            if let scroller = scroller {
                params.append(scroller.rawValue)
            }
            if let axis = axis {
                params.append(axis.rawValue)
            }
            return "scroll(\(params.joined(separator: " ")))"
        case .view(let axis, let inset):
            var params: [String] = []
            if let axis = axis {
                params.append(axis.rawValue)
            }
            if let inset = inset {
                params.append(inset.description)
            }
            return "view(\(params.joined(separator: " ")))"
        case .global(let global):
            return global.description
        }
    }
}
