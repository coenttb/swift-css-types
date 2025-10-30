import CSSTypeTypes
import Foundation

/// The CSS animation-name property specifies the names of one or more @keyframes at-rules
/// describing the animation or animations to apply to the element.
///
/// Example:
/// ```swift
/// .animationName(.none)                // animation-name: none
/// .animationName("slide-in")           // animation-name: slide-in
/// .animationName(.keyframes("bounce")) // animation-name: bounce
/// ```
///
/// - SeeAlso: [MDN Web Docs on animation-name](https://developer.mozilla.org/en-US/docs/Web/CSS/animation-name)
public enum AnimationName: Property {

  public static let property: String = "animation-name"

  /// No animation should be applied (default)
  case none

  /// A custom keyframe name
  case keyframes(KeyFramesName)

  /// Global value
  case global(CSSTypeTypes.Global)

  public enum KeyFramesName: Sendable, Hashable, CustomStringConvertible {
    case customIdent(Ident)
    case string(CSSString)

    public init(_ string: String) {
      self = .customIdent(.init(string))
    }

    public var description: String {
      switch self {
      case .customIdent(let ident):
        ident.description
      case .string(let cSSString):
        cSSString.description
      }
    }
  }
}

/// CSS Output conversion
extension AnimationName: CustomStringConvertible {
  /// Converts the animation name to its CSS string representation
  public var description: String {
    switch self {
    case .none:
      return "none"
    case .keyframes(let name):
      return name.description
    case .global(let global):
      return global.description
    }
  }
}

// String literal conversion
extension AnimationName: ExpressibleByStringLiteral {
  /// Creates an animation name from a string literal
  /// If the string starts and ends with quotes, it will be treated as a string value
  /// Otherwise, it will be treated as a custom identifier
  public init(stringLiteral value: String) {
    if value.lowercased() == "none" {
      self = .none
    } else if value.starts(with: "\"") && value.hasSuffix("\"") {
      // Remove the quotes and treat as a string with double quotes
      let trimmed = String(value.dropFirst().dropLast())
      self = .keyframes(.string(.init(trimmed, quotes: .double)))
    } else if value.starts(with: "'") && value.hasSuffix("'") {
      // Remove the quotes and treat as a string with single quotes
      let trimmed = String(value.dropFirst().dropLast())
      self = .keyframes(.string(.init(trimmed, quotes: .single)))
    } else {
      // Treat as a custom identifier
      self = .keyframes(.customIdent(.init(value)))
    }
  }
}
