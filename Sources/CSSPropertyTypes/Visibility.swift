//
//  Visibility.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import Foundation
import CSSTypeTypes

/// The CSS `visibility` property shows or hides an element without changing the layout of a document.
///
/// This property can also hide rows or columns in a `<table>`.
///
/// - Note: To both hide an element and remove it from the document layout, set the `display` property
///         to `none` instead of using `visibility`.
///
/// - SeeAlso: [MDN Web Docs on visibility](https://developer.mozilla.org/en-US/docs/Web/CSS/visibility)
public enum Visibility: Property {
    public static let property: String = "visibility"
    
    /// The element box is visible.
    case visible
    
    /// The element box is invisible (not drawn), but still affects layout as normal.
    /// Descendants of the element will be visible if they have visibility set to visible.
    /// The element cannot receive focus.
    case hidden
    
    /// For table rows/columns, flex items, and ruby annotations, hides the element and removes its space.
    /// For other elements, behaves the same as `hidden`.
    ///
    /// The behavior varies by element type:
    /// - For table rows, columns, column groups, and row groups: the space is removed but dimensions are still calculated
    /// - For flex items and ruby annotations: the space is removed
    /// - For other elements: behaves like `hidden`
    case collapse
    
    /// Global value
    case global(CSSTypeTypes.Global)
    
    
}

extension Visibility: CustomStringConvertible {
    public var description: String {
        switch self {
        case .visible: return "visible"
        case .hidden: return "hidden"
        case .collapse: return "collapse"
        case .global(let value): return value.description
        }
    }
}
