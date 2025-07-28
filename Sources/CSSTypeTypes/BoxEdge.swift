import Foundation

/// Represents CSS box edge keywords used for various box model properties.
///
/// The `BoxEdge` data type defines the different edges of an element's box model.
/// These values are used in properties that need to reference specific parts of the box model,
/// such as `background-clip`, `transform-box`, or `clip-path`.
///
/// Example:
/// ```swift
/// .backgroundClip(.contentBox)    // Clip background to content box
/// .boxSizing(.borderBox)          // Include padding and border in sizing
/// ```
///
/// - Note: In the CSS box model, an element is composed of concentric rectangular boxes:
///         content (innermost), padding, border, and margin (outermost).
///
/// - SeeAlso: [MDN Web Docs on box-edge values](https://developer.mozilla.org/en-US/docs/Web/CSS/box-edge)
public enum BoxEdge: String, Sendable, Hashable {
    /// The innermost box containing the element's content
    ///
    /// This represents the actual content area (like text or images).
    /// ```css
    /// background-clip: content-box;
    /// ```
    case contentBox = "content-box"

    /// The box including the element's content and padding
    ///
    /// This extends to the outer edge of the padding area.
    /// ```css
    /// background-clip: padding-box;
    /// ```
    case paddingBox = "padding-box"

    /// The box including the element's content, padding, and border
    ///
    /// This extends to the outer edge of the border area.
    /// ```css
    /// box-sizing: border-box;
    /// ```
    case borderBox = "border-box"

    /// The box including the element's content, padding, border, and margin
    ///
    /// This extends to the outer edge of the margin area.
    /// ```css
    /// shape-outside: margin-box;
    /// ```
    case marginBox = "margin-box"

    /// For SVG elements, represents the object bounding box
    ///
    /// In CSS, this is treated as `content-box`.
    /// ```css
    /// transform-box: fill-box;
    /// ```
    case fillBox = "fill-box"

    /// For SVG elements, represents the stroke bounding box
    ///
    /// In CSS, this is treated as `border-box`.
    /// ```css
    /// transform-box: stroke-box;
    /// ```
    case strokeBox = "stroke-box"

    /// For SVG elements, refers to the nearest SVG viewport's origin box
    ///
    /// In CSS, this is treated as `border-box`.
    /// ```css
    /// transform-box: view-box;
    /// ```
    case viewBox = "view-box"
}

/// Represents specialized subtypes of BoxEdge used in different contexts
extension BoxEdge {
    /// Box edges for visual rendering (content-box, padding-box, border-box)
    public enum Visual: String, Sendable, Hashable {
        case contentBox = "content-box"
        case paddingBox = "padding-box"
        case borderBox = "border-box"
    }

    /// Box edges for layout (content-box, padding-box, border-box, margin-box)
    public enum Layout: String, Sendable, Hashable {
        case contentBox = "content-box"
        case paddingBox = "padding-box"
        case borderBox = "border-box"
        case marginBox = "margin-box"
    }

    /// Box edges for painting (content-box, padding-box, border-box, fill-box, stroke-box)
    public enum Paint: String, Sendable, Hashable {
        case contentBox = "content-box"
        case paddingBox = "padding-box"
        case borderBox = "border-box"
        case fillBox = "fill-box"
        case strokeBox = "stroke-box"
    }

    /// Box edges for coordinate systems
    public enum Coordinate: String, Sendable, Hashable {
        case contentBox = "content-box"
        case paddingBox = "padding-box"
        case borderBox = "border-box"
        case fillBox = "fill-box"
        case strokeBox = "stroke-box"
        case viewBox = "view-box"
    }

    /// Box edges for geometric operations (margin-box, fill-box, stroke-box, view-box)
    public enum Geometry: String, Sendable, Hashable {
        case contentBox = "content-box"
        case paddingBox = "padding-box"
        case borderBox = "border-box"
        case marginBox = "margin-box"
        case fillBox = "fill-box"
        case strokeBox = "stroke-box"
        case viewBox = "view-box"
    }
}

/// Provides string conversion for CSS output
extension BoxEdge: CustomStringConvertible {
    /// Converts the box edge value to its CSS string representation
    ///
    /// This method returns the raw string value for use in CSS properties.
    public var description: String {
        return rawValue
    }
}

/// Provides string conversion for BoxEdge.Visual
extension BoxEdge.Visual: CustomStringConvertible {
    public var description: String { return rawValue }
}

/// Provides string conversion for BoxEdge.Layout
extension BoxEdge.Layout: CustomStringConvertible {
    public var description: String { return rawValue }
}

/// Provides string conversion for BoxEdge.Paint
extension BoxEdge.Paint: CustomStringConvertible {
    public var description: String { return rawValue }
}

/// Provides string conversion for BoxEdge.Coordinate
extension BoxEdge.Coordinate: CustomStringConvertible {
    public var description: String { return rawValue }
}

/// Provides string conversion for BoxEdge.Geometry
extension BoxEdge.Geometry: CustomStringConvertible {
    public var description: String { return rawValue }
}
