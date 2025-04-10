//
//  PositionAnchor.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 28/03/2025.
//

import Foundation
import CSSTypeTypes

/// The CSS `position-anchor` property specifies the anchor name of the anchor element that 
/// a positioned element is associated with.
///
/// This property is part of the CSS anchor positioning system which allows elements to be positioned
/// relative to other "anchor elements" in the document. The anchor-name property assigns an anchor name
/// to an element, and position-anchor creates an association with that anchor.
///
/// This property only applies to absolutely positioned elements (those with `position: absolute` or `fixed`).
///
/// Example:
/// ```swift
/// // Use the auto value (default)
/// .positionAnchor(.auto)
///
/// // Associate with a specific anchor name
/// .positionAnchor(.anchorName("--my-anchor"))
///
/// // Position an element relative to an anchor
/// div {
///   .anchorName("--popup-anchor")
/// }
///
/// popup {
///   .position(.fixed)
///   .positionAnchor(.anchorName("--popup-anchor"))
///   .left("anchor(right)")
///   .top("anchor(bottom)")
/// }
/// ```
///
/// - Note: This is an experimental property and support may be limited across browsers. 
///         If the associated anchor element is hidden, the positioned element using this anchor 
///         will not be displayed.
///
/// - SeeAlso: [MDN Web Docs on position-anchor](https://developer.mozilla.org/en-US/docs/Web/CSS/position-anchor)
public enum PositionAnchor: Property {
    public static let property: String = "position-anchor"
    
    /// Associates a positioned element with its implicit anchor element, if it has one
    /// (for example, as set by the non-standard HTML anchor attribute)
    case auto
    
    /// The name of the anchor element to associate the positioned element with
    case anchorName(DashedIdent)
    
    /// Global CSS values
    case global(CSSTypeTypes.Global)
    
    /// Creates a position anchor using a string value
    ///
    /// - Parameter name: The anchor name (with or without dashes)
    /// - Returns: A position anchor with the specified name
    public static func anchorName(_ name: String) -> PositionAnchor {
        .anchorName(DashedIdent(name))
    }
    
    public var description: String {
        switch self {
        case .auto:
            return "auto"
        case .anchorName(let name):
            return name.description
        case .global(let global):
            return global.description
        }
    }
}
