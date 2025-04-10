//
// ScrollTimeline.swift


import CSSTypeTypes

/// The `scroll-timeline` CSS shorthand property defines a named scroll progress timeline, which is progressed
/// through by scrolling a scrollable element (scroller) between top and bottom (or left and right).
///
/// This property is set on the scroller that will provide the timeline. The starting scroll position represents
/// 0% progress and the ending scroll position represents 100% progress. If the 0% position and 100% position
/// coincide (i.e., the scroll container has no overflow to scroll), the timeline is inactive.
///
/// The name is then referenced in an `animation-timeline` declaration to indicate the container's element that
/// is used to drive the progress of the animation through the scrolling action.
///
/// ```css
/// scroll-timeline: --custom_name_for_timeline block;
/// scroll-timeline: --custom_name_for_timeline inline;
/// scroll-timeline: --timeline_name y;
/// scroll-timeline: none;
/// scroll-timeline: --timeline_name;
/// ```
public enum ScrollTimeline: Property {
    public static let property: String = "scroll-timeline"
    
    /// Custom identifier for a timeline name (must start with --)
    public struct CustomIdent: RawRepresentable, Equatable, CustomStringConvertible {
        public var rawValue: String
        
        public init(rawValue: String) {
            // Ensure the identifier starts with -- as per CSS custom property convention
            if rawValue.hasPrefix("--") {
                self.rawValue = rawValue
            } else {
                self.rawValue = "--" + rawValue
            }
        }
        
        public var description: String {
            return rawValue
        }
    }
    
    /// No named timeline
    case none
    
    /// A named timeline with a custom identifier
    case name(CustomIdent)
    
    /// A named timeline with a custom identifier and specific axis
    case nameAndAxis(CustomIdent, ScrollTimelineAxis.Axis)
    
    /// Global CSS value
    case global(CSSTypeTypes.Global)
    
    public var description: String {
        switch self {
        case .none:
            return "none"
        case .name(let name):
            return name.description
        case .nameAndAxis(let name, let axis):
            return "\(name.description) \(axis.rawValue)"
        case .global(let global):
            return global.description
        }
    }
    
    /// Creates a ScrollTimeline with a specific name
    /// - Parameter name: The name for the timeline (will be prefixed with -- if not already)
    /// - Returns: A ScrollTimeline with the specified name
    public static func named(_ name: String) -> Self {
        .name(CustomIdent(rawValue: name))
    }
    
    /// Creates a ScrollTimeline with a specific name and axis
    /// - Parameters:
    ///   - name: The name for the timeline (will be prefixed with -- if not already)
    ///   - axis: The axis for the scroll timeline
    /// - Returns: A ScrollTimeline with the specified name and axis
    public static func named(_ name: String, axis: ScrollTimelineAxis.Axis) -> Self {
        .nameAndAxis(CustomIdent(rawValue: name), axis)
    }
}
