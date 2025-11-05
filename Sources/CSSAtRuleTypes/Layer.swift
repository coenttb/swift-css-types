import Foundation

/// Represents a CSS @layer at-rule.
///
/// The @layer CSS at-rule declares a cascade layer, which can be used to control
/// the order in which CSS rules are applied. Rules within a cascade layer cascade
/// together, and all rules in a layer have lower specificity than rules outside
/// any layer.
///
/// Examples:
/// ```swift
/// // Single layer
/// Layer("navigation")
///
/// // Declaring multiple layers at once
/// Layer.declaring("theme", "layout", "utilities")
///
/// // Nesting layers
/// Layer("theme.dark")
///
/// // Using convenience properties
/// Layer.theme
///
/// // Creating anonymous layers
/// Layer.anonymous
/// ```
public struct Layer: AtRule {
    public static let identifier: String = "layer"

    public var rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }

    /// Creates a layer with the given name.
    public init(_ name: String) {
        self.rawValue = "@layer \(name)"
    }

    /// Creates an anonymous layer.
    public init() {
        self.rawValue = "@layer"
    }

    /// Creates a declaration of multiple layers in a specific order.
    ///
    /// The order of the parameters defines the cascade order of the layers,
    /// where layers listed first have lower precedence than those listed later.
    public static func declaring(_ names: String...) -> Layer {
        Layer(rawValue: "@layer \(names.joined(separator: ", "))")
    }

    /// Represents an anonymous layer.
    public static let anonymous = Layer()

    // Common layer names as static properties (for convenience)
    public static let base = Layer("base")
    public static let layout = Layer("layout")
    public static let components = Layer("components")
    public static let utilities = Layer("utilities")
    public static let theme = Layer("theme")
    public static let reset = Layer("reset")

    /// Creates a nested layer name.
    public static func nested(_ parent: String, _ child: String) -> Layer {
        Layer("\(parent).\(child)")
    }
}

// MARK: - Operator Overloads

extension Layer {
    /// Operator for creating a nested layer.
    ///
    /// Example:
    /// ```swift
    /// let nestedLayer = Layer.theme / "dark" // @layer theme.dark
    /// ```
    public static func / (lhs: Layer, rhs: String) -> Layer {
        return lhs / Layer(rhs)
    }

    /// Operator for combining two layers into a nested layer.
    ///
    /// Example:
    /// ```swift
    /// let nestedLayer = Layer.theme / Layer("dark") // @layer theme.dark
    /// ```
    public static func / (lhs: Layer, rhs: Layer) -> Layer {
        // Extract the layer names from both layers
        let parentName = String(lhs.rawValue.dropFirst(7))
        let childName = String(rhs.rawValue.dropFirst(7))
        return Layer("\(parentName).\(childName)")
    }
}
