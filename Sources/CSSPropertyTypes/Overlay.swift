//
//  Overlay.swift
//  swift-css
//
//  Created by Claude on 28/03/2025.
//

import CSSTypeTypes
import Foundation

/// The `overlay` CSS property specifies whether an element appearing in the top layer 
/// (for example, a shown popover or modal dialog element) is actually rendered in the top layer.
///
/// This property is primarily relevant within a list of transition-property values, and 
/// only if allow-discrete is set as the transition-behavior.
///
/// Note: This property can only be set by the browser - author styles cannot directly change 
/// the overlay value of any element. However, you can add overlay to the list of transition 
/// properties set on an element to defer its removal from the top layer for animation.
///
/// Example:
/// ```css
/// transition: opacity 0.7s, overlay 0.7s allow-discrete;
/// ```
public enum Overlay: Property {
    public static let property: String = "overlay"

    /// The element is rendered in the top layer if it is promoted to the top layer
    case auto

    /// The element is not rendered in the top layer
    case none

    /// Global CSS value
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .auto: return "auto"
        case .none: return "none"
        case .global(let global): return global.description
        }
    }
}
