//
//  WebkitTextStroke.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 28/03/2025.
//

import Foundation
import CSSTypeTypes

/// The CSS `-webkit-text-stroke` property is a shorthand that sets the width and color of strokes
/// for text characters in a single declaration.
///
/// This property is a shorthand for `-webkit-text-stroke-width` and `-webkit-text-stroke-color`,
/// allowing you to set both properties at once. It's used to create outlined text effects.
///
/// Example:
/// ```swift
/// // Set a 2px red stroke
/// .webkitTextStroke(.width(.px(2)), .color(.red))
///
/// // Set a thin black stroke
/// .webkitTextStroke(.width(.thin), .color(.black))
///
/// // Set a medium stroke with current text color
/// .webkitTextStroke(.width(.medium))
///
/// // Set a stroke with just a color (uses default width)
/// .webkitTextStroke(.color(.blue))
/// ```
///
/// - Note: While this is a non-standard WebKit property, it's widely supported across modern browsers
///         and commonly used to create outlined text effects. There's currently no standard CSS
///         alternative for creating text outlines.
///
/// - SeeAlso: [MDN Web Docs on -webkit-text-stroke](https://developer.mozilla.org/en-US/docs/Web/CSS/-webkit-text-stroke)
public enum WebkitTextStroke: Property {
    public static let property: String = "-webkit-text-stroke"
    /// Specifies both width and color for the text stroke
    case stroke(width: StrokeWidth? = nil, color: StrokeColor? = nil)
    
    /// Global CSS value
    case global(CSSTypeTypes.Global)
    
    /// Width value for the text stroke
    public enum StrokeWidth: Sendable, Hashable, CustomStringConvertible {
        /// Thin stroke width
        case thin
        
        /// Medium stroke width
        case medium
        
        /// Thick stroke width
        case thick
        
        /// Custom length value
        case length(Length)
        
        public var description: String {
            switch self {
            case .thin:
                return "thin"
            case .medium:
                return "medium"
            case .thick:
                return "thick"
            case .length(let length):
                return length.description
            }
        }
    }
    
    /// Color value for the text stroke
    public enum StrokeColor: Sendable, Hashable, CustomStringConvertible, ColorConvertible {
        /// Specific color value
        case color(CSSTypeTypes.Color)
        
        /// Current text color
        case currentColor
        
        public var description: String {
            switch self {
            case .color(let color):
                return color.description
            case .currentColor:
                return "currentColor"
            }
        }
    }
    
    /// Creates a WebkitTextStroke with just a width
    ///
    /// - Parameter width: The stroke width
    /// - Returns: A WebkitTextStroke with the specified width
    public static func width(_ width: StrokeWidth) -> WebkitTextStroke {
        .stroke(width: width)
    }
    
    /// Creates a WebkitTextStroke with just a color
    ///
    /// - Parameter color: The stroke color
    /// - Returns: A WebkitTextStroke with the specified color
    public static func color(_ color: CSSTypeTypes.Color) -> WebkitTextStroke {
        .stroke(color: .color(color))
    }
    
    /// Creates a WebkitTextStroke with a width and color
    ///
    /// - Parameters:
    ///   - width: The stroke width
    ///   - color: The stroke color
    /// - Returns: A WebkitTextStroke with the specified width and color
    public static func stroke(_ width: StrokeWidth, _ color: StrokeColor) -> WebkitTextStroke {
        .stroke(width: width, color: color)
    }
    
    public var description: String {
        switch self {
        case .stroke(let width, let color):
            var parts: [String] = []
            
            if let width = width {
                parts.append(width.description)
            }
            
            if let color = color {
                parts.append(color.description)
            }
            
            return parts.isEmpty ? "initial" : parts.joined(separator: " ")
            
        case .global(let global):
            return global.description
        }
    }
}
