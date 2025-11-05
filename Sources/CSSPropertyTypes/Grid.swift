import CSSTypeTypes
import Foundation

/// The CSS `grid` property is a shorthand property that sets all of the explicit and implicit grid properties in a single declaration.
///
/// Using `grid` you specify one axis using `grid-template-rows` or `grid-template-columns`,
/// you then specify how content should auto-repeat in the other axis using the implicit grid properties:
/// `grid-auto-rows`, `grid-auto-columns`, and `grid-auto-flow`.
///
/// Example:
/// ```swift
/// .grid(.none)                                           // grid: none
/// .grid(.template([.px(100), .fr(1)], [.auto, .fr(2)])) // grid: 100px 1fr / auto 2fr
/// .grid(.autoFlow(.row))                                // grid: auto-flow / auto
/// .grid(.autoFlow(.row, .dense, .fr(1)))               // grid: auto-flow dense / 1fr
/// .grid(.explicit([.px(100)], .autoFlow(.column)))     // grid: 100px / auto-flow
/// .grid(.explicit([.px(100)], .autoFlow(.column, .dense, .percentage(40)))) // grid: 100px / auto-flow dense 40%
/// .grid(.global(.inherit))                              // grid: inherit
/// ```
///
/// - SeeAlso: [MDN Web Docs on grid](https://developer.mozilla.org/en-US/docs/Web/CSS/grid)
public enum Grid: Property {

    public static let property: String = "grid"

    /// Sets all grid values to their initial value
    case none

    /// Defines grid template with rows and columns
    case template([GridTrackSize], [GridTrackSize])

    /// Defines an auto-flow grid with columns
    case autoFlow(AutoFlowDirection, AutoFlowDensity? = nil, GridTrackSize? = nil)

    /// Defines rows with auto-flow columns
    case explicit([GridTrackSize], AutoFlow)

    /// Global values
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .none:
            return "none"
        case .template(let rows, let columns):
            let rowsStr = rows.map { $0.description }.joined(separator: " ")
            let columnsStr = columns.map { $0.description }.joined(separator: " ")
            return "\(rowsStr) / \(columnsStr)"
        case .autoFlow(let direction, let density, let trackSize):
            var result = "auto-flow"
            if let density = density, density == .dense {
                result += " dense"
            }
            if let trackSize = trackSize {
                return "\(result) / \(trackSize)"
            } else {
                return "\(result) / auto"
            }
        case .explicit(let tracks, let autoFlow):
            let tracksStr = tracks.map { $0.description }.joined(separator: " ")
            return "\(tracksStr) / \(autoFlow)"
        case .global(let value):
            return value.description
        }
    }
}

/// Direction for auto-flow grid layout
public enum AutoFlowDirection: Sendable, Hashable {
    /// Row direction
    case row

    /// Column direction
    case column
}

/// Density for auto-flow grid layout
public enum AutoFlowDensity: Sendable, Hashable {
    /// Normal density
    case normal

    /// Dense packing algorithm
    case dense
}

/// Auto-flow configuration for explicit grid tracks
public struct AutoFlow: Sendable, Hashable, CustomStringConvertible {
    /// Direction of auto-flow
    let direction: AutoFlowDirection

    /// Density of auto-flow
    let density: AutoFlowDensity

    /// Auto track size
    let trackSize: GridTrackSize?

    /// Creates an auto-flow configuration
    public static func autoFlow(
        _ direction: AutoFlowDirection,
        _ density: AutoFlowDensity = .normal,
        _ trackSize: GridTrackSize? = nil
    ) -> AutoFlow {
        return AutoFlow(direction: direction, density: density, trackSize: trackSize)
    }

    public var description: String {
        var result = "auto-flow"
        if density == .dense {
            result += " dense"
        }
        if let size = trackSize {
            result += " \(size)"
        }
        return result
    }
}

/// Represents a CSS grid track size
public enum GridTrackSize: Sendable, Hashable, CustomStringConvertible {
    /// Auto sizing
    case auto

    /// Fixed length value
    case px(Double)

    /// Percentage value
    case percentage(Percentage)

    /// Flexible length
    case fr(Double)

    /// Minimum content size
    case minContent

    /// Maximum content size
    case maxContent

    /// Min-max value range
    case minMax(MinMaxValue, MinMaxValue)

    /// Fit content to argument
    case fitContent(LengthPercentage)

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
        }
    }
}
