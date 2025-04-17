//
//  WebkitBoxReflect.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 28/03/2025.
//

import Foundation
import CSSTypeTypes

/// The non-standard `-webkit-box-reflect` CSS property lets you reflect the content of an element
/// in one specific direction.
///
/// This property creates a reflection of an element's content in a specified direction with an
/// optional offset between the element and its reflection and an optional mask to create a gradient 
/// fade effect.
///
/// Example:
/// ```swift
/// // Basic reflection below the element
/// .webkitBoxReflect(.below)
///
/// // Reflection to the right with 10px offset
/// .webkitBoxReflect(.right(.px(10)))
///
/// // Reflection below with gradient mask for fading effect
/// .webkitBoxReflect(.below(.px(5), mask: .linearGradient("to bottom, rgba(0,0,0,0.5), transparent")))
/// ```
///
/// - Note: This is a non-standard property and may not be supported by all browsers.
///         Consider using alternative techniques like CSS transforms for production sites.
///
public enum WebkitBoxReflect: Property {
    
    public static let property: String = "-webkit-box-reflect"
    
    /// No reflection (default)
    case none
    
    /// Reflection appears above the element
    case above(Length? = nil, mask: ReflectionMask? = nil)
    
    /// Reflection appears below the element
    case below(Length? = nil, mask: ReflectionMask? = nil)
    
    /// Reflection appears to the left of the element
    case left(Length? = nil, mask: ReflectionMask? = nil)
    
    /// Reflection appears to the right of the element
    case right(Length? = nil, mask: ReflectionMask? = nil)
    
    /// Global CSS values
    case global(CSSTypeTypes.Global)
    
    /// Types of reflection masks
    public enum ReflectionMask: Sendable, Hashable {
        /// Linear gradient mask
        case linearGradient(CSSString)
        
        /// Radial gradient mask
        case radialGradient(CSSString)
        
        /// URL to an image used as mask
        case url(Url)
    }
    
    public var description: String {
        switch self {
        case .none:
            return "none"
            
        case .above(let offset, let mask):
            return buildDirectionString("above", offset, mask)
            
        case .below(let offset, let mask):
            return buildDirectionString("below", offset, mask)
            
        case .left(let offset, let mask):
            return buildDirectionString("left", offset, mask)
            
        case .right(let offset, let mask):
            return buildDirectionString("right", offset, mask)
            
        case .global(let global):
            return global.description
        }
    }
    
    private func buildDirectionString(_ direction: String, _ offset: Length?, _ mask: ReflectionMask?) -> String {
        var parts = [direction]
        
        if let offset = offset {
            parts.append(offset.description)
        }
        
        if let mask = mask {
            parts.append(maskDescription(mask))
        }
        
        return parts.joined(separator: " ")
    }
    
    private func maskDescription(_ mask: ReflectionMask) -> String {
        switch mask {
        case .linearGradient(let value):
            return "linear-gradient(\(value))"
        case .radialGradient(let value):
            return "radial-gradient(\(value))"
        case .url(let url):
            return url.description
        }
    }
}
