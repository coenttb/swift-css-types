import CSSTypeTypes
import Foundation

/// The CSS `grid-auto-rows` property specifies the size of an implicitly-created grid row track or pattern of tracks.
///
/// If a grid item is positioned into a row that is not explicitly sized by `grid-template-rows`,
/// implicit grid tracks are created to hold it. This can happen either by explicitly positioning into a row
/// that is out of range, or by the auto-placement algorithm creating additional rows.
///
/// Example:
/// ```swift
/// .gridAutoRows(.auto)                                  // grid-auto-rows: auto
/// .gridAutoRows(.px(100))                               // grid-auto-rows: 100px
/// .gridAutoRows(.percentage(10))                        // grid-auto-rows: 10%
/// .gridAutoRows(.fr(1))                                 // grid-auto-rows: 1fr
/// .gridAutoRows(.minContent)                            // grid-auto-rows: min-content
/// .gridAutoRows(.maxContent)                            // grid-auto-rows: max-content
/// .gridAutoRows(.minMax(.minContent, .fr(2)))          // grid-auto-rows: minmax(min-content, 2fr)
/// .gridAutoRows(.fitContent(.percentage(40)))          // grid-auto-rows: fit-content(40%)
/// .gridAutoRows([.auto, .fr(1), .px(200)])             // grid-auto-rows: auto 1fr 200px
/// .gridAutoRows(.global(.inherit))                      // grid-auto-rows: inherit
/// ```
///
/// - SeeAlso: [MDN Web Docs on grid-auto-rows](https://developer.mozilla.org/en-US/docs/Web/CSS/grid-auto-rows)
public enum GridAutoRows: Property, LengthPercentageConvertible {

    public static let property: String = "grid-auto-rows"

    /// Auto sizing (similar to minmax(min-content, max-content))
    case auto

    case lengthPercentage(LengthPercentage)

    /// Largest minimal content contribution
    case minContent

    /// Largest maximal content contribution
    case maxContent

    /// Range between min and max with minmax()
    case minMax(MinMaxValue, MinMaxValue)

    /// Size that is clamped at the provided argument
    case fitContent(LengthPercentage)

    /// Multiple track sizes for a repeating pattern
    case multiple([GridAutoRows])

    /// Global values
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .auto:
            return "auto"
        case .lengthPercentage(let lengthPercentage):
            return lengthPercentage.description
        case .minContent:
            return "min-content"
        case .maxContent:
            return "max-content"
        case .minMax(let min, let max):
            return "minmax(\(min), \(max))"
        case .fitContent(let value):
            return "fit-content(\(value))"
        case .multiple(let tracks):
            return tracks.map { $0.description }.joined(separator: " ")
        case .global(let value):
            return value.description
        }
    }
}
