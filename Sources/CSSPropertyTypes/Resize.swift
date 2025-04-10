//
//  Resize.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import Foundation
import CSSTypeTypes

/// The CSS `resize` property sets whether an element is resizable, and if so, in which directions.
///
/// This property applies to elements with `overflow` other than `visible` or `clip`,
/// and optionally to replaced elements (like images, videos) and iframes.
///
/// Example:
/// ```swift
/// .resize(.both)        // resize: both
/// .resize(.horizontal)  // resize: horizontal
/// .resize(.vertical)    // resize: vertical
/// .resize(.none)        // resize: none
/// ```
///
/// - Note: This property doesn't apply to inline elements or block elements with `overflow: visible` or `overflow: clip`.
///
/// - SeeAlso: [MDN Web Docs on resize](https://developer.mozilla.org/en-US/docs/Web/CSS/resize)
public enum Resize: Property {
    public static let property: String = "resize"
    
    /// Element can't be resized by the user
    case none
    
    /// Element can be resized both horizontally and vertically
    case both
    
    /// Element can only be resized horizontally
    case horizontal
    
    /// Element can only be resized vertically
    case vertical
    
    /// Element can be resized in the block direction (depends on writing mode)
    case block
    
    /// Element can be resized in the inline direction (depends on writing mode)
    case inline
    
    /// Global value
    case global(CSSTypeTypes.Global)
    
    public var description: String {
        switch self {
        case .none:
            return "none"
        case .both:
            return "both"
        case .horizontal:
            return "horizontal"
        case .vertical:
            return "vertical"
        case .block:
            return "block"
        case .inline:
            return "inline"
        case .global(let global):
            return global.description
        }
    }
}
