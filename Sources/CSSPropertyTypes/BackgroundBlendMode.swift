import CSSTypeTypes
import Foundation

/// Represents the CSS `background-blend-mode` property, which sets how an element's background images blend with each other and with the background color.
///
/// The background-blend-mode property determines how multiple background images or a background image and background color
/// should blend together. Different blend modes create different visual effects, from simple transparency to complex color transformations.
///
/// Visual Reference:
/// ```
/// ┌───────────────────────────┐  ┌───────────────────────────┐
/// │                           │  │                           │
/// │     Normal blend          │  │     Multiply blend        │
/// │     (default)             │  │     (darkens)             │
/// │                           │  │                           │
/// └───────────────────────────┘  └───────────────────────────┘
///
/// ┌───────────────────────────┐  ┌───────────────────────────┐
/// │                           │  │                           │
/// │     Screen blend          │  │     Overlay blend         │
/// │     (lightens)            │  │     (contrast)            │
/// │                           │  │                           │
/// └───────────────────────────┘  └───────────────────────────┘
/// ```
///
/// Example:
/// ```swift
/// // Apply a multiply blend mode to all backgrounds
/// .backgroundBlendMode(.multiply)
///
/// // Apply different blend modes to multiple backgrounds
/// .backgroundBlendMode(.values(.screen, .overlay))
///
/// // Create a color overlay effect
/// .backgroundImage(.url("image.jpg"))
/// .backgroundColor(.rgba(255, 0, 0, 0.5))
/// .backgroundBlendMode(.multiply)
/// ```
///
/// - Note: The blending modes should be defined in the same order as the background images.
///         If the number of blend modes doesn't match the number of background images,
///         the list will be repeated or truncated as needed.
///
/// - SeeAlso: [MDN Web Docs on background-blend-mode](https://developer.mozilla.org/en-US/docs/Web/CSS/background-blend-mode)
public enum BackgroundBlendMode: Property {
    public static let property: String = "background-blend-mode"

    /// A single blend mode
    case single(BlendMode)

    /// Multiple blend modes for multiple backgrounds
    case multiple([BlendMode])

    /// Global CSS values
    case global(CSSTypeTypes.Global)

    /// Creates a background blend mode with a specific mode
    ///
    /// - Parameter mode: The blend mode to use
    public init(_ mode: BlendMode) {
        self = .single(mode)
    }
}

/// Provides string conversion for CSS output
extension BackgroundBlendMode: CustomStringConvertible {
    /// Converts the background-blend-mode value to its CSS string representation
    ///
    /// This method generates CSS like:
    /// ```css
    /// background-blend-mode: multiply;
    /// background-blend-mode: screen, overlay;
    /// ```
    public var description: String {
        switch self {
        case .single(let mode):
            return mode.description
        case .multiple(let modes):
            return modes.map { $0.description }.joined(separator: ", ")
        case .global(let global):
            return global.description
        }
    }
}

/// Default value and convenience methods
extension BackgroundBlendMode {
    /// The default value for background-blend-mode (`normal`)
    public static let `default` = BackgroundBlendMode(.normal)

    /// Creates a background-blend-mode with multiple values
    ///
    /// - Parameter modes: The blend modes to apply
    /// - Returns: A background-blend-mode with multiple values
    public static func values(_ modes: [BlendMode]) -> BackgroundBlendMode {
        if modes.count == 1 {
            return .single(modes[0])
        }
        return .multiple(modes)
    }

    /// Creates a background-blend-mode with multiple values
    ///
    /// - Parameter modes: The blend modes to apply
    /// - Returns: A background-blend-mode with multiple values
    public static func values(_ modes: BlendMode...) -> BackgroundBlendMode {
        values(modes)
    }

    // Common blend modes

    /// Normal blend mode (default)
    public static let normal = BackgroundBlendMode(.normal)

    /// Multiply blend mode (darkens)
    public static let multiply = BackgroundBlendMode(.multiply)

    /// Screen blend mode (lightens)
    public static let screen = BackgroundBlendMode(.screen)

    /// Overlay blend mode (increases contrast)
    public static let overlay = BackgroundBlendMode(.overlay)

    /// Darken blend mode (selects darker colors)
    public static let darken = BackgroundBlendMode(.darken)

    /// Lighten blend mode (selects lighter colors)
    public static let lighten = BackgroundBlendMode(.lighten)

    /// Color dodge blend mode (brightens)
    public static let colorDodge = BackgroundBlendMode(.colorDodge)

    /// Color burn blend mode (darkens)
    public static let colorBurn = BackgroundBlendMode(.colorBurn)

    /// Hard light blend mode (harsh spotlight effect)
    public static let hardLight = BackgroundBlendMode(.hardLight)

    /// Soft light blend mode (soft spotlight effect)
    public static let softLight = BackgroundBlendMode(.softLight)

    /// Difference blend mode (inverts colors)
    public static let difference = BackgroundBlendMode(.difference)

    /// Exclusion blend mode (similar to difference but softer)
    public static let exclusion = BackgroundBlendMode(.exclusion)

    /// Hue blend mode (applies hue from top layer)
    public static let hue = BackgroundBlendMode(.hue)

    /// Saturation blend mode (applies saturation from top layer)
    public static let saturation = BackgroundBlendMode(.saturation)

    /// Color blend mode (applies hue and saturation from top layer)
    public static let color = BackgroundBlendMode(.color)

    /// Luminosity blend mode (applies brightness from top layer)
    public static let luminosity = BackgroundBlendMode(.luminosity)
}
