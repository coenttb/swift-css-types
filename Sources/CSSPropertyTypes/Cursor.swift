import CSSTypeTypes
import Foundation

/// The `cursor` CSS property sets the type of cursor to be displayed when pointing over an element.
///
/// This property allows you to specify the mouse cursor appearance to indicate various operations that
/// can be performed - such as pointing to links, selecting text, showing that something is loading,
/// indicating resize handles, and more.
///
/// - SeeAlso: [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/CSS/cursor)
public indirect enum Cursor: Property {
  public static let property: String = "cursor"

  /// General cursor types

  /// The browser determines the cursor to display based on context
  case auto

  /// The platform's default cursor (usually an arrow)
  case `default`

  /// No cursor is shown
  case none

  /// Links and status cursors

  /// A context menu is available (usually an arrow with a small menu)
  case contextMenu

  /// Help is available (usually an arrow with a question mark)
  case help

  /// Indicates a link (usually a pointing hand)
  case pointer

  /// The program is busy in background but user can still interact (usually an arrow with hourglass)
  case progress

  /// The program is busy and user cannot interact (usually an hourglass)
  case wait

  /// Selection cursors

  /// Indicates table cell or set of cells can be selected
  case cell

  /// A crosshair cursor, often used for selection in graphics
  case crosshair

  /// Indicates text can be selected (usually an I-beam)
  case text

  /// Indicates vertical text can be selected (usually a horizontal I-beam)
  case verticalText

  /// Drag and drop cursors

  /// Indicates an alias or shortcut is to be created
  case alias

  /// Indicates something is to be copied
  case copy

  /// Indicates something is to be moved
  case move

  /// Indicates item may not be dropped at the current location
  case noDrop

  /// Indicates the requested action will not be carried out
  case notAllowed

  /// Indicates something can be grabbed
  case grab

  /// Indicates something is being grabbed
  case grabbing

  /// Resizing and scrolling cursors

  /// Indicates something can be scrolled in any direction
  case allScroll

  /// Indicates a column can be resized horizontally
  case colResize

  /// Indicates a row can be resized vertically
  case rowResize

  /// Directional resize cursors
  case nResize
  case eResize
  case sResize
  case wResize
  case neResize
  case nwResize
  case seResize
  case swResize

  /// Bidirectional resize cursors
  case ewResize
  case nsResize
  case neswResize
  case nwseResize

  /// Zoom cursors

  /// Indicates something can be zoomed in
  case zoomIn

  /// Indicates something can be zoomed out
  case zoomOut

  /// A URL pointing to a custom cursor image with fallback cursor type
  case url(url: Url, fallback: Cursor = .auto)

  /// A URL with cursor hotspot coordinates and fallback cursor type
  case urlWithCoordinates(url: Url, x: Int, y: Int, fallback: Cursor = .auto)

  /// Global values
  case global(CSSTypeTypes.Global)

  public var description: String {
    switch self {
    case .auto:
      return "auto"
    case .default:
      return "default"
    case .none:
      return "none"
    case .contextMenu:
      return "context-menu"
    case .help:
      return "help"
    case .pointer:
      return "pointer"
    case .progress:
      return "progress"
    case .wait:
      return "wait"
    case .cell:
      return "cell"
    case .crosshair:
      return "crosshair"
    case .text:
      return "text"
    case .verticalText:
      return "vertical-text"
    case .alias:
      return "alias"
    case .copy:
      return "copy"
    case .move:
      return "move"
    case .noDrop:
      return "no-drop"
    case .notAllowed:
      return "not-allowed"
    case .grab:
      return "grab"
    case .grabbing:
      return "grabbing"
    case .allScroll:
      return "all-scroll"
    case .colResize:
      return "col-resize"
    case .rowResize:
      return "row-resize"
    case .nResize:
      return "n-resize"
    case .eResize:
      return "e-resize"
    case .sResize:
      return "s-resize"
    case .wResize:
      return "w-resize"
    case .neResize:
      return "ne-resize"
    case .nwResize:
      return "nw-resize"
    case .seResize:
      return "se-resize"
    case .swResize:
      return "sw-resize"
    case .ewResize:
      return "ew-resize"
    case .nsResize:
      return "ns-resize"
    case .neswResize:
      return "nesw-resize"
    case .nwseResize:
      return "nwse-resize"
    case .zoomIn:
      return "zoom-in"
    case .zoomOut:
      return "zoom-out"
    case .url(let url, let fallback):
      return "\(url), \(fallback)"
    case .urlWithCoordinates(let url, let x, let y, let fallback):
      return "\(url) \(x) \(y), \(fallback)"
    case .global(let value):
      return value.description
    }
  }
}
