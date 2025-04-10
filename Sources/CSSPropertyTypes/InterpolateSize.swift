//
//  InterpolateSize.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 28/03/2025.
//

import Foundation
import CSSTypeTypes

/// The interpolate-size CSS property allows you to enable animations and
/// transitions between a <length-percentage> value and an intrinsic size value
/// such as auto, fit-content, or max-content.
///
/// This property is typically used to animate the width and/or height of a container
/// between a <length-percentage> and the full size of its content (i.e., between "closed"
/// and "open" or "hide" and "reveal" states) when animating a non-box-model CSS property,
/// such as transform, is not a viable solution.
///
/// Note: The behavior opted-into by interpolate-size cannot be enabled by default 
/// across the web because many sites in the wild use stylesheets that assume intrinsic 
/// size values cannot be animated.
///
/// Values that can be interpolated:
/// - auto
/// - min-content
/// - max-content
/// - fit-content
/// - content (for containers sized using flex-basis)
public enum InterpolateSize: Property {
    public static let property: String = "interpolate-size"
    
    /// The default behavior — intrinsic size values cannot be interpolated.
    case numericOnly
    
    /// Enables interpolation between a <length-percentage> value and an intrinsic size value,
    /// to allow animation between the two.
    case allowKeywords
    
    /// Global CSS values
    case global(CSSTypeTypes.Global)
    
    public var description: String {
        switch self {
        case .numericOnly:
            return "numeric-only"
        case .allowKeywords:
            return "allow-keywords"
        case .global(let global):
            return global.description
        }
    }
}
