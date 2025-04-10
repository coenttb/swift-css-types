import Foundation
import CSSTypeTypes

//
//  PositionTryOrder.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import Foundation

/// The CSS `position-try-order` property allows you to specify criteria for selecting a fallback position
/// for anchor-positioned elements.
///
/// This property determines which position-try fallback option should be applied to an anchor-positioned
/// element when it first renders, based on criteria such as which option provides the most space.
///
/// Example:
/// ```swift
/// .positionTryOrder(.normal)         // position-try-order: normal
/// .positionTryOrder(.mostHeight)     // position-try-order: most-height
/// .positionTryOrder(.mostWidth)      // position-try-order: most-width
/// .positionTryOrder(.mostBlockSize)  // position-try-order: most-block-size
/// .positionTryOrder(.mostInlineSize) // position-try-order: most-inline-size
/// ```
///
/// - Note: This is an experimental property and may not be fully supported across all browsers.
///
/// - SeeAlso: [MDN Web Docs on position-try-order](https://developer.mozilla.org/en-US/docs/Web/CSS/position-try-order)
public enum PositionTryOrder: Property {
    public static let property: String = "position-try-order"
    
    /// Default value. No position-try fallback options will be tried when the element is first displayed.
    case normal
    
    /// Apply the fallback that gives the element's containing block the most height
    case mostHeight
    
    /// Apply the fallback that gives the element's containing block the most width
    case mostWidth
    
    /// Apply the fallback that gives the element's containing block the largest block size
    case mostBlockSize
    
    /// Apply the fallback that gives the element's containing block the largest inline size
    case mostInlineSize
    
    /// Global value
    case global(CSSTypeTypes.Global)
    
    public var description: String {
        switch self {
        case .normal:
            return "normal"
        case .mostHeight:
            return "most-height"
        case .mostWidth:
            return "most-width"
        case .mostBlockSize:
            return "most-block-size"
        case .mostInlineSize:
            return "most-inline-size"
        case .global(let global):
            return global.description
        }
    }
}
