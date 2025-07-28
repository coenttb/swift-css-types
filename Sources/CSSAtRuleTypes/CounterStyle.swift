import Foundation

/// Represents a CSS @counter-style at-rule.
///
/// The @counter-style CSS at-rule lets you define custom counter styles for lists
/// and counters that are not part of the predefined set of styles.
///
/// Examples:
/// ```swift
/// // Basic counter style
/// CounterStyle("thumbs")
///     .system(.cyclic)
///     .symbols(["👍"])
///     .suffix(" ")
///
/// // Roman numerals style
/// CounterStyle("my-lower-roman")
///     .system(.additive)
///     .additiveSymbols([
///         (1000, "m"),
///         (900, "cm"),
///         (500, "d"),
///         (400, "cd"),
///         (100, "c"),
///         (90, "xc"),
///         (50, "l"),
///         (40, "xl"),
///         (10, "x"),
///         (9, "ix"),
///         (5, "v"),
///         (4, "iv"),
///         (1, "i")
///     ])
///     .range(.infinite)
/// ```
public struct CounterStyle: AtRule {
    public static let identifier: String = "container-style"

    public var rawValue: String
    private var name: String
    private var descriptors: [String: String] = [:]

    public init(rawValue: String) {
        self.rawValue = rawValue

        // Extract name from rawValue for future reference
        // This is a simplified implementation; a proper parser would be more complex
        if let nameRange = rawValue.range(of: "@counter-style\\s+([\\w-]+)\\s*\\{", options: .regularExpression),
           let match = rawValue[nameRange].range(of: "\\s+([\\w-]+)", options: .regularExpression) {
            self.name = String(rawValue[match]).trimmingCharacters(in: .whitespacesAndNewlines)
        } else {
            self.name = ""
        }
    }

    /// Creates a counter style with the specified name.
    ///
    /// - Parameter name: The name of the counter style.
    public init(_ name: String) {
        self.name = name
        self.rawValue = "@counter-style \(name) {}"
    }

    /// Updates the raw value based on the current descriptors.
    private mutating func updateRawValue() {
        let descriptorString = descriptors.map { key, value in
            "  \(key): \(value);"
        }.joined(separator: "\n")

        if descriptorString.isEmpty {
            rawValue = "@counter-style \(name) {}"
        } else {
            rawValue = "@counter-style \(name) {\n\(descriptorString)\n}"
        }
    }

    /// Sets the system descriptor.
    ///
    /// - Parameter system: The counting system to use.
    /// - Returns: An updated CounterStyle instance.
    public func system(_ system: System) -> CounterStyle {
        var style = self
        style.descriptors["system"] = system.rawValue
        style.updateRawValue()
        return style
    }

    /// Sets the symbols descriptor.
    ///
    /// - Parameter symbols: The symbols to use for marker representation.
    /// - Returns: An updated CounterStyle instance.
    public func symbols(_ symbols: [String]) -> CounterStyle {
        var style = self
        style.descriptors["symbols"] = symbols.joined(separator: " ")
        style.updateRawValue()
        return style
    }

    /// Sets the additive-symbols descriptor.
    ///
    /// - Parameter symbols: An array of tuples containing weights and symbols.
    /// - Returns: An updated CounterStyle instance.
    public func additiveSymbols(_ symbols: [(Int, String)]) -> CounterStyle {
        var style = self
        let symbolString = symbols
            .map { "\(String($0.0)) \"\($0.1)\"" }
            .joined(separator: " ")
        style.descriptors["additive-symbols"] = symbolString
        style.updateRawValue()
        return style
    }

    /// Sets the negative descriptor.
    ///
    /// - Parameters:
    ///   - prefix: The prefix to use for negative values.
    ///   - suffix: The suffix to use for negative values.
    /// - Returns: An updated CounterStyle instance.
    public func negative(prefix: String, suffix: String = "") -> CounterStyle {
        var style = self
        style.descriptors["negative"] = "\"\(prefix)\" \"\(suffix)\""
        style.updateRawValue()
        return style
    }

