import Foundation

/// Represents CSS blend mode values for combining colors when elements overlap.
///
/// The `BlendMode` data type defines how colors should appear when elements or backgrounds
/// overlap. It is used in the `background-blend-mode` and `mix-blend-mode` properties.
///
/// Example:
/// ```swift
/// .backgroundBlendMode(.multiply)  // Creates a multiplicative blending effect
/// .mixBlendMode(.overlay)          // Applies overlay blending to an element
/// ```
///
/// - Note: Blend modes determine how the foreground (top layer) and background (bottom layer)
///         colors interact to produce a final color. Different blend modes can create
///         various visual effects, from simple transparency to complex color transformations.
///
/// - SeeAlso: [MDN Web Docs on blend-mode values](https://developer.mozilla.org/en-US/docs/Web/CSS/blend-mode)
public enum BlendMode: String, Sendable, Hashable {
    /// The final color is the top color, regardless of the bottom color
    ///
    /// The effect is like two opaque pieces of paper overlapping.
    /// ```css
    /// mix-blend-mode: normal;
    /// ```
    case normal

    /// Multiplies the top and bottom colors
    ///
    /// A black layer leads to a black final layer, and a white layer leads to no change.
    /// The effect is like two images printed on transparent film overlapping.
    /// ```css
    /// mix-blend-mode: multiply;
    /// ```
    case multiply

    /// Inverts colors, multiplies them, and inverts that value
    ///
    /// A black layer leads to no change, and a white layer leads to a white final layer.
    /// The effect is like two images shone onto a projection screen.
    /// ```css
    /// mix-blend-mode: screen;
    /// ```
    case screen

    /// Multiplies if the bottom color is darker, screens if the bottom color is lighter
    ///
    /// This blend mode is equivalent to hard-light but with the layers swapped.
    /// ```css
    /// mix-blend-mode: overlay;
    /// ```
    case overlay

    /// Selects the darkest value from each color channel
    /// ```css
    /// mix-blend-mode: darken;
    /// ```
    case darken

    /// Selects the lightest value from each color channel
    /// ```css
    /// mix-blend-mode: lighten;
    /// ```
    case lighten

    /// Divides the bottom color by the inverse of the top color
    ///
    /// A black foreground leads to no change, while a foreground with the inverse color of
    /// the backdrop leads to a fully lit color.
    /// ```css
    /// mix-blend-mode: color-dodge;
    /// ```
    case colorDodge = "color-dodge"

    /// Inverts the bottom color, divides by the top color, and inverts again
    ///
    /// A white foreground leads to no change, while a foreground with the inverse color of
    /// the backdrop leads to a black final image.
    /// ```css
    /// mix-blend-mode: color-burn;
    /// ```
    case colorBurn = "color-burn"

    /// Multiplies if the top color is darker, screens if the top color is lighter
    ///
    /// This blend mode is equivalent to overlay but with the layers swapped.
    /// The effect is similar to shining a harsh spotlight on the backdrop.
    /// ```css
    /// mix-blend-mode: hard-light;
    /// ```
    case hardLight = "hard-light"

    /// Similar to hard-light, but softer
    ///
    /// The effect is similar to shining a diffused spotlight on the backdrop.
    /// ```css
    /// mix-blend-mode: soft-light;
    /// ```
    case softLight = "soft-light"

    /// Subtracts the darker of the two colors from the lighter one
    ///
    /// A black layer has no effect, while a white layer inverts the other layer's color.
    /// ```css
    /// mix-blend-mode: difference;
    /// ```
    case difference

    /// Similar to difference, but with less contrast
    ///
    /// A black layer has no effect, while a white layer inverts the other layer's color.
    /// ```css
    /// mix-blend-mode: exclusion;
    /// ```
    case exclusion

    /// Applies the hue of the top color with saturation and luminosity of the bottom color
    /// ```css
    /// mix-blend-mode: hue;
    /// ```
    case hue

    /// Applies the saturation of the top color with hue and luminosity of the bottom color
    ///
    /// A pure gray backdrop, having no saturation, will have no effect.
    /// ```css
    /// mix-blend-mode: saturation;
    /// ```
    case saturation

    /// Applies the hue and saturation of the top color with luminosity of the bottom color
    ///
    /// The effect preserves gray levels and can be used to colorize the foreground.
    /// ```css
    /// mix-blend-mode: color;
    /// ```
    case color

    /// Applies the luminosity of the top color with hue and saturation of the bottom color
    ///
    /// This blend mode is equivalent to color, but with the layers swapped.
    /// ```css
    /// mix-blend-mode: luminosity;
    /// ```
    case luminosity
}

/// Provides string conversion for CSS output
extension BlendMode: CustomStringConvertible {
    /// Converts the blend mode value to its CSS string representation
    ///
    /// This method returns the raw string value for use in CSS properties.
    public var description: String {
        return rawValue
    }
}
