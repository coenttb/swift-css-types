import Foundation
import CSSTypeTypes

/// The CSS `font-feature-settings` property controls advanced typographic features in OpenType fonts.
///
/// This property allows fine-grained control over OpenType font features, which are particularly
/// important for proper rendering of complex scripts and for typographical refinements in various
/// languages and writing systems.
///
/// - Note: Whenever possible, web authors should instead use the `font-variant` shorthand property
///         or an associated longhand property such as `font-variant-ligatures`, `font-variant-caps`,
///         `font-variant-east-asian`, `font-variant-alternates`, `font-variant-numeric`, or
///         `font-variant-position`.
///
/// Example:
/// ```swift
/// .fontFeatureSettings(.normal)                      // font-feature-settings: normal
/// .fontFeatureSettings(["liga": 0])                  // font-feature-settings: "liga" 0
/// .fontFeatureSettings(["smcp": nil])                // font-feature-settings: "smcp"
/// .fontFeatureSettings(["smcp": nil, "zero": nil])   // font-feature-settings: "smcp", "zero"
/// .fontFeatureSettings(["swsh": 2])                  // font-feature-settings: "swsh" 2
/// ```
///
/// - SeeAlso: [MDN Web Docs on font-feature-settings](https://developer.mozilla.org/en-US/docs/Web/CSS/font-feature-settings)
public enum FontFeatureSettings: Property {
    public static let property: String = "font-feature-settings"
    
    /// Indicates that text is laid out using default font settings.
    case normal
    
    /// A collection of OpenType feature tags and their values.
    case features([String: FeatureValue?])
    
    /// Global values
    case global(CSSTypeTypes.Global)
    
    /// Initialize with a single feature tag and value
    public init(_ featureTag: String, _ value: FeatureValue?) {
        self = .features([featureTag: value])
    }
    
    /// Initialize with a dictionary of feature tags and their values
    public init(_ features: [String: FeatureValue?]) {
        if features.isEmpty {
            self = .normal
        } else {
            self = .features(features)
        }
    }
    
    /// Initialize with a dictionary of feature tags and integer values
    public init(_ features: [String: Int]) {
        let convertedFeatures = features.mapValues { value -> FeatureValue? in
            return .integer(value)
        }
        self.init(convertedFeatures)
    }
    
//    /// Initialize with an array of feature tags (all with default value 1)
//    public init(_ featureTags: [String]) {
//        let features = Dictionary(uniqueKeysWithValues: featureTags.map { ($0, nil) })
//        self.init(features)
//    }
}

/// Represents the possible values for OpenType feature settings
public enum FeatureValue: Sendable, Hashable, CustomStringConvertible {
    /// Positive integer value
    case integer(Int)
    
    /// Enable the feature (equivalent to value 1)
    case on
    
    /// Disable the feature (equivalent to value 0)
    case off
    
    public var description: String {
        switch self {
        case .integer(let value):
            return "\(value)"
        case .on:
            return "on"
        case .off:
            return "off"
        }
    }
}
extension FeatureValue: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int) {
        self = .integer(value)
    }
}

/// CSS Output conversion
extension FontFeatureSettings: CustomStringConvertible {
    /// Converts the font-feature-settings value to its CSS string representation
    public var description: String {
        switch self {
        case .normal:
            return "normal"
            
        case .features(let features):
            let featureStrings = features.map { (tag, value) -> String in
                let valueStr = value.map { " \($0)" } ?? ""
                return "\"\(tag)\"\(valueStr)"
            }
            return featureStrings.joined(separator: ", ")
            
        case .global(let global):
            return global.description
        }
    }
}

// Convenience initializers for common OpenType features
extension FontFeatureSettings {
    /// Enable small caps
    public static func smallCaps() -> Self {
        .features(["smcp": nil])
    }
    
    /// Convert both upper and lowercase to small caps
    public static func allSmallCaps() -> Self {
        .features(["c2sc": nil, "smcp": nil])
    }
    
    /// Enable slashed zero
    public static func slashedZero() -> Self {
        .features(["zero": nil])
    }
    
    /// Enable historical forms
    public static func historical() -> Self {
        .features(["hist": nil])
    }
    
    /// Disable standard ligatures
    public static func disableLigatures() -> Self {
        .features(["liga": .off])
    }
    
    /// Enable tabular (monospaced) figures
    public static func tabularFigures() -> Self {
        .features(["tnum": nil])
    }
    
    /// Enable automatic fractions
    public static func fractions() -> Self {
        .features(["frac": nil])
    }
    
    /// Enable a specific stylistic set (1-20)
    public static func stylisticSet(_ number: Int) -> Self {
        guard number >= 1 && number <= 20 else {
            return .normal
        }
        let setName = String(format: "ss%02d", number)
        return .features([setName: nil])
    }
}
