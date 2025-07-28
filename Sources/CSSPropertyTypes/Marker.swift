import CSSTypeTypes
import Foundation

/// The `marker` CSS property is a shorthand property for setting the `marker-start`, `marker-mid`, and `marker-end` 
/// properties in a single declaration, establishing the markers to be used at the start, middle, 
/// and end vertices of an SVG path.
///
/// This shorthand allows you to set all marker properties to the same value, or to set them individually.
///
/// Example:
/// ```swift
/// // Set all markers to the same marker
/// .marker(.reference(id: "arrow"))
///
/// // Set different markers for start, middle, and end
/// .marker(.start(.reference(id: "circle")), 
///         .mid(.reference(id: "square")), 
///         .end(.reference(id: "arrow")))
///
/// // Set no markers
/// .marker(.none)
/// ```
///
/// - Note: This property only applies to SVG elements like `<circle>`, `<ellipse>`, `<line>`, `<path>`, 
///         `<polygon>`, `<polyline>`, and `<rect>`.
///
/// - SeeAlso: [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/CSS/marker)
/// - SeeAlso: `marker-start`, `marker-mid`, `marker-end`
public enum Marker: Property {
    public static let property: String = "marker"

    /// Set all markers to the same value
    case all(MarkerValue)

    /// Set each marker separately
    case individual(start: MarkerValue?, mid: MarkerValue?, end: MarkerValue?)

    /// Global values
    case global(CSSTypeTypes.Global)

    /// Represents a marker value
    public enum MarkerValue: Sendable, Hashable, CustomStringConvertible {
        /// No marker
        case none

        /// A URL reference to a marker element
        case url(Url)

        public var description: String {
            switch self {
            case .none:
                return "none"
            case .url(let url):
                return url.description
            }
        }
    }

    public var description: String {
        switch self {
        case .all(let value):
            return value.description
        case .individual(let start, let mid, let end):
            var parts: [String] = []

            if let start = start {
                parts.append(start.description)
            }

            if let mid = mid {
                parts.append(mid.description)
            }

            if let end = end {
                parts.append(end.description)
            }

            return parts.joined(separator: " ")
        case .global(let global):
            return global.description
        }
    }
}

/// Factory methods for creating marker values
extension Marker {
    /// Create a marker with all positions set to none
    public static let none = Marker.all(.none)

    /// Creates a URL reference to a marker defined with the specified ID for all positions
    ///
    /// - Parameter id: The ID of the SVG marker element, without the '#' prefix.
    /// - Returns: A `Marker` value referencing the marker for all positions.
    ///
    /// Example:
    /// ```swift
    /// .marker(.reference(id: "arrow"))  // MARK: er: url("#arrow")
    /// ```
    public static func reference(id: String) -> Self {
        .all(.url(Url("#\(id)")))
    }

    /// Creates a URL reference to an external marker defined in the specified file for all positions
    ///
    /// - Parameters:
    ///   - file: The path to the external file containing the marker definition.
    ///   - id: The ID of the SVG marker element, without the '#' prefix.
    /// - Returns: A `Marker` value referencing the external marker for all positions.
    ///
    /// Example:
    /// ```swift
    /// .marker(.externalReference(file: "markers.svg", id: "arrow"))  // MARK: er: url("markers.svg#arrow")
    /// ```
    public static func externalReference(file: String, id: String) -> Self {
        .all(.url(Url("\(file)#\(id)")))
    }

    /// Convenience initializer to set specific marker positions
    ///
    /// - Parameters:
    ///   - start: The marker for the start position
    ///   - mid: The marker for middle positions
    ///   - end: The marker for the end position
    /// - Returns: A marker with the specified positions set
    public static func positions(start: MarkerValue? = nil, mid: MarkerValue? = nil, end: MarkerValue? = nil) -> Self {
        .individual(start: start, mid: mid, end: end)
    }

    /// Factory method to create a marker value for the start position
    ///
    /// - Parameter value: The marker value
    /// - Returns: A marker with only the start position set
    public static func start(_ value: MarkerValue) -> Self {
        .individual(start: value, mid: nil, end: nil)
    }

    /// Factory method to create a marker value for the middle positions
    ///
    /// - Parameter value: The marker value
    /// - Returns: A marker with only the middle positions set
    public static func mid(_ value: MarkerValue) -> Self {
        .individual(start: nil, mid: value, end: nil)
    }

    /// Factory method to create a marker value for the end position
    ///
    /// - Parameter value: The marker value
    /// - Returns: A marker with only the end position set
    public static func end(_ value: MarkerValue) -> Self {
        .individual(start: nil, mid: nil, end: value)
    }
}
