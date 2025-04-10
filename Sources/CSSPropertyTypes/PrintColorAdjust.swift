import Foundation
import CSSTypeTypes

//
//  PrintColorAdjust.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import Foundation

/// The CSS `print-color-adjust` property sets what, if anything, the user agent may do
/// to optimize the appearance of the element on the output device.
///
/// This property provides control over browser optimizations for printing and other output devices,
/// allowing you to specify whether the browser should optimize the display of colors and images
/// or render the content exactly as specified.
///
/// Example:
/// ```swift
/// .printColorAdjust(.economy)  // print-color-adjust: economy
/// .printColorAdjust(.exact)    // print-color-adjust: exact
/// ```
///
/// - Note: The user agent's respect for this property is optional. User preferences and browser settings
///         may override this property. Each user agent is allowed to decide for itself how to handle
///         print-color-adjust in any given situation.
///
/// - SeeAlso: [MDN Web Docs on print-color-adjust](https://developer.mozilla.org/en-US/docs/Web/CSS/print-color-adjust)
public enum PrintColorAdjust: Property {
    public static let property: String = "print-color-adjust"
    
    /// The browser is allowed to make adjustments as it deems appropriate for the output device
    case economy
    
    /// The appearance of the content should not be changed except by user request
    case exact
    
    /// Global value
    case global(CSSTypeTypes.Global)
    
    public var description: String {
        switch self {
        case .economy:
            return "economy"
        case .exact:
            return "exact"
        case .global(let global):
            return global.description
        }
    }
}
