//
//  TransitionBehavior.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import Foundation
import CSSTypeTypes

/// The CSS `transition-behavior` property specifies whether transitions will be started for
/// properties whose animation behavior is discrete.
///
/// Discrete properties are those that can't be smoothly animated (e.g., display, visibility).
/// This property allows you to control whether these properties should attempt to transition.
///
/// Example:
/// ```swift
/// .transitionBehavior(.allowDiscrete) // transition-behavior: allow-discrete
/// .transitionBehavior(.normal)        // transition-behavior: normal
/// ```
///
/// - SeeAlso: [MDN Web Docs on transition-behavior](https://developer.mozilla.org/en-US/docs/Web/CSS/transition-behavior)
public enum TransitionBehavior: Property {
    public static let property: String = "transition-behavior"
    /// Allow transitions for discrete properties
    case allowDiscrete
    
    /// Do not allow transitions for discrete properties (default)
    case normal
    
    /// Global value
    case global(CSSTypeTypes.Global)
    
    public var description: String {
        switch self {
        case .allowDiscrete:
            return "allow-discrete"
        case .normal:
            return "normal"
        case .global(let global):
            return global.description
        }
    }
}
