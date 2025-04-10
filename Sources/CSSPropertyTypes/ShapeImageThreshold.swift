//
// ShapeImageThreshold.swift


import CSSTypeTypes

/// The `shape-image-threshold` CSS property sets the alpha channel threshold used to extract the shape using
/// an image as the value for `shape-outside`. Any pixels whose alpha component's value is greater than the
/// threshold are considered to be part of the shape for the purposes of determining its boundaries.
///
/// For example, a value of 0.5 means that the shape will enclose all the pixels that are more than 50% opaque.
///
/// ```css
/// shape-image-threshold: 0.7;
/// ```
public enum ShapeImageThreshold: Property {
    public static let property: String = "shape-image-threshold"
    
    /// Alpha threshold value (0.0 to 1.0)
    case value(Double)
    
    /// Global CSS value
    case global(CSSTypeTypes.Global)
    
    public var description: String {
        switch self {
        case .value(let threshold):
            // Ensure the value is clamped between 0.0 and 1.0
            let clampedValue = min(1.0, max(0.0, threshold))
            return String(format: "%.5g", clampedValue)
        case .global(let global):
            return global.description
        }
    }
    
    /// Creates a ShapeImageThreshold with a specific alpha threshold value
    /// - Parameter threshold: The alpha threshold value (will be clamped to 0.0-1.0)
    /// - Returns: A ShapeImageThreshold with the specified value
    public static func alpha(_ threshold: Double) -> Self {
        .value(threshold)
    }
}
