//
//  MozUserInput.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 28/03/2025.
//

import Foundation
import CSSTypeTypes

/// The non-standard CSS `-moz-user-input` property determines if an element will accept user input
/// in Mozilla applications.
///
/// This property can be used to disable user input for elements, preventing them from responding to
/// user interactions while still allowing selection. As of Firefox 60, this property can only be used
/// to disable user input (it can no longer grant input ability to elements that don't normally have it).
///
/// Example:
/// ```swift
/// // Disable user input for an element (user can select text but not modify it)
/// .mozUserInput(.none)
///
/// // Default behavior - element responds to user input if it normally does
/// .mozUserInput(.auto)
/// ```
///
/// - Note: This is a non-standard Mozilla-specific property that is deprecated. It was primarily
///         supported in Firefox. For modern input control, consider using the standard `disabled` attribute
///         or `pointer-events: none` CSS property instead.
///
/// - SeeAlso: [MDN Web Docs on -moz-user-input](https://developer.mozilla.org/en-US/docs/Web/CSS/-moz-user-input)
public enum MozUserInput: Property {
    public static let property: String = "-moz-user-input"
    
    /// The element will respond to user input if it normally takes user input
    case auto
    
    /// The element does not respond to user input, and it does not become :active
    case none
    
    /// Global CSS value
    case global(CSSTypeTypes.Global)
    
    public var description: String {
        switch self {
        case .auto:
            return "auto"
        case .none:
            return "none"
        case .global(let global):
            return global.description
        }
    }
}
