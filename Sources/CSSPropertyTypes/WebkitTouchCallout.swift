//
//  WebkitTouchCallout.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 28/03/2025.
//

import Foundation
import CSSTypeTypes

/// The CSS `-webkit-touch-callout` property controls the display of the default callout shown
/// when you touch and hold a touch target on iOS devices.
///
/// When a target (like a link) is touched and held on iOS, Safari displays a callout with information
/// about the link. This property allows disabling that behavior, which can be useful for custom
/// menus, image-saving prevention, or creating a more app-like experience.
///
/// Example:
/// ```swift
/// // Disable the touch callout
/// .webkitTouchCallout(.none)
///
/// // Show the default touch callout
/// .webkitTouchCallout(.default)
/// ```
///
/// - Note: This is a non-standard WebKit property primarily supported on iOS Safari and
///         iOS WebView. It does not affect other browsers or platforms. For cross-browser
///         solutions, consider using user-select or pointer-events for similar effects.
///
/// - SeeAlso: [Safari CSS Reference on -webkit-touch-callout](https://developer.apple.com/library/archive/documentation/AppleApplications/Reference/SafariCSSRef/Articles/StandardCSSProperties.html)
public enum WebkitTouchCallout: Property {
    public static let property: String = "-webkit-touch-callout"
    
    /// Display the default callout
    case `default`
    
    /// Disable the callout
    case none
    
    /// Global CSS value
    case global(CSSTypeTypes.Global)
    
    public var description: String {
        switch self {
        case .default:
            return "default"
        case .none:
            return "none"
        case .global(let global):
            return global.description
        }
    }
}
