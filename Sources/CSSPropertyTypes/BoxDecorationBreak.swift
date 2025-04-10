//
//  BoxDecorationBreak.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import Foundation
import CSSTypeTypes

/// The CSS `box-decoration-break` property specifies how an element's fragments should be rendered 
/// when broken across multiple lines, columns, or pages.
///
/// This property affects the appearance of several other properties when elements are fragmented:
/// - background
/// - border
/// - border-image
/// - box-shadow
/// - clip-path
/// - margin
/// - padding
///
/// - SeeAlso: [MDN Web Docs on box-decoration-break](https://developer.mozilla.org/en-US/docs/Web/CSS/box-decoration-break)
public enum BoxDecorationBreak: Property {
    public static let property: String = "border-decoration-break"
    /// The element is rendered as if its box were not fragmented, then the rendering is sliced
    /// into pieces for each line/column/page. This is the default behavior.
    case slice
    
    /// Each box fragment is rendered independently with the specified border, padding, and margin.
    /// The border-radius, border-image, and box-shadow are applied to each fragment independently.
    case clone
    
    /// Global CSS values
    case global(CSSTypeTypes.Global)
    
    /// String representation of the box-decoration-break
    public var description: String {
        switch self {
        case .slice:
            return "slice"
        case .clone:
            return "clone"
        case .global(let global):
            return global.description
        }
    }
}
