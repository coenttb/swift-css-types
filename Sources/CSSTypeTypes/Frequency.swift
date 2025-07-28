import Foundation

/// Represents a CSS frequency value with unit (Hz or kHz).
///
/// Frequency values represent audio frequencies such as pitch of a speaking voice.
/// Currently, they are not widely used in CSS properties, but are part of the
/// CSS Values and Units specification.
///
/// Example:
/// ```swift
/// .frequency(.hz(440))    // 440Hz (standard musical A note)
/// .frequency(.khz(2.5))   // 2.5kHz (medium-high frequency)
/// ```
///
/// - Note: Even when the value is zero, the unit must be specified in CSS.
///
/// - SeeAlso: [MDN Web Docs on frequency](https://developer.mozilla.org/en-US/docs/Web/CSS/frequency)
public enum Frequency: Sendable, Hashable {
    /// Frequency in hertz (Hz)
    case hz(Number)

    /// Frequency in kilohertz (kHz)
    case khz(Number)
}

/// Provides string conversion for CSS output
extension Frequency: CustomStringConvertible {
    /// Converts the frequency value to its CSS string representation
    ///
    /// This method formats the value and appends the appropriate unit (Hz or kHz).
    public var description: String {
        switch self {
        case .hz(let value):
            return "\(value)Hz"
        case .khz(let value):
            return "\(value)kHz"
        }
    }
}
