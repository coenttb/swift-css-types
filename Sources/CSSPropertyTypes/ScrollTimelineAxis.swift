//
// ScrollTimelineAxis.swift


import CSSTypeTypes

/// The `scroll-timeline-axis` CSS property specifies the scrollbar direction that will be used to provide the
/// timeline for a named scroll progress timeline animation, which is progressed through by scrolling a scrollable
/// element (scroller) between top and bottom (or left and right).
///
/// Note: If the scroller element does not overflow its container in the axis dimension or if the overflow
/// is hidden or clipped, no scroll progress timeline will be created.
///
/// ```css
/// scroll-timeline-axis: block;
/// scroll-timeline-axis: inline;
/// scroll-timeline-axis: y;
/// scroll-timeline-axis: x;
/// ```
public enum ScrollTimelineAxis: Property {
    public static let property: String = "scroll-timeline-axis"
    
    /// The axis for scrollbar-driven timeline
    public enum Axis: String {
        /// The block axis (vertical for horizontal writing modes)
        case block
        
        /// The inline axis (horizontal for horizontal writing modes)
        case inline
        
        /// The vertical (y) axis
        case y
        
        /// The horizontal (x) axis
        case x
    }
    
    /// The axis for the scroll timeline
    case axis(Axis)
    
    /// Global CSS value
    case global(CSSTypeTypes.Global)
    
    public var description: String {
        switch self {
        case .axis(let axis):
            return axis.rawValue
        case .global(let global):
            return global.description
        }
    }
    
    /// The block axis (vertical for horizontal writing modes)
    public static let block: Self = .axis(.block)
    
    /// The inline axis (horizontal for horizontal writing modes)
    public static let inline: Self = .axis(.inline)
    
    /// The vertical (y) axis
    public static let y: Self = .axis(.y)
    
    /// The horizontal (x) axis
    public static let x: Self = .axis(.x)
}
