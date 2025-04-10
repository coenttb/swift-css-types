//
// StrokeMiterlimit.swift


import CSSTypeTypes

/// The `stroke-miterlimit` CSS property defines a limit on the ratio of the miter length to the stroke-width
/// when the shape to be used at the corners of an SVG element's stroked path is a mitered join. If the limit
/// defined by this property is exceeded, the join is converted from miter to bevel, thus making the corner
/// appear truncated.
///
/// This property applies to any SVG corner-generating shape or text-content element. If present, it overrides
/// the element's stroke-miterlimit attribute.
///
/// ```css
/// stroke-miterlimit: 1;
/// stroke-miterlimit: 4;
/// stroke-miterlimit: 10.5;
/// ```
public enum StrokeMiterlimit: Property, ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral, CustomStringConvertible {
    public static let property: String = "stroke-miterlimit"
    
    /// A numeric miter limit value (must be >= 1)
    case value(Double)
    
    /// Global CSS value
    case global(CSSTypeTypes.Global)
    
    public var description: String {
        switch self {
        case .value(let limit):
            // Ensure the value is at least 1.0
            let clampedValue = max(1.0, limit)
            return String(format: "%.5g", clampedValue)
        case .global(let global):
            return global.description
        }
    }
    
    /// Creates a StrokeMiterlimit with a specific miter limit value
    /// - Parameter limit: The miter limit (must be >= 1)
    /// - Returns: A StrokeMiterlimit with the specified value
    public static func limit(_ limit: Double) -> Self {
        .value(limit)
    }
    
    /// Creates a StrokeMiterlimit using an integer literal
    public init(integerLiteral value: Int) {
        self = .value(Double(value))
    }
    
    /// Creates a StrokeMiterlimit using a floating-point literal
    public init(floatLiteral value: Double) {
        self = .value(value)
    }
}
