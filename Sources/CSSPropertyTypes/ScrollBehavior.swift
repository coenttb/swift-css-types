//
//  ScrollBehavior.swift
//  swift-css
//
//  Created by Claude on 28/03/2025.
//

import Foundation
import CSSTypeTypes

/// The `scroll-behavior` CSS property sets the behavior for a scrolling box when scrolling
/// is triggered by the navigation or CSSOM scrolling APIs.
///
/// This property affects how programmatic scrolling behaves, but user-initiated scrolling
/// is not affected.
///
/// Example:
/// ```css
/// scroll-behavior: smooth;    /* Enable smooth scrolling for programmatic scrolls */
/// ```
public enum ScrollBehavior: Property {
    public static let property: String = "scroll-behavior"
    
    /// The scrolling box scrolls instantly
    case auto
    
    /// The scrolling box scrolls in a smooth fashion using a user-agent-defined
    /// timing function over a user-agent-defined period of time
    case smooth
    
    /// Global CSS value
    case global(CSSTypeTypes.Global)
    
    public var description: String {
        switch self {
        case .auto: return "auto"
        case .smooth: return "smooth"
        case .global(let global): return global.description
        }
    }
}
