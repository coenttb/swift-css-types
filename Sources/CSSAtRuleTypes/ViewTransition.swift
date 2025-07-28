import CSSTypeTypes
import Foundation

/// Represents a CSS @view-transition at-rule.
///
/// The @view-transition at-rule is used to opt in the current and destination 
/// documents to undergo a view transition, in the case of a cross-document navigation.
///
/// Examples:
/// ```swift
/// // Basic view transition with auto navigation
/// ViewTransition.auto
///
/// // View transition with no navigation
/// ViewTransition.none
///
/// // Custom view transition with auto navigation
/// ViewTransition()
///     .navigation(.auto)
/// ```
public struct ViewTransition: AtRule {
    public static let identifier: String = "view-transition"

    public var rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }

    /// Creates a new @view-transition rule
    /// @view-transition {}
    public init() {
        self.rawValue = "@view-transition {}"
    }

    /// Sets the navigation property in the view transition rule
    /// @view-transition { navigation: value; }
    public func navigation(_ value: NavigationType) -> ViewTransition {
        let currentContent = rawValue

        // Check if the rule already has a navigation property
        if currentContent.contains("navigation:") {
            // Replace the existing navigation property
            let pattern = "navigation: [a-z]+;"
            let replacement = "navigation: \(value.rawValue);"
            if let regex = try? NSRegularExpression(pattern: pattern) {
                let range = NSRange(currentContent.startIndex..<currentContent.endIndex, in: currentContent)
                let newContent = regex.stringByReplacingMatches(in: currentContent, range: range, withTemplate: replacement)
                return ViewTransition(rawValue: newContent)
            }
        }

        // No navigation property yet, add it
        if currentContent.hasSuffix("{}") {
            // Empty rule
            let newContent = currentContent.dropLast() + "navigation: \(value.rawValue);}"
            return ViewTransition(rawValue: String(newContent))
        } else {
            // Rule has other properties
            let newContent = currentContent.dropLast() + " navigation: \(value.rawValue);}"
            return ViewTransition(rawValue: String(newContent))
        }
    }
}

extension ViewTransition {
    /// Navigation types for view transitions
    public enum NavigationType: String, Hashable, Sendable {
        /// The document will undergo a view transition when taking part in a navigation,
        /// provided the navigation is same-origin, without cross-origin redirects.
        case auto

        /// The document will not undergo a view transition.
        case none
    }

    /// Predefined view transition with auto navigation
    /// @view-transition { navigation: auto; }
    public static let auto = ViewTransition().navigation(.auto)

    /// Predefined view transition with no navigation
    /// @view-transition { navigation: none; }
    public static let none = ViewTransition().navigation(.none)
}
