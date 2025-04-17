import Foundation
import CSSTypeTypes

/// Represents a CSS @starting-style at-rule.
///
/// The @starting-style at-rule is used to define starting values for properties
/// that you want to transition from when an element receives its first style update
/// or when an element is first displayed on a previously loaded page.
///
/// Examples:
/// ```swift
/// // Standalone block with ruleset
/// StartingStyle.standalone()
///     .rule("[popover]:popover-open", "opacity: 0; transform: scaleX(0);")
///
/// // Nested within an existing ruleset
/// StartingStyle.nested()
///     .declaration("opacity", "0")
///     .declaration("transform", "scaleX(0)")
///
/// // Complex transitions
/// StartingStyle.standalone()
///     .rule("div.showing", """
///         background-color: red;
///         opacity: 0;
///         transform: scale(0.8);
///         """
///     )
/// ```
public struct StartingStyle: AtRule {
    public static let identifier: String = "starting-style"
    
    public var rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
    
    /// Creates a standalone @starting-style block
    /// @starting-style { }
    public static func standalone() -> StartingStyle {
        StartingStyle(rawValue: "@starting-style {}")
    }
    
    /// Creates a nested @starting-style block (for use inside another ruleset)
    /// @starting-style { }
    public static func nested() -> StartingStyle {
        StartingStyle(rawValue: "@starting-style {}")
    }
    
    /// Adds a complete CSS rule (selector and declarations) to the starting style
    /// @starting-style { selector { declarations } }
    public func rule(_ selector: String, _ declarations: String) -> StartingStyle {
        let currentContent = rawValue
        
        // Check if the rule already has content
        if currentContent.hasSuffix("{}") {
            // No rules yet, add the first one
            let newContent = currentContent.dropLast() + selector + " { " + declarations + " }}"
            return StartingStyle(rawValue: String(newContent))
        } else {
            // Already has rules, add another one
            let newContent = currentContent.dropLast() + " " + selector + " { " + declarations + " }}"
            return StartingStyle(rawValue: String(newContent))
        }
    }
    
    /// Adds a single property declaration to the nested starting style
    /// @starting-style { property: value; }
    public func declaration(_ property: String, _ value: String) -> StartingStyle {
        let currentContent = rawValue
        
        // Check if the rule already has declarations
        if currentContent.hasSuffix("{}") {
            // No declarations yet, add the first one
            let newContent = currentContent.dropLast() + property + ": " + value + ";}"
            return StartingStyle(rawValue: String(newContent))
        } else {
            // Already has declarations, add another one
            let newContent = currentContent.dropLast() + " " + property + ": " + value + ";}"
            return StartingStyle(rawValue: String(newContent))
        }
    }
    
    /// Adds multiple property declarations to the nested starting style
    /// @starting-style { declarations }
    public func declarations(_ declarations: String) -> StartingStyle {
        let currentContent = rawValue
        
        // Check if the rule already has declarations
        if currentContent.hasSuffix("{}") {
            // No declarations yet, add them
            let newContent = currentContent.dropLast() + declarations + "}"
            return StartingStyle(rawValue: String(newContent))
        } else {
            // Already has declarations, add more
            let newContent = currentContent.dropLast() + " " + declarations + "}"
            return StartingStyle(rawValue: String(newContent))
        }
    }
    
    /// Adds an opacity declaration to the starting style
    /// @starting-style { opacity: value; }
    public func opacity(_ value: Double) -> StartingStyle {
        declaration("opacity", String(value))
    }
    
    /// Adds a transform declaration to the starting style
    /// @starting-style { transform: value; }
    public func transform(_ value: String) -> StartingStyle {
        declaration("transform", value)
    }
    
    /// Adds a scale transform to the starting style
    /// @starting-style { transform: scale(x, y); }
    public func scale(_ x: Double, _ y: Double) -> StartingStyle {
        transform("scale(\(x), \(y))")
    }
    
    /// Adds a scaleX transform to the starting style
    /// @starting-style { transform: scaleX(value); }
    public func scaleX(_ value: Double) -> StartingStyle {
        transform("scaleX(\(value))")
    }
    
    /// Adds a scaleY transform to the starting style
    /// @starting-style { transform: scaleY(value); }
    public func scaleY(_ value: Double) -> StartingStyle {
        transform("scaleY(\(value))")
    }
    
    /// Adds a background-color declaration to the starting style
    /// @starting-style { background-color: value; }
    public func backgroundColor(_ value: Color) -> StartingStyle {
        declaration("background-color", value.description)
    }
}
