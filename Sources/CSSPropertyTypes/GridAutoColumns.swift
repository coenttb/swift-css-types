import Foundation
import CSSTypeTypes

/// The CSS `grid-auto-columns` property specifies the size of an implicitly-created grid column track or pattern of tracks.
///
/// If a grid item is positioned into a column that is not explicitly sized by `grid-template-columns`,
/// implicit grid tracks are created to hold it. This can happen either by explicitly positioning into a column
/// that is out of range, or by the auto-placement algorithm creating additional columns.
///
/// Example:
/// ```swift
/// .gridAutoColumns(.auto)                                  // grid-auto-columns: auto
/// .gridAutoColumns(.px(100))                               // grid-auto-columns: 100px
/// .gridAutoColumns(.percentage(10))                        // grid-auto-columns: 10%
/// .gridAutoColumns(.fr(1))                                 // grid-auto-columns: 1fr
/// .gridAutoColumns(.minContent)                            // grid-auto-columns: min-content
/// .gridAutoColumns(.maxContent)                            // grid-auto-columns: max-content
/// .gridAutoColumns(.minMax(.minContent, .fr(2)))          // grid-auto-columns: minmax(min-content, 2fr)
/// .gridAutoColumns(.fitContent(.percentage(40)))          // grid-auto-columns: fit-content(40%)
/// .gridAutoColumns([.auto, .fr(1), .px(200)])             // grid-auto-columns: auto 1fr 200px
/// .gridAutoColumns(.global(.inherit))                      // grid-auto-columns: inherit
/// ```
///
/// - SeeAlso: [MDN Web Docs on grid-auto-columns](https://developer.mozilla.org/en-US/docs/Web/CSS/grid-auto-columns)
public enum GridAutoColumns: Property {
    
    public static let property: String = "grid-auto-columns"
    
    /// Auto sizing (similar to minmax(min-content, max-content))
    case auto
    
    /// Fixed length value
    case px(Double)
    
    /// Percentage of grid container width
    case percentage(Percentage)
    
    /// Flexible length (takes a share of remaining space)
    case fr(Double)
    
    /// Largest minimal content contribution
    case minContent
    
    /// Largest maximal content contribution
    case maxContent
    
    /// Range between min and max with minmax()
    case minMax(MinMaxValue, MinMaxValue)
    
    /// Size that is clamped at the provided argument
    case fitContent(LengthPercentage)
    
    /// Multiple track sizes for a repeating pattern
    case multiple([GridAutoColumns])
    
    /// Global values
    case global(CSSTypeTypes.Global)
    
    public var description: String {
        switch self {
        case .auto:
            return "auto"
        case .px(let value):
            return "\(value.truncatingRemainder())px"
        case .percentage(let percentage):
            return percentage.description
        case .fr(let value):
            return "\(value.truncatingRemainder())fr"
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

/// Values that can be used in minmax() expressions
public enum MinMaxValue: Sendable, Equatable, CustomStringConvertible {
    /// Auto sizing
    case auto
    
    /// Fixed length value
    case px(Double)
    
    /// Percentage value
    case percentage(Percentage)
    
    /// Flexible length (only valid as maximum)
    case fr(Double)
    
    /// Largest minimal content contribution
    case minContent
    
    /// Largest maximal content contribution
    case maxContent
    
    public var description: String {
        switch self {
        case .auto:
            return "auto"
        case .px(let value):
            return "\(value.truncatingRemainder())px"
        case .percentage(let percentage):
            return percentage.description
        case .fr(let value):
            return "\(value.truncatingRemainder())fr"
        case .minContent:
            return "min-content"
        case .maxContent:
            return "max-content"
        }
    }
}
