import CSSTypeTypes
import Foundation

/// The `marker-mid` CSS property points to a marker that will be drawn on all middle vertices of the element's path.
///
/// This property defines the marker (typically an arrowhead or other shape) that should be drawn at each middle vertex
/// (vertices between the start and end) of an SVG path. The marker must be defined using an SVG `<marker>` element
/// and can only be referenced with a URL value.
///
/// - Note: This property only applies to SVG elements like `<circle>`, `<ellipse>`, `<line>`, `<path>`,
///         `<polygon>`, `<polyline>`, and `<rect>`.
///
/// - Note: The direction each marker points is defined as the direction halfway between the preceding and following path segments.
///
/// - SeeAlso: [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/CSS/marker-mid)
/// - SeeAlso: `marker-start`, `marker-end`, `marker` (shorthand)
public enum MarkerMid: Property {
    public static let property: String = "marker-mid"
    /// No marker will be drawn at the middle vertices of the element's path.
    case none

    /// A URL reference to a marker element to be drawn at each middle vertex of the element's path.
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

/// Factory methods for creating marker-mid values
extension MarkerMid {
    /// Creates a URL reference to a marker defined with the specified ID.
    ///
    /// - Parameter id: The ID of the SVG marker element, without the '#' prefix.
    /// - Returns: A `MarkerMid` value referencing the marker.
    ///
    /// Example:
    /// ```swift
    /// .markerMid(.reference(id: "diamond"))  // MARK: er-mid: url("#diamond")
    /// ```
    public static func reference(id: String) -> Self {
        .url(Url("#\(id)"))
    }

    /// Creates a URL reference to an external marker defined in the specified file.
    ///
    /// - Parameters:
    ///   - file: The path to the external file containing the marker definition.
    ///   - id: The ID of the SVG marker element, without the '#' prefix.
    /// - Returns: A `MarkerMid` value referencing the external marker.
    ///
    /// Example:
    /// ```swift
    /// .markerMid(.externalReference(file: "markers.svg", id: "diamond"))  // MARK: er-mid: url("markers.svg#diamond")
    /// ```
    public static func externalReference(file: String, id: String) -> Self {
        .url(Url("\(file)#\(id)"))
    }
}
