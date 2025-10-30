import Foundation

/// Represents CSS system colors.
///
/// The SystemColor data type represents default color choices used for different parts of a web page,
/// particularly important in forced colors mode (like high contrast mode on Windows).
/// These colors allow integration with user-defined color palettes that may override
/// author-defined colors for accessibility purposes.
///
/// Example:
/// ```swift
/// .color(.system(.canvas))           // Canvas
/// .color(.system(.canvasText))       // CanvasText
/// .color(.system(.buttonBorder))     // ButtonBorder
/// ```
///
/// - SeeAlso: [MDN Web Docs on system colors](https://developer.mozilla.org/en-US/docs/Web/CSS/system-color)
public struct SystemColor: RawRepresentable, Sendable, Hashable {
  public var rawValue: String

  public init(rawValue: String) {
    self.rawValue = rawValue
  }

  /// Background of accented user interface controls.
  public static let accentColor = SystemColor(rawValue: "AccentColor")

  /// Text of accented user interface controls.
  public static let accentColorText = SystemColor(rawValue: "AccentColorText")

  /// Text of active links.
  public static let activeText = SystemColor(rawValue: "ActiveText")

  /// Base border color of controls.
  public static let buttonBorder = SystemColor(rawValue: "ButtonBorder")

  /// Background color of controls.
  public static let buttonFace = SystemColor(rawValue: "ButtonFace")

  /// Text color of controls.
  public static let buttonText = SystemColor(rawValue: "ButtonText")

  /// Background of application content or documents.
  public static let canvas = SystemColor(rawValue: "Canvas")

  /// Text color in application content or documents.
  public static let canvasText = SystemColor(rawValue: "CanvasText")

  /// Background of input fields.
  public static let field = SystemColor(rawValue: "Field")

  /// Text in input fields.
  public static let fieldText = SystemColor(rawValue: "FieldText")

  /// Text color for disabled items (for example, a disabled control).
  public static let grayText = SystemColor(rawValue: "GrayText")

  /// Background of selected items.
  public static let highlight = SystemColor(rawValue: "Highlight")

  /// Text color of selected items.
  public static let highlightText = SystemColor(rawValue: "HighlightText")

  /// Text of non-active, non-visited links.
  public static let linkText = SystemColor(rawValue: "LinkText")

  /// Background of text that has been specially marked (such as by the HTML mark element).
  public static let mark = SystemColor(rawValue: "Mark")

  /// Text that has been specially marked (such as by the HTML mark element).
  public static let markText = SystemColor(rawValue: "MarkText")

  /// Background of selected items, for example, a selected checkbox.
  public static let selectedItem = SystemColor(rawValue: "SelectedItem")

  /// Text of selected items.
  public static let selectedItemText = SystemColor(rawValue: "SelectedItemText")

  /// Text of visited links.
  public static let visitedText = SystemColor(rawValue: "VisitedText")

  // DEPRECATED SYSTEM COLORS
  // These are included for completeness but marked as deprecated
  // and documentation notes map them to their modern equivalents

  /// Active window border. Same as ButtonBorder. (Deprecated)
  @available(*, deprecated, message: "Use buttonBorder instead")
  public static let activeBorder = SystemColor(rawValue: "ActiveBorder")

  /// Active window caption. (Deprecated)
  @available(*, deprecated, message: "Use canvas instead")
  public static let activeCaption = SystemColor(rawValue: "ActiveCaption")

  /// Background color of multiple document interface. (Deprecated)
  @available(*, deprecated, message: "Use canvas instead")
  public static let appWorkspace = SystemColor(rawValue: "AppWorkspace")

  /// Desktop background. (Deprecated)
  @available(*, deprecated, message: "Use canvas instead")
  public static let background = SystemColor(rawValue: "Background")

  /// Border for 3D elements facing light. (Deprecated)
  @available(*, deprecated, message: "Use buttonFace instead")
  public static let buttonHighlight = SystemColor(rawValue: "ButtonHighlight")

  /// Border for 3D elements away from light. (Deprecated)
  @available(*, deprecated, message: "Use buttonFace instead")
  public static let buttonShadow = SystemColor(rawValue: "ButtonShadow")

  /// Text in caption, size box, and scrollbar arrow box. (Deprecated)
  @available(*, deprecated, message: "Use canvasText instead")
  public static let captionText = SystemColor(rawValue: "CaptionText")
}

/// Provides string conversion for CSS output
extension SystemColor: CustomStringConvertible {
  /// Converts the system color to its CSS string representation
  public var description: String {
    return rawValue
  }
}
