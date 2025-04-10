//
//  OverscrollBehaviorY.swift
//  swift-css
//
//  Created by Claude on 28/03/2025.
//

import Foundation
import CSSTypeTypes

/// The `overscroll-behavior-y` CSS property sets the browser's behavior when the vertical boundary 
/// of a scrolling area is reached.
///
/// This property allows you to control what happens when a user scrolls beyond the physical limits
/// of a scrollable element in the vertical direction.
///
/// Example:
/// ```css
/// overscroll-behavior-y: contain;
/// ```
public enum OverscrollBehaviorY: Property {
    public static let property: String = "overscroll-behavior-y"
    
    /// The default scroll overflow behavior occurs as normal
    case auto
    
    /// Default scroll overflow behavior (e.g., "bounce" effects) is observed inside the element
    /// where this value is set. However, no scroll chaining occurs on neighboring scrolling areas;
    /// the underlying elements will not scroll.
    case contain
    
    /// No scroll chaining occurs to neighboring scrolling areas, and default scroll overflow behavior is prevented
    case none
    
    /// Global CSS value
    case global(CSSTypeTypes.Global)
    
    public var description: String {
        switch self {
        case .auto: return "auto"
        case .contain: return "contain"
        case .none: return "none"
        case .global(let global): return global.description
        }
    }
}
