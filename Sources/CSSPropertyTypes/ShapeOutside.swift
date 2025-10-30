//
// ShapeOutside.swift

import CSSTypeTypes

/// The `shape-outside` CSS property defines a shape—which may be non-rectangular—around which adjacent
/// inline content should wrap. By default, inline content wraps around its margin box; shape-outside provides
/// a way to customize this wrapping, making it possible to wrap text around complex objects rather than
/// rectangular boxes.
///
/// ```css
/// shape-outside: none;
/// shape-outside: margin-box;
/// shape-outside: content-box;
/// shape-outside: circle(50%);
/// shape-outside: ellipse(130px 140px at 20% 20%);
/// shape-outside: polygon(50% 0, 100% 50%, 50% 100%, 0 50%);
/// shape-outside: url(image.png);
/// ```
public enum ShapeOutside: Property {
  public static let property: String = "shape-outside"

  /// The float area is unaffected. Inline content wraps around the element's margin box, like usual.
  case none

  /// A shape box that defines the reference box for the shape
  public enum ShapeBox: String, Sendable {
    /// The shape is enclosed by the outside margin edge
    case marginBox = "margin-box"

    /// The shape is enclosed by the outside border edge
    case borderBox = "border-box"

    /// The shape is enclosed by the outside padding edge
    case paddingBox = "padding-box"

    /// The shape is enclosed by the outside content edge
    case contentBox = "content-box"
  }

  /// The float area is computed according to the shape of a float element's edges
  case box(ShapeBox)

  /// The float area is computed based on a basic shape function
  case shape(BasicShape)

  /// The float area is computed based on a basic shape function with a reference box
  case shapeWithBox(BasicShape, ShapeBox)

  /// The float area is extracted from the alpha channel of the specified image
  case image(url: String)

  /// Global CSS value
  case global(CSSTypeTypes.Global)

  public var description: String {
    switch self {
    case .none:
      return "none"
    case .box(let box):
      return box.rawValue
    case .shape(let shape):
      return shape.description
    case .shapeWithBox(let shape, let box):
      return "\(shape.description) \(box.rawValue)"
    case .image(let url):
      return "url(\(url))"
    case .global(let global):
      return global.description
    }
  }

  /// Creates a ShapeOutside with a circle shape
  /// - Parameters:
  ///   - radius: The radius of the circle (as a percentage or length)
  ///   - box: Optional reference box
  /// - Returns: A ShapeOutside with the specified circle shape
  public static func circle(radius: LengthPercentage, box: ShapeBox? = nil) -> Self {
    let shape = BasicShape.circle(radius: .lengthPercentage(radius), at: nil)
    return box != nil ? .shapeWithBox(shape, box!) : .shape(shape)
  }

  /// Creates a ShapeOutside with an ellipse shape
  /// - Parameters:
  ///   - radiusX: The x-radius of the ellipse
  ///   - radiusY: The y-radius of the ellipse
  ///   - box: Optional reference box
  /// - Returns: A ShapeOutside with the specified ellipse shape
  public static func ellipse(
    radiusX: LengthPercentage,
    radiusY: LengthPercentage,
    box: ShapeBox? = nil
  ) -> Self {
    let shape = BasicShape.ellipse(
      radiusX: .lengthPercentage(radiusX),
      radiusY: .lengthPercentage(radiusY),
      at: nil
    )
    return box != nil ? .shapeWithBox(shape, box!) : .shape(shape)
  }

  /// Creates a ShapeOutside with a polygon shape
  /// - Parameters:
  ///   - points: Array of (x, y) percentage coordinate pairs
  ///   - box: Optional reference box
  /// - Returns: A ShapeOutside with the specified polygon shape
  public static func polygon(_ points: [(Double, Double)], box: ShapeBox? = nil) -> Self {
    let polygonPoints = points.map { (x, y) -> (LengthPercentage, LengthPercentage) in
      (LengthPercentage.percentage(.init(floatLiteral: x)), .percentage(.init(floatLiteral: y)))
    }

    let shape = BasicShape.polygon(points: polygonPoints)
    return box != nil ? .shapeWithBox(shape, box!) : .shape(shape)
  }
}
