//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 29/08/2024.
//

import Foundation

/// Represents CSS angle values used for rotations, gradients, and transforms.
///
/// CSS angles are used in various properties like `transform`, `gradient`, and `animation`,
/// and can be specified using different units:
///
/// Visual Reference:
/// ```
///       0deg
///         ↑
/// 270deg ← → 90deg
///         ↓
///       180deg
/// ```
///
/// Example:
/// ```swift
/// .transform(.rotate(Angle.deg(45))) // Rotate 45 degrees clockwise
/// .transform(.rotate(.turn(0.5)))    // Rotate 180 degrees (half turn)
/// ```
///
/// - Note: When using numeric literals, angles default to degrees.
///         For example, `.transform(.rotate(45))` means 45 degrees, and
///         `.transform(.rotate(0.5))` means 0.5 degrees (not 0.5 turns!).
///
/// - SeeAlso: [MDN Web Docs on CSS angle values](https://developer.mozilla.org/en-US/docs/Web/CSS/angle)
public enum Angle: Sendable, Equatable, ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {
    /// Specifies an angle in degrees (0-360)
    /// 
    /// A full circle is 360 degrees. This is the most common angle unit in CSS.
    /// ```css
    /// transform: rotate(45deg); /* 45° clockwise rotation */
    /// ```
    case deg(Double)
    
    /// Specifies an angle in radians
    /// 
    /// A full circle is 2π radians (approximately 6.28318rad).
    /// Commonly used in mathematical contexts.
    /// ```css
    /// transform: rotate(1.57079rad); /* 90° (π/2) clockwise rotation */
    /// ```
    case rad(Double)
    
    /// Specifies an angle in gradians
    /// 
    /// A full circle is 400 gradians. This unit is less commonly used.
    /// ```css
    /// transform: rotate(100grad); /* 90° clockwise rotation */
    /// ```
    case grad(Double)
    
    /// Specifies an angle as a fraction of a full circle
    /// 
    /// A full circle is 1 turn. This is intuitive for full rotations.
    /// ```css
    /// transform: rotate(0.25turn); /* 90° clockwise rotation */
    /// ```
    case turn(Double)

    /// Creates an angle in degrees from an integer literal
    ///
    /// This allows you to use integers directly where angles are expected.
    /// Note that numeric literals always default to degrees, not other units.
    ///
    /// ```swift
    /// .transform(.rotate(45))  // 45 degrees
    /// .transform(.rotate(90))  // 90 degrees
    /// ```
    ///
    /// If you need other units like turns or radians, use the specific case:
    /// ```swift
    /// .transform(.rotate(.turn(0.5)))  // Half turn (180 degrees)
    /// ```
    public init(integerLiteral value: Int) {
        self = .deg(Double(value))
    }

    /// Creates an angle in degrees from a floating-point literal
    ///
    /// This allows you to use decimals directly where angles are expected.
    /// Important: Numeric literals always default to degrees, not other units.
    ///
    /// ```swift
    /// .transform(.rotate(45.5))  // 45.5 degrees
    /// .transform(.rotate(0.5))   // 0.5 degrees (NOT 0.5 turns!)
    /// ```
    ///
    /// If you need turns or other units, use the specific case:
    /// ```swift
    /// .transform(.rotate(.turn(0.5)))  // Half turn (180 degrees)
    /// ```
    public init(floatLiteral value: Double) {
        self = .deg(value)
    }
}

extension Angle {
    public static func degrees(_ value: Double) -> Self {
        .deg(value)
    }
    
    public static func gradians(_ value: Double) -> Self {
        .grad(value)
    }
    
    public static func radians(_ value: Double) -> Self {
        .rad(value)
    }
}

/// Provides string conversion for CSS output
extension Angle: CustomStringConvertible {
    /// Converts the angle value to its CSS string representation
    ///
    /// This method generates the exact string that should be used in CSS:
    /// ```css
    /// transform: rotate(45deg);
    /// transform: rotate(0.5turn);
    /// ```
    public var description: String {
        switch self {
        case .deg(let value):
            return "\(value.truncatingRemainder())deg"
        case .rad(let value):
            return "\(value.truncatingRemainder())rad"
        case .grad(let value):
            return "\(value.truncatingRemainder())grad"
        case .turn(let value):
            return "\(value.truncatingRemainder())turn"
        }
    }
}
