import Foundation

/// Represents the CSS ::target-text pseudo-element.
///
/// The `TargetText` pseudo-element represents the text that has been scrolled to
/// if the browser supports scroll-to-text functionality. This occurs when a URL
/// contains a text fragment identifier.
///
/// Example:
/// ```css
/// ::target-text {
///     background-color: yellow;
///     color: black;
/// }
/// ```
///
/// The ::target-text pseudo-element:
/// - Represents text targeted by scroll-to-text functionality
/// - Is activated by text fragment URLs (e.g., #:~:text=example)
/// - Only appears when the browser supports and uses scroll-to-text
/// - Allows styling of text that the browser has scrolled to and highlighted
/// - Is part of the scroll-to-text specification
///
/// Usage scenarios:
/// - Styling text fragments linked from search results
/// - Highlighting text when shared via text fragment links
/// - Customizing the appearance of browser-targeted text
///
/// - Note: Browser support is limited and this feature may not work everywhere
///
/// - SeeAlso: [CSS Pseudo-Elements Module Level 4](https://www.w3.org/TR/css-pseudo-4/#target-text)
public struct TargetText: CSSPseudoElement {
    @inlinable public static var name: String { "target-text" }

    public init() {}
}
