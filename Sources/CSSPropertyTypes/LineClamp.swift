//
//  LineClamp.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 28/03/2025.
//

import CSSTypeTypes
import Foundation

/// The line-clamp CSS property allows limiting of the contents of a block to the specified number of lines.
///
/// When the content exceeds the specified number of lines, an ellipsis (...) is typically shown
/// to indicate that content has been truncated.
///
/// Example:
/// ```swift
/// .lineClamp(.none)            // line-clamp: none
/// .lineClamp(.lines(3))        // line-clamp: 3
/// .lineClamp(.lines(5))        // line-clamp: 5
/// ```
///
/// - Note: For legacy support, this property is often implemented with the vendor-prefixed
///         `-webkit-line-clamp` property, which requires setting the display property to
///         `-webkit-box` or `-webkit-inline-box` and `-webkit-box-orient` to `vertical`.
///         In most cases, you will also want to set `overflow` to `hidden`.
///
/// - SeeAlso: [MDN Web Docs on line-clamp](https://developer.mozilla.org/en-US/docs/Web/CSS/line-clamp)
public enum LineClamp: Property {
    public static let property: String = "line-clamp"
    /// No clamping; all lines of text are displayed
    case none

    /// Clamp the text to the specified number of lines
    case lines(Int)

    /// Global values
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .none:
            return "none"
        case .lines(let count):
            // Line count must be greater than 0
            let safeCount = max(1, count)
            return "\(safeCount)"
        case .global(let global):
            return global.description
        }
    }
}

/// Convenience initializers for LineClamp
extension LineClamp: ExpressibleByIntegerLiteral {
    /// Creates a line-clamp from an integer literal
    ///
    /// - Parameter value: The number of lines to clamp to
    public init(integerLiteral value: Int) {
        self = .lines(value)
    }
}
