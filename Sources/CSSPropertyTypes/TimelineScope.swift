import CSSTypeTypes
import Foundation

/// The CSS `timeline-scope` property modifies the scope of a named animation timeline.
///
/// By default, a named timeline can only be set as the controlling timeline of a direct descendant element.
/// The `timeline-scope` property can increase this scope, allowing the timeline to control animations on
/// the element it's set on and any of its descendants.
///
/// Example:
/// ```swift
/// .timelineScope(.none)                     // timeline-scope: none
/// .timelineScope(.all)                      // timeline-scope: all
/// .timelineScope(.custom("--my-timeline"))  // timeline-scope: --my-timeline
/// .timelineScope(.multiple([                // timeline-scope: --timeline1 --timeline2
///   DashedIdent("--timeline1"),
///   DashedIdent("--timeline2")
/// ]))
/// ```
///
/// - Note: If no timeline exists with the name given for the timeline-scope value, an inactive
///         timeline with the specified name is created.
///
/// - SeeAlso: [MDN Web Docs on timeline-scope](https://developer.mozilla.org/en-US/docs/Web/CSS/timeline-scope)
public enum TimelineScope: Property {
    public static let property: String = "timeline-scope"

    /// There is no change in timeline scope
    case none

    /// Makes all named timelines visible to the element and all its descendants
    case all

    /// A single timeline that will be visible to the element and all its descendants
    case custom(DashedIdent)

    /// Multiple timelines that will be visible to the element and all its descendants
    case multiple([DashedIdent])

    /// Global values
    case global(CSSTypeTypes.Global)
}

/// CSS Output conversion
extension TimelineScope: CustomStringConvertible {
    /// Converts the timeline-scope value to its CSS string representation
    public var description: String {
        switch self {
        case .none:
            return "none"

        case .all:
            return "all"

        case .custom(let ident):
            return ident.description

        case .multiple(let idents):
            return idents.map { $0.description }.joined(separator: " ")

        case .global(let global):
            return global.description
        }
    }
}

// Convenience initializers
extension TimelineScope {
    /// Creates a timeline scope with a custom name
    ///
    /// - Parameter name: The name of the timeline (with or without -- prefix)
    /// - Returns: A TimelineScope with the specified timeline name
    public static func custom(_ name: String) -> Self {
        return .custom(DashedIdent(name))
    }

    /// Creates a timeline scope with multiple timeline names
    ///
    /// - Parameter names: The names of the timelines (with or without -- prefix)
    /// - Returns: A TimelineScope with the specified timeline names
    public static func multiple(_ names: [String]) -> Self {
        return .multiple(names.map { DashedIdent($0) })
    }
}
