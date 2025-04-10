import Foundation
import CSSTypeTypes

/// The CSS `grid-template-columns` property defines the line names and track sizing functions of the grid columns.
///
/// This property specifies the size of columns in the grid, and assigns a name to each line that forms the columns.
///
/// Example:
/// ```swift
/// .gridTemplateColumns(.none)                                // grid-template-columns: none
/// .gridTemplateColumns(.tracks([.px(100), .fr(1)]))         // grid-template-columns: 100px 1fr
/// .gridTemplateColumns(.tracks([.auto, .fr(2)]))            // grid-template-columns: auto 2fr
/// .gridTemplateColumns(.tracks([.minContent, .maxContent])) // grid-template-columns: min-content max-content
/// .gridTemplateColumns(.named([
///     NamedTrack(before: "line1", size: .px(100), after: "line2"),
///     NamedTrack(size: .percentage(50), after: "line3")
/// ]))                                                      // grid-template-columns: [line1] 100px [line2] 50% [line3]
/// .gridTemplateColumns(.repeat(3, [.px(100)]))             // grid-template-columns: repeat(3, 100px)
/// .gridTemplateColumns(.autoFill([.px(100)]))              // grid-template-columns: repeat(auto-fill, 100px)
/// .gridTemplateColumns(.autoFit([.px(100)]))               // grid-template-columns: repeat(auto-fit, 100px)
/// .gridTemplateColumns(.subgrid)                            // grid-template-columns: subgrid
/// .gridTemplateColumns(.global(.inherit))                   // grid-template-columns: inherit
/// ```
///
/// - SeeAlso: [MDN Web Docs on grid-template-columns](https://developer.mozilla.org/en-US/docs/Web/CSS/grid-template-columns)
public enum GridTemplateColumns: Property {
    public static let property: String = "grid-template-columns"
    
    /// No explicit grid. Columns will be implicitly generated.
    case none
    
    /// Specifies track sizes for columns without naming grid lines
    case tracks([GridTrackSize])
    
    /// Specifies named grid lines with track sizes
    case named([NamedTrack])
    
    /// Specifies track list with explicit repeat
    case `repeat`(Int, [GridTrackSize])
    
    /// Auto-fill: Repeat as many columns as will fit
    case autoFill([GridTrackSize])
    
    /// Auto-fit: Like auto-fill but collapses empty tracks
    case autoFit([GridTrackSize])
    
    /// Subgrid: Adopts the column definition from parent grid
    case subgrid
    
    /// Global values (inherit, initial, etc.)
    case global(CSSTypeTypes.Global)
    
    /// Represents a grid track with optional line names before and after
    public struct NamedTrack: Sendable, Equatable {
        /// Line name before the track (optional)
        public let before: String?
        
        /// Track size
        public let size: GridTrackSize
        
        /// Line name after the track (optional)
        public let after: String?
        
        /// Creates a named track with optional before and after line names
        public init(before: String? = nil, size: GridTrackSize, after: String? = nil) {
            self.before = before
            self.size = size
            self.after = after
        }
        
        /// Generates the CSS string representation of the named track
        public var description: String {
            var result = ""
            
            if let before = before {
                result += "[\(before)] "
            }
            
            result += size.description
            
            if let after = after {
                result += " [\(after)]"
            }
            
            return result
        }
    }
    
    public var description: String {
        switch self {
        case .none:
            return "none"
        case .tracks(let sizes):
            return sizes.map { $0.description }.joined(separator: " ")
        case .named(let namedTracks):
            return namedTracks.map { $0.description }.joined(separator: " ")
        case .repeat(let count, let sizes):
            let sizeStr = sizes.map { $0.description }.joined(separator: " ")
            return "repeat(\(count), \(sizeStr))"
        case .autoFill(let sizes):
            let sizeStr = sizes.map { $0.description }.joined(separator: " ")
            return "repeat(auto-fill, \(sizeStr))"
        case .autoFit(let sizes):
            let sizeStr = sizes.map { $0.description }.joined(separator: " ")
            return "repeat(auto-fit, \(sizeStr))"
        case .subgrid:
            return "subgrid"
        case .global(let value):
            return value.description
        }
    }
}
