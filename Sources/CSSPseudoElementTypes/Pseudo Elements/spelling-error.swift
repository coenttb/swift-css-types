import Foundation

/// Represents the CSS ::spelling-error pseudo-element.
///
/// The `SpellingError` pseudo-element represents a text segment that the user agent
/// has flagged as incorrectly spelled. It allows styling of text that has been
/// identified as having spelling errors.
///
/// Example:
/// ```css
/// ::spelling-error {
///     text-decoration: wavy underline red;
/// }
/// ```
///
/// The ::spelling-error pseudo-element:
/// - Represents text flagged as misspelled by the user agent
/// - Is automatically applied by the browser's spellchecker
/// - Only supports certain styling properties
/// - May not be supported in all browsers
/// - Cannot be controlled by JavaScript directly
///
/// Supported properties typically include:
/// - Color properties
/// - Background properties
/// - Text decoration properties
/// - Outline properties
///
/// - Note: Browser support varies and this pseudo-element may not work in all contexts
///
/// - SeeAlso: [MDN Web Docs on ::spelling-error](https://developer.mozilla.org/en-US/docs/Web/CSS/::spelling-error)
public struct SpellingError: CSSPseudoElement {
    @inlinable public static var name: String { "spelling-error" }

    public init() {}
}
