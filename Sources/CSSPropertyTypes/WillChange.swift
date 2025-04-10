//
//  WillChange.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import Foundation
import CSSTypeTypes

/// The CSS `will-change` property hints to browsers how an element is expected to change.
///
/// This allows browsers to set up optimizations before an element is actually changed,
/// potentially increasing responsiveness by doing expensive work before it's actually required.
///
/// - Warning: `will-change` is intended to be used as a last resort, in order to deal with existing 
///            performance problems. It should not be used to anticipate performance problems.
///
/// Proper usage guidelines:
/// - Don't apply to too many elements
/// - Use sparingly
/// - Don't use for premature optimization
/// - Give the browser sufficient time to apply optimizations
/// - Be aware that it may influence visual appearance by creating a stacking context
///
/// - SeeAlso: [MDN Web Docs on will-change](https://developer.mozilla.org/en-US/docs/Web/CSS/will-change)
public enum WillChange: Property {
    public static let property: String = "will-change"
    
    /// Default value. No particular intent is expressed.
    /// The user agent should apply whatever heuristics and optimizations it normally does.
    case auto
    
    /// Indicates that the author expects to animate or change the scroll position of the element.
    case scrollPosition
    
    /// Indicates that the author expects to animate or change something about the element's contents.
    case contents
    
    /// Lists one or more properties the author expects to animate or change.
    /// Example: ["transform", "opacity"]
    case properties([String])
    
    /// Global value
    case global(CSSTypeTypes.Global)
    
    public var description: String {
        switch self {
        case .auto:
            return "auto"
        case .scrollPosition:
            return "scroll-position"
        case .contents:
            return "contents"
        case .properties(let props):
            return props.joined(separator: ", ")
        case .global(let global):
            return global.description
        }
    }
}

