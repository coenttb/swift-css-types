//
//  BorderBlockWidth.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import Foundation
import CSSTypeTypes

/// The CSS `border-block-width` property defines the width of the logical block borders of an element.
///
/// This property maps to physical border widths depending on the element's writing mode, directionality, 
/// and text orientation. It corresponds to the border-top-width and border-bottom-width, or border-left-width 
/// and border-right-width properties depending on writing-mode, direction, and text-orientation.
///
/// - SeeAlso: [MDN Web Docs on border-block-width](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-width)
public enum BorderBlockWidth: Property {
    
    public static let property: String = "border-block-width"
    
    /// A single width for both block-start and block-end borders
    case all(BorderWidth.Width)
    
    /// Different widths for block-start and block-end borders
    case startEnd(BorderWidth.Width, BorderWidth.Width)
    
    /// Global CSS values
    case global(CSSTypeTypes.Global)
    
    /// Creates a border block width with the same value for both start and end
    ///
    /// - Parameter width: The width for both block borders
    public init(_ width: BorderWidth.Width) {
        self = .all(width)
    }
    
    /// Creates a border block width with different values for start and end
    ///
    /// - Parameters:
    ///   - start: The width for the block-start border
    ///   - end: The width for the block-end border
    public init(start: BorderWidth.Width, end: BorderWidth.Width) {
        self = .startEnd(start, end)
    }
    
    public var description: String {
        switch self {
        case .all(let width):
            return width.description
        case .startEnd(let start, let end):
            return "\(start.description) \(end.description)"
        case .global(let global):
            return global.description
        }
    }
}

/// Convenience methods for creating BorderBlockWidth values
extension BorderBlockWidth {
    /// The default border width (medium)
    public static let `default` = BorderBlockWidth(.medium)
    
    /// Creates a thin border width on both block sides
    public static let thin = BorderBlockWidth(.thin)
    
    /// Creates a medium border width on both block sides
    public static let medium = BorderBlockWidth(.medium)
    
    /// Creates a thick border width on both block sides
    public static let thick = BorderBlockWidth(.thick)
    
    /// Creates a border width with a specific pixel value on both block sides
    ///
    /// - Parameter px: The width in pixels
    /// - Returns: A border width with the specified pixel value
    public static func px(_ px: Double) -> BorderBlockWidth {
        return BorderBlockWidth(.px(px))
    }
    
    /// Creates a border width with a specific em value on both block sides
    ///
    /// - Parameter em: The width in ems
    /// - Returns: A border width with the specified em value
    public static func em(_ em: Double) -> BorderBlockWidth {
        return BorderBlockWidth(.em(em))
    }
    
    /// Creates a border width with a specific rem value on both block sides
    ///
    /// - Parameter rem: The width in rems
    /// - Returns: A border width with the specified rem value
    public static func rem(_ rem: Double) -> BorderBlockWidth {
        return BorderBlockWidth(.rem(rem))
    }
}
