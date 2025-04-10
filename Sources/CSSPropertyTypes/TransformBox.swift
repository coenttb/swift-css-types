import Foundation
import CSSTypeTypes

/// The CSS `transform-box` property defines the layout box to which the `transform`,
/// individual transform properties (`translate`, `scale`, `rotate`), and `transform-origin` properties relate.
///
/// Example:
/// ```swift
/// .transformBox(.contentBox)   // transform-box: content-box
/// .transformBox(.borderBox)    // transform-box: border-box
/// .transformBox(.fillBox)      // transform-box: fill-box
/// .transformBox(.strokeBox)    // transform-box: stroke-box
/// .transformBox(.viewBox)      // transform-box: view-box
/// ```
///
/// The transform box establishes the reference box that transform coordinates and origins are relative to.
/// This is especially important for SVG elements where different coordinate systems can be used.
///
/// - SeeAlso: [MDN Web Docs on transform-box](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-box)
public enum TransformBox: Property {
    
    public static let property: String = "transform-box"
    
    /// The content box is used as the reference box.
    ///
    /// The reference box of a `<table>` is the border box of its table wrapper box, not its table box.
    case contentBox
    
    /// The border box is used as the reference box.
    ///
    /// The reference box of a `<table>` is the border box of its table wrapper box, not its table box.
    case borderBox
    
    /// The object bounding box is used as the reference box.
    ///
    /// For elements with associated CSS layout box, acts as `content-box`.
    /// This is particularly useful for SVG elements.
    case fillBox
    
    /// The stroke bounding box is used as the reference box.
    ///
    /// For elements with associated CSS layout box, acts as `border-box`.
    case strokeBox
    
    /// The nearest SVG viewport is used as the reference box.
    ///
    /// If a `viewBox` attribute is specified for the SVG viewport creating element,
    /// the reference box is positioned at the origin of the coordinate system established
    /// by the `viewBox` attribute, and the dimension of the reference box is set to
    /// the width and height values of the `viewBox` attribute.
    ///
    /// For elements with associated CSS layout box, acts as `border-box`.
    /// This is the default value.
    case viewBox
    
    case global(CSSTypeTypes.Global)
}

/// CSS Output conversion
extension TransformBox: CustomStringConvertible {
    /// Converts the transform-box value to its CSS string representation
    public var description: String {
        switch self {
        case .contentBox:
            return "content-box"
        case .borderBox:
            return "border-box"
        case .fillBox:
            return "fill-box"
        case .strokeBox:
            return "stroke-box"
        case .viewBox:
            return "view-box"
        case .global(let global):
            return global.description
        }
    }
}

/// Default value and convenience methods
extension TransformBox {
    /// The default transform box (view-box)
    public static let defaultValue: TransformBox = .viewBox
    
    /// Use for CSS elements to use the content area as reference
    ///
    /// For SVG elements with associated CSS layout, acts like content-box.
    ///
    /// - Returns: A transform box property with content-box value
    public static func content() -> TransformBox {
        .contentBox
    }
    
    /// Use for CSS elements to use the border area as reference
    ///
    /// This includes padding and border, but not margin.
    ///
    /// - Returns: A transform box property with border-box value
    public static func border() -> TransformBox {
        .borderBox
    }
    
    /// Use for SVG elements to transform relative to their bounding box
    ///
    /// This makes the transform origin the center of the SVG element's bounding box.
    /// For example, applying a rotation will make the element spin around its own center,
    /// rather than the center of the SVG viewport.
    ///
    /// - Returns: A transform box property with fill-box value
    public static func svgBoundingBox() -> TransformBox {
        .fillBox
    }
    
    /// Use for SVG elements to transform relative to the SVG viewport
    ///
    /// This makes the transform origin relative to the SVG viewport.
    /// For example, applying a rotation will make the element spin around the center of the
    /// SVG viewport, rather than its own center.
    ///
    /// - Returns: A transform box property with view-box value
    public static func svgViewport() -> TransformBox {
        .viewBox
    }
}
