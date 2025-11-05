import Foundation

/// Represents the CSS ::cue pseudo-element.
///
/// The `Cue` pseudo-element matches WebVTT cues within a selected element. This can be used
/// to style captions and other cues in media with VTT tracks.
///
/// Example:
/// ```css
/// video::cue {
///     color: #fff;
///     background-color: rgba(0, 0, 0, 0.6);
/// }
///
/// ::cue(u) {
///     color: red;
/// }
/// ```
///
/// The ::cue pseudo-element:
/// - Matches WebVTT cues within media elements
/// - Can be used with or without a selector parameter
/// - Styles are applied to entire cue sets as single units
/// - Background properties apply to each cue individually
/// - Only supports a limited set of CSS properties
/// - Used for styling video captions and subtitles
///
/// Supported properties include:
/// - All background properties
/// - `color`
/// - All font properties
/// - `line-height`
/// - `opacity`
/// - All outline properties
/// - `ruby-position`
/// - `text-combine-upright`
/// - All text-decoration properties
/// - `text-shadow`
/// - `visibility`
/// - `white-space`
///
/// Internal node objects that can be styled:
/// - `<c>`, `<i>`, `<b>`, `<u>`, `<ruby>`, `<rt>`, `<v>`, `<lang>`
///
/// - SeeAlso: [MDN Web Docs on ::cue](https://developer.mozilla.org/en-US/docs/Web/CSS/::cue)
public struct Cue: CSSPseudoElement {
    @inlinable public static var name: String { "cue" }

    /// The optional selector for targeting specific elements within cues
    public let selector: String?

    public init(_ selector: String? = nil) {
        self.selector = selector
    }
}

/// Provides string conversion for CSS output
extension Cue: CustomStringConvertible {
    /// Converts the ::cue pseudo-element to its CSS string representation
    public var description: String {
        if let selector = selector {
            return Self.prefix + "cue(\(selector))"
        } else {
            return Self.prefix + Self.name
        }
    }
}
