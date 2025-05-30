import Foundation
import CSSTypeTypes

/// The `marker-start` CSS property points to a marker that will be drawn on the first vertex of the element's path.
///
/// This property defines the marker (typically an arrowhead or other shape) that should be drawn at the starting vertex 
/// of an SVG path. The marker must be defined using an SVG `<marker>` element and can only be referenced with a URL value.
///
/// - Note: This property only applies to SVG elements like `<circle>`, `<ellipse>`, `<line>`, `<path>`, 
///         `<polygon>`, `<polyline>`, and `<rect>`.
///
/// - Note: For many SVG shapes, the first and last vertices may be in the same place (e.g., the top left corner of a `<rect>`). 
///         In such cases, both first and last markers will be drawn at that point if they are both defined.
///
/// - SeeAlso: [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/CSS/marker-start)
/// - SeeAlso: `marker-mid`, `marker-end`, `marker` (shorthand)
public enum MarkerStart: Property {
    public static let property: String = "marker-start"
    
    /// No marker will be drawn at the first vertex of the element's path.
    case none
    
    /// A URL reference to a marker element to be drawn at the first vertex of the element's path.
    case url(Url)
    
    /// Global values
    case global(CSSTypeTypes.Global)
    
    public var description: String {
        switch self {
        case .none:
            return "none"
        case .url(let url):
            return url.description
        case .global(let value):
            return value.description
        }
    }
}

/// Factory methods for creating marker-start values
extension MarkerStart {
    /// Creates a URL reference to a marker defined with the specified ID.
    ///
    /// - Parameter id: The ID of the SVG marker element, without the '#' prefix.
    /// - Returns: A `MarkerStart` value referencing the marker.
    ///
    /// Example:
    /// ```swift
    /// .markerStart(.reference(id: "arrow"))  // marker-start: url("#arrow")
    /// ```
    public static func reference(id: String) -> Self {
        .url(Url("#\(id)"))
    }
    
    /// Creates a URL reference to an external marker defined in the specified file.
    ///
    /// - Parameters:
    ///   - file: The path to the external file containing the marker definition.
    ///   - id: The ID of the SVG marker element, without the '#' prefix.
    /// - Returns: A `MarkerStart` value referencing the external marker.
    ///
    /// Example:
    /// ```swift
    /// .markerStart(.externalReference(file: "markers.svg", id: "arrow"))  // marker-start: url("markers.svg#arrow")
    /// ```
    public static func externalReference(file: String, id: String) -> Self {
        .url(Url("\(file)#\(id)"))
    }
}
