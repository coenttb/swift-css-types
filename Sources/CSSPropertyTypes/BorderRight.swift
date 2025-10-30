import CSSTypeTypes
import Foundation

/// Represents the CSS `border-right` shorthand property, which sets all the right border properties at once.
///
/// The border-right property is a shorthand that sets the width, style, and color for the right border
/// of an element. It combines the following properties:
/// - border-right-width: Sets the width of the right border
/// - border-right-style: Sets the style of the right border (required for the border to be visible)
/// - border-right-color: Sets the color of the right border
///
/// Visual Reference:
/// ```
/// ┌───────────────────────┬─────┐
/// │                       │     │
/// │                       │     │
/// │                       │     │
/// │                       │     │
/// │                       │     │
/// └───────────────────────┴─────┘
///                           ↑
///                           border-right
///
/// Different styles:
/// ┌───────────────────────┬─────┐        ┌───────────────────────┬╍╍╍╍╍┐
/// │                       │     │        │                       ┆     ┆
/// │                       │     │        │                       ┆     ┆
/// │                       │     │        │                       ┆     ┆
/// │                       │     │        │                       ┆     ┆
/// │                       │     │        │                       ┆     ┆
/// └───────────────────────┴─────┘        └───────────────────────┴╍╍╍╍╍┘
///                           solid                                  dashed
///
/// ┌───────────────────────┬·····┐        ┌───────────────────────┬═════┐
/// │                       ┆     ┆        │                       ┃     ┃
/// │                       ┆     ┆        │                       ┃     ┃
/// │                       ┆     ┆        │                       ┃     ┃
/// │                       ┆     ┆        │                       ┃     ┃
/// │                       ┆     ┆        │                       ┃     ┃
/// └───────────────────────┴·····┘        └───────────────────────┴═════┘
///                           dotted                                 double
/// ```
///
/// Example:
/// ```swift
/// // Set only border style (width and color use defaults)
/// .borderRight(.solid)
///
/// // Set border style and color
/// .borderRight(.dashed, .red)
///
/// // Set border width and style
/// .borderRight(.px(2), .dotted)
///
/// // Set all three properties
/// .borderRight(.px(3), .double, .blue)
///
/// // Create a thick ridge border with partial transparency
/// .borderRight(.thick, .ridge, .rgba(50, 161, 206, 0.8))
/// ```
///
/// - Note: If the border style is not specified, the border will be invisible since the default style is `none`.
///
/// - SeeAlso: [MDN Web Docs on border-right](https://developer.mozilla.org/en-US/docs/Web/CSS/border-right)
public enum BorderRight: Property {

  public static let property: String = "border-right"

  /// Border right properties
  case properties(Properties)

  /// Global values like inherit, initial, etc.
  case global(CSSTypeTypes.Global)

  /// Creates a border-right with just a style
  public init(_ style: LineStyle) {
    self = .properties(Properties(style: style))
  }

  /// Creates a border-right with width and style
  public init(_ width: BorderWidth, _ style: LineStyle) {
    self = .properties(Properties(width: width, style: style))
  }

  /// Creates a border-right with style and color
  public init(_ style: LineStyle, _ color: Color) {
    self = .properties(Properties(style: style, color: color))
  }

  /// Creates a border-right with width, style, and color
  public init(_ width: BorderWidth, _ style: LineStyle, _ color: Color) {
    self = .properties(Properties(width: width, style: style, color: color))
  }

  /// Creates a border-right with the specified properties
  public init(width: BorderWidth? = nil, style: LineStyle? = nil, color: Color? = nil) {
    self = .properties(Properties(width: width, style: style, color: color))
  }
}

extension BorderRight {
  /// Properties for the border-right shorthand
  public struct Properties: Sendable, Hashable, CustomStringConvertible {
    /// The width of the right border
    public let width: BorderWidth?

    /// The style of the right border (required for the border to be visible)
    public let style: LineStyle?

    /// The color of the right border
    public let color: Color?

    /// Creates border-right properties with the specified values
    public init(width: BorderWidth? = nil, style: LineStyle? = nil, color: Color? = nil) {
      self.width = width
      self.style = style
      self.color = color
    }

    /// CSS string representation of the border-right properties
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
extension BorderRight: CustomStringConvertible {
  /// Converts the border-right to its CSS string representation
  ///
  /// This method generates CSS like:
  /// ```css
  /// border-right: solid;
  /// border-right: dashed red;
  /// border-right: 2px dotted;
  /// border-right: 3px double blue;
  /// border-right: thick ridge rgba(50, 161, 206, 0.8);
  /// border-right: inherit;
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

/// Convenience factories for creating BorderRight values
extension BorderRight {
  /// Creates a none border-right (invisible)
  public static let none = BorderRight(.none)

  /// Creates a hidden border-right (invisible, high priority in border collapsing)
  public static let hidden = BorderRight(.hidden)

  /// Creates a solid border-right with default width and color
  public static let solid = BorderRight(.solid)

  /// Creates a dotted border-right with default width and color
  public static let dotted = BorderRight(.dotted)

  /// Creates a dashed border-right with default width and color
  public static let dashed = BorderRight(.dashed)

  /// Creates a double border-right with default width and color
  public static let double = BorderRight(.double)

  /// Creates a groove border-right with default width and color
  public static let groove = BorderRight(.groove)

  /// Creates a ridge border-right with default width and color
  public static let ridge = BorderRight(.ridge)

  /// Creates a inset border-right with default width and color
  public static let inset = BorderRight(.inset)

  /// Creates a outset border-right with default width and color
  public static let outset = BorderRight(.outset)

  /// Creates a thin border-right with the specified style
  ///
  /// - Parameter style: The border style
  /// - Returns: A thin border-right with the specified style
  public static func thin(_ style: LineStyle) -> BorderRight {
    .properties(Properties(width: .thin, style: style))
  }

  /// Creates a medium border-right with the specified style
  ///
  /// - Parameter style: The border style
  /// - Returns: A medium border-right with the specified style
  public static func medium(_ style: LineStyle) -> BorderRight {
    .properties(Properties(width: .medium, style: style))
  }

  /// Creates a thick border-right with the specified style
  ///
  /// - Parameter style: The border style
  /// - Returns: A thick border-right with the specified style
  public static func thick(_ style: LineStyle) -> BorderRight {
    .properties(Properties(width: .thick, style: style))
  }
}
