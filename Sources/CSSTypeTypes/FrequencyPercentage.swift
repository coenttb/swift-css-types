import Foundation

/// Represents a CSS value that can be either a frequency or a percentage.
///
/// The `FrequencyPercentage` type allows for values expressed either as absolute
/// frequencies (Hz, kHz) or as percentages. This is used in CSS properties that
/// accept either format.
///
/// Example:
/// ```swift
/// .someProperty(.frequency(.hz(440)))    // Absolute frequency
/// .someProperty(.percentage(90))         // Percentage value
/// ```
///
/// - Note: Currently, frequency values are not widely used in CSS properties, but
///         this data type is part of the CSS Values and Units specification.
///
/// - SeeAlso: [MDN Web Docs on frequency-percentage](https://developer.mozilla.org/en-US/docs/Web/CSS/frequency-percentage)
public enum FrequencyPercentage: Sendable, Hashable, PercentageConvertible {
    /// An absolute frequency value
    case frequency(Frequency)

    /// A percentage value
    case percentage(Percentage)

    /// Creates a frequency-percentage from a hertz value
    ///
    /// - Parameter value: The frequency in hertz
    /// - Returns: A FrequencyPercentage with Hz unit
    public static func hz(_ number: Number) -> FrequencyPercentage {
        return .frequency(.hz(number))
    }

    /// Creates a frequency-percentage from a kilohertz value
    ///
    /// - Parameter value: The frequency in kilohertz
    /// - Returns: A FrequencyPercentage with kHz unit
    public static func khz(_ number: Number) -> FrequencyPercentage {
        return .frequency(.khz(number))
    }
}

/// Provides string conversion for CSS output
extension FrequencyPercentage: CustomStringConvertible {
    /// Converts the frequency-percentage to its CSS string representation
    public var description: String {
        switch self {
        case .frequency(let frequency):
            return frequency.description
        case .percentage(let percentage):
            return percentage.description
        }
    }
}