    /// Sets the prefix descriptor.
    ///
    /// - Parameter prefix: The prefix to use.
    /// - Returns: An updated CounterStyle instance.
    public func prefix(_ prefix: String) -> CounterStyle {
        var style = self
        style.descriptors["prefix"] = "\"\(prefix)\""
        style.updateRawValue()
        return style
    }

    /// Sets the suffix descriptor.
    ///
    /// - Parameter suffix: The suffix to use.
    /// - Returns: An updated CounterStyle instance.
    public func suffix(_ suffix: String) -> CounterStyle {
        var style = self
        style.descriptors["suffix"] = "\"\(suffix)\""
        style.updateRawValue()
        return style
    }

    /// Sets the range descriptor.
    ///
    /// - Parameter range: The range over which the counter style is applicable.
    /// - Returns: An updated CounterStyle instance.
    public func range(_ range: Range) -> CounterStyle {
        var style = self
        style.descriptors["range"] = range.rawValue
        style.updateRawValue()
        return style
    }

    /// Sets the pad descriptor.
    ///
    /// - Parameters:
    ///   - length: The minimum length of the representation.
    ///   - symbol: The symbol to use for padding.
    /// - Returns: An updated CounterStyle instance.
    public func pad(length: Int, symbol: String) -> CounterStyle {
        var style = self
        style.descriptors["pad"] = "\(length) \"\(symbol)\""
        style.updateRawValue()
        return style
    }

    /// Sets the speak-as descriptor.
    ///
    /// - Parameter speakAs: The speech synthesis style.
    /// - Returns: An updated CounterStyle instance.
    public func speakAs(_ speakAs: SpeakAs) -> CounterStyle {
        var style = self
        style.descriptors["speak-as"] = speakAs.rawValue
        style.updateRawValue()
        return style
    }

    /// Sets the fallback descriptor.
    ///
    /// - Parameter fallback: The name of the counter style to fall back to.
    /// - Returns: An updated CounterStyle instance.
    public func fallback(_ fallback: String) -> CounterStyle {
        var style = self
        style.descriptors["fallback"] = fallback
        style.updateRawValue()
        return style
    }
}

// MARK: - Counter Style Enums

extension CounterStyle {
    /// Represents the counting system for a counter style.
    public enum System: String, Hashable, Sendable {
        /// A cyclic counter system cycles repeatedly through its provided symbols.
        case cyclic

        /// A numeric counter system interprets the symbols as digits in a place-value numbering system.
        case numeric

        /// An alphabetic counter system interprets the symbols as alphabetic digits.
        case alphabetic

        /// A symbolic counter system cycles through the provided symbols, doubling, tripling, etc. them at predefined intervals.
        case symbolic

        /// An additive counter system uses a combination of its symbols, with the numeric weight of each symbol adding up to the final value.
        case additive

        /// A fixed counter system just cycles through a fixed set of counter symbols, stopping when it runs out of symbols.
        case fixed

        /// Extends an existing counter style, reusing its values for any descriptors not explicitly provided.
        case extends
    }

    /// Represents the range over which a counter style is applicable.
    public enum Range: CustomStringConvertible, Hashable, Sendable {
        /// A specific range with start and end values.
        case specific(min: Int, max: Int)

        /// An auto range, which is the default.
        case auto

        /// An infinite range, for counters that work with any value.
        case infinite

        public var description: String {
            switch self {
            case .specific(let min, let max):
                return "\(min) \(max)"
            case .auto:
                return "auto"
            case .infinite:
                return "infinite"
            }
        }

        public var rawValue: String {
            description
        }
    }

    /// Represents the speech synthesis style for a counter style.
    public enum SpeakAs: String, Hashable, Sendable {
        /// Speak as spelled out numbers (e.g., "one, two, three").
        case numbers

        /// Speak as individual words (e.g., "a, b, c").
        case words

        /// Speak as a specific counter style.
        case counters

        /// Speak as spelled out numbers, but in another counter style.
        case countersStyle = "counters style"

        /// Leave unspoken.
        case none

        /// Use auto-detection.
        case auto
    }
}
