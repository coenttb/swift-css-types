import Foundation
import CSSTypeTypes

/// Represents a CSS @scope at-rule.
///
/// The @scope at-rule enables you to select elements in specific DOM subtrees,
/// targeting elements precisely without writing overly-specific selectors that are
/// hard to override, and without coupling selectors too tightly to the DOM structure.
///
/// Examples:
/// ```swift
/// // Basic scope with root
/// Scope.root(".light-theme")
///     .style(":scope", "background: #ccc;")
///     .style("p", "color: black;")
///
/// // Scope with root and limit ("donut scope")
/// Scope.root(".feature").limit("figure")
///     .style("img", "border: 5px solid black; background-color: goldenrod;")
///
/// // Scope with multiple roots
/// Scope.roots([".article-hero", ".article-body"])
///     .style("img", "border: 1px solid red;")
/// ```
public struct Scope: AtRule {
    public static let identifier: String = "scope"
    
    public var rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
    
    /// Creates a new @scope rule with a root selector
    /// @scope (root-selector) {}
    public static func root(_ selector: String) -> Scope {
        Scope(rawValue: "@scope (\(selector)) {}")
    }
    
    /// Creates a new @scope rule with multiple root selectors
    /// @scope (selector1, selector2) {}
    public static func roots(_ selectors: [String]) -> Scope {
        let selectorList = selectors.joined(separator: ", ")
        return Scope(rawValue: "@scope (\(selectorList)) {}")
    }
    
    /// Creates an @scope rule without a scope root (for use in inline <style> elements)
    /// @scope {}
    public static let inline = Scope(rawValue: "@scope {}")
    
    /// Adds a limit selector to the scope
    /// @scope (root-selector) to (limit-selector) {}
    public func limit(_ selector: String) -> Scope {
        let currentContent = rawValue
        if currentContent.hasSuffix("{}") {
            let prefix = String(currentContent.dropLast(2))
            return Scope(rawValue: "\(prefix) to (\(selector)) {}")
        }
        return self
    }
    
    /// Adds a rule to the scope
    /// @scope (root-selector) { selector { declarations } }
    public func style(_ selector: String, _ declarations: String) -> Scope {
        addRule("\(selector) { \(declarations) }")
    }
    
    /// Adds a selector with individual property and value to the scope
    /// @scope (root-selector) { selector { property: value; } }
    public func style(_ selector: String, property: String, value: String) -> Scope {
        addRule("\(selector) { \(property): \(value); }")
    }
    
    /// Add CSS property and value to the scope root
    /// @scope (root-selector) { :scope { property: value; } }
    public func rootStyle(property: String, value: String) -> Scope {
        style(":scope", property: property, value: value)
    }
    
    /// Adds multiple properties to the scope root
    /// @scope (root-selector) { :scope { declarations } }
    public func rootStyle(_ declarations: String) -> Scope {
        style(":scope", declarations)
    }
    
    /// Helper method to add a CSS rule to the scope
    private func addRule(_ rule: String) -> Scope {
        let currentContent = rawValue
        
        // Check if the rule already has content
        if currentContent.hasSuffix("{}") {
            // No rules yet, add the first one
            let newContent = currentContent.dropLast() + rule + "}"
            return Scope(rawValue: String(newContent))
        } else {
            // Already has rules, add another one
            let newContent = currentContent.dropLast() + " " + rule + "}"
            return Scope(rawValue: String(newContent))
        }
    }
}

extension Scope {
    /// Helper for creating an inclusive scope limit
    /// @scope (root-selector) to (limit-selector > *) {}
    public func inclusiveLimit(_ selector: String) -> Scope {
        limit("\(selector) > *")
    }
    
    /// Helper for creating an exclusive scope root
    /// @scope (root-selector > *) {}
    public static func exclusiveRoot(_ selector: String) -> Scope {
        root("\(selector) > *")
    }
    
    /// Helper for creating an exclusive scope root with an exclusive limit
    /// @scope (root-selector > *) to (limit-selector > *) {}
    public static func exclusiveRoot(_ rootSelector: String, exclusiveLimit limitSelector: String) -> Scope {
        exclusiveRoot(rootSelector).inclusiveLimit(limitSelector)
    }
}
