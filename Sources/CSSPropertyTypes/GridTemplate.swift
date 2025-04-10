import Foundation
import CSSTypeTypes

/// The CSS `grid-template` property is a shorthand property for defining grid columns, rows, and areas.
///
/// This property is a shorthand for setting `grid-template-columns`, `grid-template-rows`, and `grid-template-areas`
/// in a single declaration. It allows defining named grid areas, line names, and track sizes in a concise way.
///
/// Example:
/// ```swift
/// .gridTemplate(.none)                                // grid-template: none
/// 
/// // rows / columns syntax
/// .gridTemplate(.rowsColumns([.px(100), .fr(1)], [.fr(1), .auto])) // grid-template: 100px 1fr / 1fr auto
/// 
/// // Named areas syntax
/// .gridTemplate(.namedAreas(
///     [
///         GridTemplate.AreaRow("a a a", size: .px(40)),
///         GridTemplate.AreaRow("b c c", size: .px(40)),
///         GridTemplate.AreaRow("b c c", size: .px(40))
///     ],
///     columns: [.fr(1), .fr(1), .fr(1)]
/// )) // grid-template: "a a a" 40px "b c c" 40px "b c c" 40px / 1fr 1fr 1fr
/// 
/// // Line names, grid areas, and sizes
/// .gridTemplate(.namedAreas(
///     [
///         GridTemplate.AreaRow("head head", lineNamesBefore: ["header-left"], lineNamesAfter: ["header-right"], size: .px(30)),
///         GridTemplate.AreaRow("nav main", lineNamesBefore: ["main-left"], lineNamesAfter: ["main-right"], size: .fr(1)),
///         GridTemplate.AreaRow("nav foot", lineNamesBefore: ["footer-left"], lineNamesAfter: ["footer-right"], size: .px(30))
///     ],
///     columns: [.px(120), .fr(1)]
/// )) // grid-template: [header-left] "head head" 30px [header-right] [main-left] "nav main" 1fr [main-right] [footer-left] "nav foot" 30px [footer-right] / 120px 1fr
///
/// .gridTemplate(.global(.inherit))                    // grid-template: inherit
/// ```
///
/// - SeeAlso: [MDN Web Docs on grid-template](https://developer.mozilla.org/en-US/docs/Web/CSS/grid-template)
public enum GridTemplate: Property {
    
    public static let property: String = "grid-template"
    
    /// Represents no explicit grid, equivalent to setting all three longhand properties to none
    case none
    
    /// Specifies track sizes for rows and columns without naming grid areas
    /// Sets grid-template-rows and grid-template-columns to the specified values, and sets grid-template-areas to none
    case rowsColumns([GridTrackSize], [GridTrackSize])
    
    /// Specifies named grid areas with optional line names and track sizes
    /// Sets grid-template-areas to the strings listed, grid-template-rows to the track sizes,
    /// and grid-template-columns to the track listing specified (or none, if not specified)
    case namedAreas([AreaRow], columns: [GridTrackSize]? = nil)
    
    /// Global values (inherit, initial, etc.)
    case global(CSSTypeTypes.Global)
    
    /// Represents a single row in a grid template area definition
    public struct AreaRow: Sendable, Equatable {
        /// The string representation of the grid area for this row
        public let area: String
        
        /// Line names that appear before this row
        public let lineNamesBefore: [String]?
        
        /// Track size for this row
        public let size: GridTrackSize?
        
        /// Line names that appear after this row
        public let lineNamesAfter: [String]?
        
        /// Creates a grid area row with just an area string
        public init(_ area: String) {
            self.area = area
            self.lineNamesBefore = nil
            self.size = nil
            self.lineNamesAfter = nil
        }
        
        /// Creates a grid area row with an area string and track size
        public init(_ area: String, size: GridTrackSize) {
            self.area = area
            self.lineNamesBefore = nil
            self.size = size
            self.lineNamesAfter = nil
        }
        
        /// Creates a grid area row with area string, line names, and size
        public init(_ area: String, lineNamesBefore: [String]? = nil, lineNamesAfter: [String]? = nil, size: GridTrackSize? = nil) {
            self.area = area
            self.lineNamesBefore = lineNamesBefore
            self.size = size
            self.lineNamesAfter = lineNamesAfter
        }
        
        /// Generates the CSS string representation of this row
        public var description: String {
            var result = ""
            
            if let lineNamesBefore = lineNamesBefore, !lineNamesBefore.isEmpty {
                result += "[\(lineNamesBefore.joined(separator: " "))] "
            }
            
            result += "\"\(area)\""
            
            if let size = size {
                result += " \(size)"
            }
            
            if let lineNamesAfter = lineNamesAfter, !lineNamesAfter.isEmpty {
                result += " [\(lineNamesAfter.joined(separator: " "))]"
            }
            
            return result
        }
    }
    
    public var description: String {
        switch self {
        case .none:
            return "none"
        case .rowsColumns(let rows, let columns):
            let rowsStr = rows.map { $0.description }.joined(separator: " ")
            let columnsStr = columns.map { $0.description }.joined(separator: " ")
            return "\(rowsStr) / \(columnsStr)"
        case .namedAreas(let rows, let columns):
            let rowsStr = rows.map { $0.description }.joined(separator: " ")
            
            if let columns = columns, !columns.isEmpty {
                let columnsStr = columns.map { $0.description }.joined(separator: " ")
                return "\(rowsStr) / \(columnsStr)"
            }
            
            return rowsStr
        case .global(let value):
            return value.description
        }
    }
}
