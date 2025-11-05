import Foundation

/// Represents the CSS ::first-letter pseudo-element.
///
/// The `FirstLetter` pseudo-element applies styles to the first letter of the first line
/// of a block container, but only when not preceded by other content such as images or
/// inline tables.
///
/// Example:
/// ```css
/// p::first-letter {
///     font-size: 250%;
///     float: left;
///     margin-right: 6px;
///     color: red;
/// }
/// ```
///
/// The ::first-letter pseudo-element:
/// - Applies to the first letter of the first line in block containers
/// - Must not be preceded by other content (images, inline tables, etc.)
/// - Includes preceding/following punctuation in the match
/// - Supports digraphs in some languages (like IJ in Dutch)
/// - Works with generated content from ::before pseudo-elements
/// - Only supports a limited subset of CSS properties
/// - Commonly used for drop cap effects
///
/// Supported properties include:
/// - All font properties
/// - All background properties
/// - All margin and padding properties
/// - All border properties
/// - `color`
/// - Text properties: `text-decoration`, `text-shadow`, `text-transform`, `letter-spacing`
/// - Layout properties: `float`, `vertical-align` (if float is none)
/// - `box-shadow`, `line-height`
///
/// Special behaviors:
/// - Punctuation (Unicode Ps, Pe, Pi, Pf, Po classes) is included
/// - Digraphs are matched as single units in supported languages
/// - Generated content from ::before affects what's considered "first"
///
/// - Note: Both `::first-letter` (preferred) and `:first-letter` syntax are supported
///
/// - SeeAlso: [MDN Web Docs on ::first-letter](https://developer.mozilla.org/en-US/docs/Web/CSS/::first-letter)
public struct FirstLetter: CSSPseudoElement {
    @inlinable public static var name: String { "first-letter" }

    public init() {}
}
