//
//  PointerEvents.swift
//  swift-css
//
//  Created by Claude on 28/03/2025.
//

import Foundation
import CSSTypeTypes

/// The `pointer-events` CSS property sets under what circumstances (if any)
/// a particular graphic element can become the target of pointer events.
///
/// This property is commonly used to control whether an element can be clicked, dragged,
/// or receive other mouse/touch interactions.
///
/// Example:
/// ```css
/// pointer-events: none; /* Element won't receive pointer events */
/// pointer-events: auto; /* Default behavior */
/// ```
public enum PointerEvents: Property {
    public static let property: String = "pointer-events"
    
    /// The element behaves as it would if the pointer-events property were not specified
    case auto
    
    /// The element is never the target of pointer events; clicks, touches, and hovers "pass through"
    case none
    
    // SVG-specific values (these are less commonly used in general CSS)
    
    /// SVG: Element receives pointer events when visibility is set to visible and when the mouse cursor
    /// is over a painted area (fill or stroke with non-none value)
    case visiblePainted
    
    /// SVG: Element receives pointer events when visibility is set to visible and the mouse cursor
    /// is over the interior (fill)
    case visibleFill
    
    /// SVG: Element receives pointer events when visibility is set to visible and the mouse cursor
    /// is over the perimeter (stroke)
    case visibleStroke
    
    /// SVG: Element receives pointer events when visibility is set to visible
    case visible
    
    /// SVG: Element receives pointer events when the mouse cursor is over a painted area
    case painted
    
    /// SVG: Element receives pointer events when the mouse cursor is over the interior (fill)
    case fill
    
    /// SVG: Element receives pointer events when the mouse cursor is over the perimeter (stroke)
    case stroke
    
    /// SVG: Element receives pointer events when the mouse cursor is over the bounding box
    case boundingBox
    
    /// SVG: Element receives pointer events when the mouse cursor is over any part of the element
    case all
    
    /// Global CSS value
    case global(CSSTypeTypes.Global)
    
    public var description: String {
        switch self {
        case .auto: return "auto"
        case .none: return "none"
        case .visiblePainted: return "visiblePainted"
        case .visibleFill: return "visibleFill"
        case .visibleStroke: return "visibleStroke"
        case .visible: return "visible"
        case .painted: return "painted"
        case .fill: return "fill"
        case .stroke: return "stroke"
        case .boundingBox: return "bounding-box"
        case .all: return "all"
        case .global(let global): return global.description
        }
    }
}
