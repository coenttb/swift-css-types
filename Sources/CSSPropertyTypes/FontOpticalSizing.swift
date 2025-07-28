import CSSTypeTypes
import Foundation

/// The CSS `font-optical-sizing` property sets whether text rendering is optimized for viewing at different sizes.
///
/// When optical sizing is used, small text sizes are often rendered with thicker strokes and larger serifs,
/// whereas larger text is often rendered more delicately with more contrast between thicker and thinner strokes.
///
/// Example:
/// ```swift
/// .fontOpticalSizing(.auto)     // font-optical-sizing: auto
/// .fontOpticalSizing(.none)     // font-optical-sizing: none
/// .fontOpticalSizing(.global(.inherit))  // font-optical-sizing: inherit
/// ```
///
/// - SeeAlso: [MDN Web Docs on font-optical-sizing](https://developer.mozilla.org/en-US/docs/Web/CSS/font-optical-sizing)
public enum FontOpticalSizing: Property {
    public static let property: String = "font-optical-sizing"

    /// The browser will modify the shape of glyphs for optimal viewing.
    /// This is the default in supporting browsers.
    case auto

    /// The browser will not modify the shape of glyphs for optimal viewing.
    case none

    /// Global values
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .auto:
            return "auto"
        case .none:
            return "none"
        case .global(let value):
            return value.description
        }
    }
}
