import CSSTypeTypes
import Foundation

/// The CSS `color-scheme` property allows an element to indicate which color schemes it can comfortably be rendered in.
/// Common choices for operating system color schemes are "light" and "dark", or "day mode" and "night mode".
///
/// When a user selects one of these color schemes, the operating system makes adjustments to the user interface.
/// This includes form controls, scrollbars, and the used values of CSS system colors.
///
/// Example:
/// ```swift
/// .colorScheme(.normal)             // color-scheme: normal
/// .colorScheme(.light)              // color-scheme: light
/// .colorScheme(.dark)               // color-scheme: dark
/// .colorScheme([.light, .dark])     // color-scheme: light dark
/// .colorScheme([.light], only: true) // color-scheme: only light
/// ```
///
/// - Note: When opting in to a browser's color schemes, component authors should use the
///         `prefers-color-scheme` media feature to adapt the element's style to the color scheme.
///
/// - SeeAlso: [MDN Web Docs on color-scheme](https://developer.mozilla.org/en-US/docs/Web/CSS/color-scheme)
public enum ColorScheme: Property {
    public static let property: String = "color-scheme"
    /// Indicates that the element can be rendered using the page's color scheme settings.
    /// If the page does not have a color scheme set, the element is rendered using the page's default color settings.
    case normal

    /// Indicates that the element can be rendered using the operating system's color scheme(s).
    case schemes([ColorSchemeValue], only: Bool)

    /// Global values
    case global(CSSTypeTypes.Global)
}

/// Values for color schemes
public enum ColorSchemeValue: Sendable, Hashable, CustomStringConvertible {
    /// Light color scheme
    case light

    /// Dark color scheme
    case dark

    /// Custom color scheme identifier
    case custom(CSSString)

    public var description: String {
        switch self {
        case .light:
            return "light"
        case .dark:
            return "dark"
        case .custom(let name):
            return name.description
        }
    }
}

/// CSS Output conversion
extension ColorScheme: CustomStringConvertible {
    public var description: String {
        switch self {
        case .normal:
            return "normal"

        case .schemes(let schemes, let only):
            let schemeList = schemes.map { $0.description }.joined(separator: " ")
            return only ? "only \(schemeList)" : schemeList

        case .global(let global):
            return global.description
        }
    }
}

/// Factory methods for creating color scheme values
extension ColorScheme {
    /// Creates a color scheme with a single scheme value
    ///
    /// - Parameter scheme: The color scheme value
    /// - Returns: A color scheme with the specified scheme
    public static func scheme(_ scheme: ColorSchemeValue, only: Bool = false) -> ColorScheme {
        .schemes([scheme], only: only)
    }

    /// Light color scheme
    public static let light: ColorScheme = .scheme(.light)

    /// Dark color scheme
    public static let dark: ColorScheme = .scheme(.dark)

}
