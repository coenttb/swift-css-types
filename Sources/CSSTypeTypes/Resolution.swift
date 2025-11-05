import Foundation

/// Represents a CSS resolution value.
///
/// The `Resolution` type denotes the pixel density of an output device. Resolution values
/// are commonly used in media queries to target devices with specific pixel densities,
/// such as high-DPI displays.
///
/// Example:
/// ```swift
/// @media print and (min-resolution: \(Resolution.dpi(300)))  // @media print and (min-resolution: 300dpi)
/// @media (resolution: \(Resolution.dpcm(120)))               // @media (resolution: 120dpcm)
/// @media (min-resolution: \(Resolution.dppx(2)))             // @media (min-resolution: 2dppx)
/// ```
///
/// - Note: On screens, the units are related to CSS inches, centimeters, or pixels, not physical values.
///
/// - SeeAlso: [MDN Web Docs on resolution](https://developer.mozilla.org/en-US/docs/Web/CSS/resolution)
public struct Resolution: Sendable, Hashable {
    /// Represents the resolution unit (dpi, dpcm, dppx, x)
    public enum Unit: String, Sendable, Hashable {
        /// Dots per inch (1dpi ≈ 0.39dpcm)
        case dpi

        /// Dots per centimeter (1dpcm ≈ 2.54dpi)
        case dpcm

        /// Dots per px unit (1dppx = 96dpi)
        case dppx

        /// Alias for dppx
        case x
    }

    /// The numeric value of the resolution
    public let value: Double

    /// The unit of the resolution
    public let unit: Unit

    /// Creates a new CSS resolution value
    /// - Parameters:
    ///   - value: The numeric value (must be positive)
    ///   - unit: The resolution unit
    public init(_ value: Double, unit: Unit) {
        precondition(value > 0, "Resolution value must be positive")
        self.value = value
        self.unit = unit
    }

    /// Creates a resolution in dots per inch (dpi)
    /// - Parameter value: The dpi value (must be positive)
    /// - Returns: A resolution value in dpi
    public static func dpi(_ value: Double) -> Resolution {
        return Resolution(value, unit: .dpi)
    }

    /// Creates a resolution in dots per centimeter (dpcm)
    /// - Parameter value: The dpcm value (must be positive)
    /// - Returns: A resolution value in dpcm
    public static func dpcm(_ value: Double) -> Resolution {
        return Resolution(value, unit: .dpcm)
    }

    /// Creates a resolution in dots per px unit (dppx)
    /// - Parameter value: The dppx value (must be positive)
    /// - Returns: A resolution value in dppx
    public static func dppx(_ value: Double) -> Resolution {
        return Resolution(value, unit: .dppx)
    }

    /// Creates a resolution in x units (alias for dppx)
    /// - Parameter value: The x value (must be positive)
    /// - Returns: A resolution value in x units
    public static func x(_ value: Double) -> Resolution {
        return Resolution(value, unit: .x)
    }

    /// Converts the resolution to different units
    /// - Parameter targetUnit: The unit to convert to
    /// - Returns: A new resolution in the requested unit with an equivalent value
    public func converted(to targetUnit: Unit) -> Resolution {
        if unit == targetUnit {
            return self
        }

        // First convert to dpi as the common intermediate unit
        let dpiValue: Double
        switch unit {
        case .dpi:
            dpiValue = value
        case .dpcm:
            dpiValue = value * 2.54  // 1 dpcm = 2.54 dpi
        case .dppx, .x:
            dpiValue = value * 96  // 1 dppx = 96 dpi
        }

        // Then convert from dpi to the target unit
        switch targetUnit {
        case .dpi:
            return Resolution(dpiValue, unit: .dpi)
        case .dpcm:
            return Resolution(dpiValue / 2.54, unit: .dpcm)
        case .dppx:
            return Resolution(dpiValue / 96, unit: .dppx)
        case .x:
            return Resolution(dpiValue / 96, unit: .x)
        }
    }

    /// Standard screen resolution (96dpi, 1dppx)
    public static let standard = Resolution.dpi(96)

    /// High-DPI (Retina) resolution (192dpi, 2dppx)
    public static let retina = Resolution.dpi(192)

    /// Common print resolution (300dpi)
    public static let print = Resolution.dpi(300)
}

/// Provides string conversion for CSS output
extension Resolution: CustomStringConvertible {
    /// Converts the resolution to its CSS string representation
    public var description: String {
        return "\(value.truncatingRemainder())\(unit.rawValue)"
    }
}
