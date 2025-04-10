//
//  TextEmphasisPosition.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import Foundation
import CSSTypeTypes

/// The CSS `text-emphasis-position` property sets where emphasis marks are drawn.
///
/// Similar to the text rendered by the <ruby> HTML element, if there isn't enough
/// room for emphasis marks, the line height is increased.
///
/// The preferred position of emphasis marks depends on the language:
/// - In Japanese, the preferred position is over right
/// - In Chinese, the preferred position is under right
///
/// - Note: The text-emphasis-position cannot be set, and therefore are not reset either,
///         using the text-emphasis shorthand property.
///
/// - SeeAlso: [MDN Web Docs on text-emphasis-position](https://developer.mozilla.org/en-US/docs/Web/CSS/text-emphasis-position)
public enum TextEmphasisPosition: Property {
    
    public static let property: String = "text-emphasis-position"
    
    /// Draws marks over the text in horizontal writing mode and to the right
    /// of the text in vertical writing mode.
    case auto
    
    /// Position with horizontal and optional vertical placement
    case position(HorizontalEmphasisPosition, VerticalEmphasisPosition?)
    
    /// Global value
    case global(CSSTypeTypes.Global)
    
    public var description: String {
        switch self {
        case .auto:
            return "auto"
        case .position(let horizontal, let vertical):
            if let vertical = vertical {
                return "\(horizontal.rawValue) \(vertical.rawValue)"
            }
            return horizontal.rawValue
        case .global(let global):
            return global.description
        }
    }
}

/// Horizontal position for emphasis marks
public enum HorizontalEmphasisPosition: String, Sendable, Equatable {
    /// Draws marks over the text in horizontal writing mode
    case over
    
    /// Draws marks under the text in horizontal writing mode
    case under
}

/// Vertical position for emphasis marks
public enum VerticalEmphasisPosition: String, Sendable, Equatable {
    /// Draws marks to the right of the text in vertical writing mode
    case right
    
    /// Draws marks to the left of the text in vertical writing mode
    case left
}

/// Convenience factories for common emphasis position values
extension TextEmphasisPosition {
    /// Emphasis marks over the text, right-side in vertical mode
    public static var overRight: TextEmphasisPosition {
        .position(.over, .right)
    }
    
    /// Emphasis marks over the text, left-side in vertical mode
    public static var overLeft: TextEmphasisPosition {
        .position(.over, .left)
    }
    
    /// Emphasis marks under the text, right-side in vertical mode
    public static var underRight: TextEmphasisPosition {
        .position(.under, .right)
    }
    
    /// Emphasis marks under the text, left-side in vertical mode
    public static var underLeft: TextEmphasisPosition {
        .position(.under, .left)
    }
    
    /// Emphasis marks over the text (with default right-side in vertical mode)
    public static var over: TextEmphasisPosition {
        .position(.over, nil)
    }
    
    /// Emphasis marks under the text (with default right-side in vertical mode)
    public static var under: TextEmphasisPosition {
        .position(.under, nil)
    }
}
