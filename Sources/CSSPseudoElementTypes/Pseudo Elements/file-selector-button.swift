import Foundation

/// Represents the CSS ::file-selector-button pseudo-element.
///
/// The `FileSelectorButton` pseudo-element represents the button of an `<input>` element
/// with `type="file"`. It allows styling of the file upload button independently from
/// the input element.
///
/// Example:
/// ```css
/// input[type="file"]::file-selector-button {
///     border: 2px solid #6c5ce7;
///     padding: 0.2em 0.4em;
///     border-radius: 0.2em;
///     background-color: #a29bfe;
/// }
/// ```
///
/// The ::file-selector-button pseudo-element:
/// - Represents the button part of file input elements
/// - Only applies to `<input type="file">` elements
/// - Is treated as a whole element with its own styling rules
/// - Does not necessarily inherit fonts and colors from the input element
/// - Can be styled with all standard CSS properties
/// - Supports pseudo-classes like `:hover`, `:active`, etc.
///
/// Browser compatibility notes:
/// - Standardized name replacing vendor-specific pseudo-elements
/// - Older browsers may require fallbacks:
///   - `::-webkit-file-upload-button` (WebKit/Blink)
///   - `::-ms-browse` (Internet Explorer/Edge)
///
/// Common styling properties:
/// - All background and border properties
/// - Typography properties (font, color, etc.)
/// - Spacing properties (padding, margin)
/// - Layout properties (display, position, etc.)
/// - Transition and animation properties
///
/// - SeeAlso: [MDN Web Docs on ::file-selector-button](https://developer.mozilla.org/en-US/docs/Web/CSS/::file-selector-button)
public struct FileSelectorButton: CSSPseudoElement {
    @inlinable public static var name: String { "file-selector-button" }

    public init() {}
}
