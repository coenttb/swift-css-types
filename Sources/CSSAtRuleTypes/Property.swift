import CSSTypeTypes
import Foundation

/// Represents a CSS @property at-rule.
///
/// The @property at-rule is part of the CSS Houdini APIs and allows developers
/// to explicitly define CSS custom properties with type checking, constraints,
/// default values, and inheritance behavior.
///
/// Examples:
/// ```swift
/// // Basic property definition
/// Property.define("--theme-color")
///     .syntax(.color)
///     .inherits(false)
///     .initialValue("blue")
///
/// // Numeric property with percentage
/// Property.define("--spacing")
///     .syntax(.percentage)
///     .inherits(true)
///     .initialValue("2%")
///
/// // Property with length values
/// Property.define("--border-size")
///     .syntax(.length)
///     .inherits(false)
///     .initialValue("1px")
/// ```
public struct Property: AtRule {
  public static let identifier: String = "property"
  public var rawValue: String

  public init(rawValue: String) {
    self.rawValue = rawValue
  }

  /// Creates a new @property rule with the specified custom property name
  /// @property --name {}
  public static func define(_ name: String) -> Property {
    Property(rawValue: "@property \(name) {}")
  }

  /// Sets the syntax descriptor for the property
  /// @property --name { syntax: "<type>"; }
  public func syntax(_ value: SyntaxType) -> Property {
    addDescriptor("syntax: \"\(value.rawValue)\"")
  }

  /// Sets the syntax descriptor using a custom syntax string
  /// @property --name { syntax: "<custom-syntax>"; }
  public func syntax(_ customSyntax: String) -> Property {
    addDescriptor("syntax: \"\(customSyntax)\"")
  }

  /// Sets the inherits descriptor for the property
  /// @property --name { inherits: true|false; }
  public func inherits(_ value: Bool) -> Property {
    addDescriptor("inherits: \(value)")
  }

  /// Sets the initial-value descriptor for the property
  /// @property --name { initial-value: <value>; }
  public func initialValue(_ value: String) -> Property {
    addDescriptor("initial-value: \(value)")
  }

  /// Sets the initial-value descriptor for the property using a color value
  /// @property --name { initial-value: <color>; }
  public func initialValue(_ value: Color) -> Property {
    addDescriptor("initial-value: \(value)")
  }

  /// Sets the initial-value descriptor for the property using a length value
  /// @property --name { initial-value: <length>; }
  public func initialValue(_ value: Length) -> Property {
    addDescriptor("initial-value: \(value)")
  }

  /// Sets the initial-value descriptor for the property using a length percentage value
  /// @property --name { initial-value: <length-percentage>; }
  public func initialValue(_ value: LengthPercentage) -> Property {
    addDescriptor("initial-value: \(value)")
  }

  /// Helper method to add a descriptor to the property rule
  private func addDescriptor(_ descriptor: String) -> Property {
    let currentContent = rawValue

    // Check if the rule already has descriptors
    if currentContent.hasSuffix("{}") {
      // No descriptors yet, add the first one
      let newContent = currentContent.dropLast() + descriptor + ";}"
      return Property(rawValue: String(newContent))
    } else {
      // Already has descriptors, add another one
      let newContent = currentContent.dropLast() + " " + descriptor + ";}"
      return Property(rawValue: String(newContent))
    }
  }
}

extension Property {
  /// Built-in syntax types for CSS custom properties
  public enum SyntaxType: String, Hashable, Sendable {
    // Basic types
    /// Any valid CSS value
    case universal = "*"

    /// A CSS <color> value
    case color = "<color>"

    /// A CSS <length> value
    case length = "<length>"

    /// A CSS <percentage> value
    case percentage = "<percentage>"

    /// A CSS <length-percentage> value (length or percentage)
    case lengthPercentage = "<length-percentage>"

    /// A CSS <number> value
    case number = "<number>"

    /// A CSS <integer> value
    case integer = "<integer>"

    /// A CSS <angle> value
    case angle = "<angle>"

    /// A CSS <time> value
    case time = "<time>"

    /// A CSS <resolution> value
    case resolution = "<resolution>"

    /// A CSS <transform-function> value
    case transformFunction = "<transform-function>"

    /// A CSS <custom-ident> value
    case customIdent = "<custom-ident>"

    // Image types
    /// A CSS <image> value
    case image = "<image>"

    /// A CSS <url> value
    case url = "<url>"

    // Functions
    /// A CSS <gradient> value
    case gradient = "<gradient>"

    // Composite types with multipliers
    /// One or more of the specified type (e.g., "<length>+")
    public static func oneOrMore(_ type: SyntaxType) -> String {
      "\(type.rawValue)+"
    }

    /// Zero or more of the specified type (e.g., "<length>*")
    public static func zeroOrMore(_ type: SyntaxType) -> String {
      "\(type.rawValue)*"
    }

    /// A list of the specified type (e.g., "<length>#")
    public static func list(_ type: SyntaxType) -> String {
      "\(type.rawValue)#"
    }

    // Composite types with combinators
    /// Either of the specified types (e.g., "<length> | <percentage>")
    public static func either(_ type1: SyntaxType, _ type2: SyntaxType) -> String {
      "\(type1.rawValue) | \(type2.rawValue)"
    }

    /// Any number of the specified types (e.g., "[ <length> | <percentage> ]+")
    public static func any(_ types: SyntaxType...) -> String {
      let typeList = types.map { $0.rawValue }.joined(separator: " | ")
      return "[ \(typeList) ]+"
    }
  }
}
