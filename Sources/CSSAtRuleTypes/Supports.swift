import CSSTypeTypes
import Foundation

/// Represents a CSS @supports at-rule.
///
/// The @supports at-rule lets you specify CSS declarations that depend on a browser's
/// support for CSS features. Using this at-rule is commonly called a feature query.
///
/// Examples:
/// ```swift
/// // Simple property check
/// Supports.property("display", "flex")
///     .style("selector", "property: value;")
///
/// // Combined checks with 'and'
/// Supports.property("display", "grid")
///     .and(Supports.property("color", "var(--accent)"))
///     .style(".grid-layout", "display: grid; gap: 1rem;")
///
/// // Check with 'or' for prefixed properties
/// Supports.property("transform-style", "preserve-3d")
///     .or(Supports.property("-webkit-transform-style", "preserve-3d"))
///     .style(".card", "transform-style: preserve-3d;")
///
/// // Negating a check with 'not'
/// Supports.not(Supports.selector("a:has(> img)"))
///     .style(".fallback", "display: block;")
/// ```
public struct Supports: AtRule {
    public static let identifier: String = "supports"

    public var rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }

    /// Creates a CSS property support check
    /// @supports (property: value) {}
    public static func property(_ property: String, _ value: String) -> Supports {
        Supports(rawValue: "@supports (\(property): \(value)) {}")
    }

    /// Creates a CSS selector support check
    /// @supports selector(selectorSyntax) {}
    public static func selector(_ selector: String) -> Supports {
        Supports(rawValue: "@supports selector(\(selector)) {}")
    }

    /// Creates a CSS font technology support check
    /// @supports font-tech(technology) {}
    public static func fontTech(_ technology: FontTechnology) -> Supports {
        Supports(rawValue: "@supports font-tech(\(technology.rawValue)) {}")
    }

    /// Creates a CSS font format support check
    /// @supports font-format(format) {}
    public static func fontFormat(_ format: FontFormat) -> Supports {
        Supports(rawValue: "@supports font-format(\(format.rawValue)) {}")
    }

    /// Creates a negated CSS support check
    /// @supports not (condition) {}
    public static func not(_ condition: Supports) -> Supports {
        // Extract the condition from the rawValue string
        let start = condition.rawValue.index(condition.rawValue.startIndex, offsetBy: 10) // Skip "@supports "
        let end = condition.rawValue.index(condition.rawValue.endIndex, offsetBy: -4) // Skip " {}"
        let conditionString = condition.rawValue[start..<end]

        return Supports(rawValue: "@supports not \(conditionString) {}")
    }

    /// Combines this support check with another using the 'and' operator
    /// @supports (condition1) and (condition2) {}
    public func and(_ other: Supports) -> Supports {
        let thisCondition = extractCondition(from: self)
        let otherCondition = extractCondition(from: other)

        return Supports(rawValue: "@supports \(thisCondition) and \(otherCondition) {}")
    }

    /// Combines this support check with another using the 'or' operator
    /// @supports (condition1) or (condition2) {}
    public func or(_ other: Supports) -> Supports {
        let thisCondition = extractCondition(from: self)
        let otherCondition = extractCondition(from: other)

        return Supports(rawValue: "@supports \(thisCondition) or \(otherCondition) {}")
    }

    /// Extracts the condition portion from a Supports rule
    private func extractCondition(from support: Supports) -> String {
        // Skip "@supports " (10 characters) and remove the trailing " {}"
        let start = support.rawValue.index(support.rawValue.startIndex, offsetBy: 10)
        let end = support.rawValue.index(support.rawValue.endIndex, offsetBy: -4)
        return String(support.rawValue[start..<end])
    }

    /// Adds a CSS rule (selector and declarations) to the supports block
    /// @supports (condition) { selector { declarations } }
    public func style(_ selector: String, _ declarations: String) -> Supports {
        let currentContent = rawValue

        // Check if the rule already has content
        if currentContent.hasSuffix("{}") {
            // No rules yet, add the first one
            let newContent = currentContent.dropLast() + selector + " { " + declarations + " }}"
            return Supports(rawValue: String(newContent))
        } else {
            // Already has rules, add another one
            let newContent = currentContent.dropLast() + " " + selector + " { " + declarations + " }}"
            return Supports(rawValue: String(newContent))
        }
    }

//    /// Add a nested at-rule to the supports block
//    /// @supports (condition) { @nested { ... } }
//    public func nested(_ atRule: any AtRule) -> Supports {
//        let currentContent = rawValue
//        let nestedContent = atRule.rawValue
//        
//        // Check if the rule already has content
//        if currentContent.hasSuffix("{}") {
//            // No rules yet, add the first one
//            let newContent = currentContent.dropLast() + nestedContent + "}"
//            return Supports(rawValue: String(newContent))
//        } else {
//            // Already has rules, add another one
//            let newContent = currentContent.dropLast() + " " + nestedContent + "}"
//            return Supports(rawValue: String(newContent))
//        }
//    }
}

extension Supports {
    /// Represents font technologies for use with font-tech()
    public enum FontTechnology: String, Hashable, Sendable {
        // Color font technologies
        case colorCOLRv0 = "color-COLRv0"
        case colorCOLRv1 = "color-COLRv1"
        case colorSVG = "color-svg"
        case colorSBIX = "color-sbix"
        case colorCBDT = "color-cbdt"

        // Font feature technologies
        case featuresOpenType = "features-opentype"
        case featuresAAT = "features-aat"
        case featuresGraphite = "features-graphite"

        // Incremental font loading
        case incrementalPatch = "incremental-patch"
        case incrementalRange = "incremental-range"
        case incrementalAuto = "incremental-auto"

        // Other font technologies
        case variations = "variations"
        case palettes = "palettes"
    }

    /// Represents font formats for use with font-format()
    public enum FontFormat: String, Hashable, Sendable {
        case collection = "collection"
        case embeddedOpenType = "embedded-opentype"
        case opentype = "opentype"
        case svg = "svg"
        case truetype = "truetype"
        case woff = "woff"
        case woff2 = "woff2"
    }
}
