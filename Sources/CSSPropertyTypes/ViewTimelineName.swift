import Foundation
import CSSTypeTypes

/// The CSS view-timeline-name property defines the name of a named view progress timeline, which
/// is progressed through based on the change in visibility of an element (subject) inside a scrollable
/// element (scroller).
///
/// By default, the timeline is at 0% when the subject is first visible at one edge of the scroller
/// and 100% when it reaches the opposite edge. The name is referenced in an animation-timeline
/// declaration to indicate the element that will be animated as the timeline progresses.
///
/// Example:
/// ```swift
/// .viewTimelineName(.none)                     // view-timeline-name: none
/// .viewTimelineName(.custom("--slide-in"))     // view-timeline-name: --slide-in
/// .viewTimelineName(.custom("--fade-out"))     // view-timeline-name: --fade-out
/// ```
///
/// - Note: If the element does not overflow its container in the axis dimension or if the overflow is
///         hidden or clipped, no timeline will be created.
///
/// - SeeAlso: [MDN Web Docs on view-timeline-name](https://developer.mozilla.org/en-US/docs/Web/CSS/view-timeline-name)
public enum ViewTimelineName: Property {
    
    public static let property: String = "view-timeline-name"
    
    /// The timeline has no name
    case none
    
    /// An arbitrary custom identifier defining a name for a view progress timeline
    case custom(DashedIdent)
    
    /// Global values
    case global(CSSTypeTypes.Global)
}

/// CSS Output conversion
extension ViewTimelineName: CustomStringConvertible {
    /// Converts the view-timeline-name value to its CSS string representation
    public var description: String {
        switch self {
        case .none:
            return "none"
            
        case .custom(let ident):
            return ident.description
            
        case .global(let global):
            return global.description
        }
    }
}

// Convenience initializers
extension ViewTimelineName {
    /// Creates a custom view timeline name
    ///
    /// - Parameter name: The name to use for the view timeline (with or without -- prefix)
    /// - Returns: A ViewTimelineName with the specified dashed identifier
    public static func custom(_ name: String) -> Self {
        return .custom(DashedIdent(name))
    }
}
