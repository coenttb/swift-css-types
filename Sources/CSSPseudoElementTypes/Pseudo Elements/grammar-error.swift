import Foundation

/// Represents the CSS ::grammar-error pseudo-element.
///
/// The `GrammarError` pseudo-element represents a text segment that the user agent
/// has flagged as grammatically incorrect. It allows styling of text that has been
/// identified as having grammar errors.
///
/// Example:
/// ```css
/// ::grammar-error {
///     text-decoration: underline red;
///     color: red;
/// }
/// ```
///
/// The ::grammar-error pseudo-element:
/// - Represents text flagged as grammatically incorrect by the user agent
/// - Is automatically applied by the browser's grammar checker
/// - Only supports a limited subset of CSS properties
/// - Has limited browser availability
/// - Cannot be controlled by JavaScript directly
/// - Works alongside spell checking functionality
///
/// Allowable properties include:
/// - `color`
/// - `background-color`
/// - `cursor`
/// - `caret-color`
/// - `outline` and its longhands
/// - `text-decoration` and its associated properties
/// - `text-emphasis-color`
/// - `text-shadow`
///
/// - Note: Browser support is limited and this pseudo-element may not work in all contexts
///
/// - SeeAlso: [MDN Web Docs on ::grammar-error](https://developer.mozilla.org/en-US/docs/Web/CSS/::grammar-error)
public struct GrammarError: CSSPseudoElement {
    @inlinable public static var name: String { "grammar-error" }

    public init() {}
}
