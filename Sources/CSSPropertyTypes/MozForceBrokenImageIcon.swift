//
//  MozForceBrokenImageIcon.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 28/03/2025.
//

import Foundation
import CSSTypeTypes

/// The non-standard CSS `-moz-force-broken-image-icon` property can be used to force the broken
/// image icon to be shown even when a broken image has an alt attribute.
///
/// This property is specifically for controlling how broken images display in Gecko-based browsers.
/// When set to `on`, the broken image icon will be displayed alongside the alt text, if any.
///
/// Example:
/// ```swift
/// // Show broken image icon even if alt text exists
/// .mozForceBrokenImageIcon(.on)
///
/// // Default behavior - no broken image icon when alt text exists
/// .mozForceBrokenImageIcon(.off)
/// ```
///
/// - Note: This is a non-standard Mozilla-specific property that is deprecated.
///         It only works in Gecko-based browsers (Firefox). For proper accessibility,
///         it's recommended to use proper alt attributes instead of relying on this property.
///
/// - SeeAlso: [MDN Web Docs on -moz-force-broken-image-icon](https://developer.mozilla.org/en-US/docs/Web/CSS/-moz-force-broken-image-icon)
public enum MozForceBrokenImageIcon: Property {
    public static let property: String = "-moz-force-broken-image-icon"
    
    /// Do not show broken image icon when alt text exists (default)
    case off
    
    /// Show broken image icon even when alt text exists
    case on
    
    /// Global CSS value
    case global(CSSTypeTypes.Global)
    
    public var description: String {
        switch self {
        case .off:
            return "0"
        case .on:
            return "1"
        case .global(let global):
            return global.description
        }
    }
}
