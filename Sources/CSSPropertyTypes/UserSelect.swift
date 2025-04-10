//
//  UserSelect.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import Foundation
import CSSTypeTypes

/// The CSS `user-select` property controls whether the user can select text.
///
/// This property doesn't have any effect on content loaded as part of a browser's
/// user interface (its chrome), except in textboxes.
///
/// - Note: This property is not inherited according to the specification, though the initial `auto` value
///         makes it behave like it is inherited most of the time. Some browsers implement it as inherited.
///
/// - SeeAlso: [MDN Web Docs on user-select](https://developer.mozilla.org/en-US/docs/Web/CSS/user-select)
public enum UserSelect: Property {
    
    public static let property: String = "user-select"
    
    /// The text of the element and its sub-elements is not selectable.
    /// Note that the Selection object can contain these elements.
    case none
    
    /// Default value. The element behaves according to the used value rules,
    /// generally allowing text selection.
    case auto
    
    /// The text can be selected by the user.
    case text
    
    /// The content of the element shall be selected atomically:
    /// If a selection would contain part of the element, then the selection
    /// must contain the entire element including all its descendants.
    case all
    
    /// Global value
    case global(CSSTypeTypes.Global)
    
    public var description: String {
        switch self {
        case .none: return "none"
        case .auto: return "auto"
        case .text: return "text"
        case .all: return "all"
        case .global(let global): return global.description
        }
    }
}
