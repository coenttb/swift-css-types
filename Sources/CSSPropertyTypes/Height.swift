import CSSTypeTypes
import Foundation

/// The CSS `height` property specifies the height of an element.
///
/// By default, it sets the height of the content area, but if `box-sizing` is set to `border-box`,
/// it sets the height of the border area.
///
/// The specified value of height applies to the content area as long as it remains within
/// the values defined by `min-height` and `max-height`. If the value for height is less than the value
/// for `min-height`, then `min-height` overrides height. If the value for height is greater than the value
/// for `max-height`, then `max-height` overrides height.
///
/// - Note: As a geometric property, height also applies to SVG elements like `<svg>`, `<rect>`,
///         `<image>`, and `<foreignObject>`.
///
/// Example:
/// ```swift
/// .height(.px(100))                           // height: 100px
/// .height(.em(2.5))                           // height: 2.5em
/// .height(.percentage(75))                    // height: 75%
/// .height(.auto)                              // height: auto
/// .height(.maxContent)                        // height: max-content
/// .height(.minContent)                        // height: min-content
/// .height(.fitContent)                        // height: fit-content
/// .height(.fitContentLength(.percentage(80))) // height: fit-content(80%)
/// .height(.stretch)                           // height: stretch
/// .height(.global(.inherit))                  // height: inherit
/// ```
///
/// - SeeAlso: [MDN Web Docs on height](https://developer.mozilla.org/en-US/docs/Web/CSS/height)
public enum Height: Property, LengthPercentageConvertible {
    public static let property: String = "height"

    /// A length or percentage value
    case lengthPercentage(LengthPercentage)

    /// The browser calculates and selects a height for the specified element
    case auto

    /// The intrinsic preferred height
    case maxContent

    /// The intrinsic minimum height
    case minContent

    /// Uses the available space, but not more than max-content
    case fitContent

    /// Uses the fit-content formula with the available space replaced by the specified argument
    case fitContentLength(LengthPercentage)

    /// Sets the height of the element's margin box to the height of its containing block
    case stretch

    /// Global value
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .lengthPercentage(let lengthPercentage):
            return lengthPercentage.description
        case .auto:
            return "auto"
        case .maxContent:
            return "max-content"
        case .minContent:
            return "min-content"
        case .fitContent:
            return "fit-content"
        case .fitContentLength(let lengthPercentage):
            return "fit-content(\(lengthPercentage.description))"
        case .stretch:
            return "stretch"
        case .global(let global):
            return global.description
        }
    }
}
