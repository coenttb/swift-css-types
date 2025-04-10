import Foundation
import CSSTypeTypes

/// The CSS `grid-template-rows` property defines the line names and track sizing functions of the grid rows.
///
/// This property specifies the size of rows in the grid, and assigns a name to each line that forms the rows.
///
/// Example:
/// ```swift
/// .gridTemplateRows(.none)                                // grid-template-rows: none
/// .gridTemplateRows(.tracks([.px(40), .fr(1)]))          // grid-template-rows: 40px 1fr
/// .gridTemplateRows(.tracks([.auto, .fr(2)]))            // grid-template-rows: auto 2fr
/// .gridTemplateRows(.tracks([.minContent, .maxContent])) // grid-template-rows: min-content max-content
/// .gridTemplateRows(.named([
///     NamedTrack(before: "header", size: .px(50)),
///     NamedTrack(size: .fr(1), after: "main"),
///     NamedTrack(before: "footer", size: .px(50))
/// ]))                                                    // grid-template-rows: [header] 50px [main] 1fr [footer] 50px
/// .gridTemplateRows(.repeat(3, [.px(100)]))             // grid-template-rows: repeat(3, 100px)
/// .gridTemplateRows(.autoFill([.px(100)]))              // grid-template-rows: repeat(auto-fill, 100px)
/// .gridTemplateRows(.autoFit([.px(100)]))               // grid-template-rows: repeat(auto-fit, 100px)
/// .gridTemplateRows(.subgrid)                            // grid-template-rows: subgrid
/// .gridTemplateRows(.global(.inherit))                   // grid-template-rows: inherit
/// ```
///
/// - SeeAlso: [MDN Web Docs on grid-template-rows](https://developer.mozilla.org/en-US/docs/Web/CSS/grid-template-rows)
public enum GridTemplateRows: Property {
    public static let property: String = "grid-template-rows"
    /// No explicit grid. Rows will be implicitly generated.
    case none
    
    /// Specifies track sizes for rows without naming grid lines
    case tracks([GridTrackSize])
    
    /// Specifies named grid lines with track sizes
    case named([NamedTrack])
    
    /// Specifies track list with explicit repeat
    case `repeat`(Int, [GridTrackSize])
    
    /// Auto-fill: Repeat as many rows as will fit
    case autoFill([GridTrackSize])
    
    /// Auto-fit: Like auto-fill but collapses empty tracks
    case autoFit([GridTrackSize])
    
    /// Subgrid: Adopts the row definition from parent grid
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
