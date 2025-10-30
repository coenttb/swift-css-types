import CSSTypeTypes
import Foundation

/// Represents the CSS `border-bottom` shorthand property, which sets all the bottom border properties at once.
///
/// The border-bottom property is a shorthand that sets the width, style, and color for the bottom border
/// of an element. It combines the following properties:
/// - border-bottom-width: Sets the width of the bottom border
/// - border-bottom-style: Sets the style of the bottom border (required for the border to be visible)
/// - border-bottom-color: Sets the color of the bottom border
///
/// Visual Reference:
/// ```
/// ┌───────────────────────────┐
/// │                           │
/// │                           │
/// │                           │
/// │                           │
/// └───────────────────────────┘   ← border-bottom
///
/// Different styles:
/// ┌───────────────────────────┐   ┌───────────────────────────┐
/// │                           │   │                           │
/// │                           │   │                           │
/// │                           │   │                           │
/// │                           │   │                           │
/// └───────────────────────────┘   └- - - - - - - - - - - - - -┘
///  solid                           dashed
///
/// ┌───────────────────────────┐   ┌───────────────────────────┐
/// │                           │   │                           │
/// │                           │   │                           │
/// │                           │   │                           │
/// │                           │   │                           │
/// └∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙┘   └═══════════════════════════┘
///  dotted                          double
/// ```
///
/// Example:
/// ```swift
/// // Set only border style (width and color use defaults)
/// .borderBottom(.solid)
///
/// // Set border style and color
/// .borderBottom(.dashed, .red)
///
/// // Set border width and style
/// .borderBottom(.px(2), .dotted)
///
/// // Set all three properties
/// .borderBottom(.px(3), .double, .blue)
///
/// // Create a thick ridge border with partial transparency
/// .borderBottom(.thick, .ridge, .rgba(50, 161, 206, 0.8))
///
/// // Use a global value
/// .borderBottom(.global(.inherit))
/// ```
///
/// - Note: If the border style is not specified, the border will be invisible since the default style is `none`.
///
/// - SeeAlso: [MDN Web Docs on border-bottom](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom)
public enum BorderBottom: Property {
  public static let property: String = "border-bottom"
  /// Border bottom properties
  case properties(Properties)

  /// Global CSS values
  case global(CSSTypeTypes.Global)

  /// Creates a border-bottom with just a style
  public init(_ style: LineStyle) {
    self = .properties(Properties(style: style))
  }

  /// Creates a border-bottom with width and style
  public init(_ width: BorderWidth, _ style: LineStyle) {
    self = .properties(Properties(width: width, style: style))
  }

  /// Creates a border-bottom with style and color
  public init(_ style: LineStyle, _ color: Color) {
    self = .properties(Properties(style: style, color: color))
  }

  /// Creates a border-bottom with width, style, and color
  public init(_ width: BorderWidth, _ style: LineStyle, _ color: Color) {
    self = .properties(Properties(width: width, style: style, color: color))
  }

  /// Creates a border-bottom with the specified properties
  public init(width: BorderWidth? = nil, style: LineStyle? = nil, color: Color? = nil) {
    self = .properties(Properties(width: width, style: style, color: color))
  }
}

extension BorderBottom: LineStyleConvertible {
  /// Create a border-bottom with the given line style
  public static func lineStyle(_ lineStyle: CSSTypeTypes.LineStyle) -> BorderBottom {
    return .properties(Properties(style: lineStyle))
  }
}

extension BorderBottom {
  /// Properties for the border-bottom shorthand
  public struct Properties: Sendable, Hashable, CustomStringConvertible {
    /// The width of the bottom border
    public let width: BorderWidth?

    /// The style of the bottom border (required for the border to be visible)
    public let style: LineStyle?

    /// The color of the bottom border
    public let color: Color?

    /// Creates border-bottom properties with the specified values
    public init(width: BorderWidth? = nil, style: LineStyle? = nil, color: Color? = nil) {
      self.width = width
      self.style = style
      self.color = color
    }

    /// CSS string representation of the border-bottom properties
    public var description: String {
      var parts: [String] = []

      if let width = width {
        parts.append(width.description)
      }

      if let style = style {
        parts.append(style.description)
      }

      if let color = color {
        parts.append(color.description)
      }

      return parts.joined(separator: " ")
    }
  }
}

/// Provides string conversion for CSS output
extension BorderBottom: CustomStringConvertible {
  /// Converts the border-bottom to its CSS string representation
  ///
  /// This method generates CSS like:
  /// ```css
  /// border-bottom: solid;
  /// border-bottom: dashed red;
  /// border-bottom: 2px dotted;
  /// border-bottom: 3px double blue;
  /// border-bottom: thick ridge rgba(50, 161, 206, 0.8);
  /// border-bottom: inherit;
  /// ```
  public var description: String {
    switch self {
    case .properties(let properties):
      return properties.description
    case .global(let global):
      return global.description
    }
  }
}

/// Convenience factories for creating BorderBottom values
extension BorderBottom {
  /// Creates a none border-bottom (invisible)
  public static let none = BorderBottom(.none)

  /// Creates a hidden border-bottom (invisible, high priority in border collapsing)
  public static let hidden = BorderBottom(.hidden)

  /// Creates a solid border-bottom with default width and color
  public static let solid = BorderBottom(.solid)

  /// Creates a dotted border-bottom with default width and color
  public static let dotted = BorderBottom(.dotted)

  /// Creates a dashed border-bottom with default width and color
  public static let dashed = BorderBottom(.dashed)

  /// Creates a double border-bottom with default width and color
  public static let double = BorderBottom(.double)

  /// Creates a groove border-bottom with default width and color
  public static let groove = BorderBottom(.groove)

  /// Creates a ridge border-bottom with default width and color
  public static let ridge = BorderBottom(.ridge)

  /// Creates a inset border-bottom with default width and color
  public static let inset = BorderBottom(.inset)

  /// Creates a outset border-bottom with default width and color
  public static let outset = BorderBottom(.outset)

  /// Creates a thin border-bottom with the specified style
  ///
  /// - Parameter style: The border style
  /// - Returns: A thin border-bottom with the specified style
  public static func thin(_ style: LineStyle) -> BorderBottom {
    .properties(Properties(width: .thin, style: style))
  }

  /// Creates a medium border-bottom with the specified style
  ///
  /// - Parameter style: The border style
  /// - Returns: A medium border-bottom with the specified style
  public static func medium(_ style: LineStyle) -> BorderBottom {
    .properties(Properties(width: .medium, style: style))
  }

  /// Creates a thick border-bottom with the specified style
  ///
  /// - Parameter style: The border style
  /// - Returns: A thick border-bottom with the specified style
  public static func thick(_ style: LineStyle) -> BorderBottom {
    .properties(Properties(width: .thick, style: style))
  }
}
