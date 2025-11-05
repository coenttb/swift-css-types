import Foundation

/// Represents absolute size keywords used in CSS font properties.
///
/// The `AbsoluteSize` data type defines a set of predefined size keywords that can be used
/// for font sizing. These keywords are mapped to specific scaling factors relative to the
/// `medium` size, which serves as the reference point.
///
/// Visual Reference (approximate relative sizes):
/// ```
/// xxx-large (3× medium)
/// xx-large  (2× medium)
/// x-large   (1.5× medium)
/// large     (1.2× medium)
/// medium    (base size)
/// small     (0.89× medium)
/// x-small   (0.75× medium)
/// xx-small  (0.6× medium)
/// ```
///
/// Example:
/// ```swift
/// .fontSize(.xxLarge)  // Sets font-size to xx-large
/// .fontSize(.small)    // Sets font-size to small
/// ```
///
/// - Note: These values are sized relative to the `medium` size, which typically
///         corresponds to the user's preferred font size in the browser.
///
/// - SeeAlso: [MDN Web Docs on absolute size values](https://developer.mozilla.org/en-US/docs/Web/CSS/absolute-size)
public enum AbsoluteSize: String, Sendable, Hashable {
    /// An absolute size 60% the size of medium
    ///
    /// Corresponds to the deprecated HTML `size="1"` attribute.
    /// ```css
    /// font-size: xx-small;
    /// ```
    case xxSmall = "xx-small"

    /// An absolute size 75% the size of medium
    /// ```css
    /// font-size: x-small;
    /// ```
    case xSmall = "x-small"

    /// An absolute size 89% the size of medium
    ///
    /// Corresponds to the deprecated HTML `size="2"` attribute.
    /// ```css
    /// font-size: small;
    /// ```
    case small = "small"

    /// A user's preferred font size, used as the reference middle value
    ///
    /// Corresponds to the deprecated HTML `size="3"` attribute.
    /// ```css
    /// font-size: medium;
    /// ```
    case medium = "medium"

    /// An absolute size 20% larger than medium
    ///
    /// Corresponds to the deprecated HTML `size="4"` attribute.
    /// ```css
    /// font-size: large;
    /// ```
    case large = "large"

    /// An absolute size 50% larger than medium
    ///
    /// Corresponds to the deprecated HTML `size="5"` attribute.
    /// ```css
    /// font-size: x-large;
    /// ```
    case xLarge = "x-large"

    /// An absolute size twice the size of medium
    ///
    /// Corresponds to the deprecated HTML `size="6"` attribute.
    /// ```css
    /// font-size: xx-large;
    /// ```
    case xxLarge = "xx-large"

    /// An absolute size three times the size of medium
    ///
    /// Corresponds to the deprecated HTML `size="7"` attribute.
    /// ```css
    /// font-size: xxx-large;
    /// ```
    case xxxLarge = "xxx-large"
}

/// Provides string conversion for CSS output
extension AbsoluteSize: CustomStringConvertible {
    /// Converts the absolute size value to its CSS string representation
    ///
    /// This method returns the raw string value for use in CSS properties.
    public var description: String {
        return rawValue
    }
}
