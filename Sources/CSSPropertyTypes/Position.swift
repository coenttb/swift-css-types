//
//  Position.swift
//  swift-css
//
//  Created by Claude on 28/03/2025.
//

import Foundation
import CSSTypeTypes

/// The `position` CSS property sets how an element is positioned in a document.
///
/// The top, right, bottom, and left properties determine the final location of positioned elements.
/// Different positioning models create different effects for elements and their children.
///
/// Example:
/// ```css
/// position: relative;
/// position: absolute;
/// position: sticky;
/// ```
public enum Position: Property {
    public static let property: String = "position"
    
    /// The element is positioned according to the normal flow of the document.
    /// The top, right, bottom, left, and z-index properties have no effect.
    case `static`
    
    /// The element is positioned according to the normal flow of the document, and then offset
    /// relative to itself based on the values of top, right, bottom, and left.
    case relative
    
    /// The element is removed from the normal document flow, and no space is created for the element.
    /// It is positioned relative to its closest positioned ancestor or to the initial containing block.
    case absolute
    
    /// The element is removed from the normal document flow. It is positioned relative to its initial
    /// containing block, which is the viewport in the case of visual media.
    case fixed
    
    /// The element is positioned according to the normal flow of the document, and then offset relative
    /// to its nearest scrolling ancestor and containing block. The element "sticks" when scrolled.
    case sticky
    
    /// Global CSS value
    case global(CSSTypeTypes.Global)
    
    public var description: String {
        switch self {
        case .static: return "static"
        case .relative: return "relative"
        case .absolute: return "absolute"
        case .fixed: return "fixed"
        case .sticky: return "sticky"
        case .global(let global): return global.description
        }
    }
}
