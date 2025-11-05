import Foundation

/// Represents CSS display internal values for elements within table and ruby layouts.
///
/// The `DisplayInternal` data type specifies the role an element plays within complex layout
/// structures like tables and ruby annotations. These values only have meaning within those
/// particular layout modes.
///
/// Example:
/// ```swift
/// .display(.tableRow)             // Table row like <tr>
/// .display(.tableCell)            // Table cell like <td>
/// .display(.rubyText)             // Ruby text annotation
/// ```
///
/// - Note: These values are typically used to create CSS-based layouts that mimic HTML
///         elements without using those actual HTML elements.
///
/// - SeeAlso: [MDN Web Docs on display-internal values](https://developer.mozilla.org/en-US/docs/Web/CSS/display-internal)
public enum DisplayInternal: String, Sendable, Hashable {
    // Table-related values

    /// Table row group (like `<tbody>`)
    ///
    /// These elements behave like HTML `<tbody>` elements.
    /// ```css
    /// display: table-row-group;
    /// ```
    case tableRowGroup = "table-row-group"

    /// Table header group (like `<thead>`)
    ///
    /// These elements behave like HTML `<thead>` elements.
    /// ```css
    /// display: table-header-group;
    /// ```
    case tableHeaderGroup = "table-header-group"

    /// Table footer group (like `<tfoot>`)
    ///
    /// These elements behave like HTML `<tfoot>` elements.
    /// ```css
    /// display: table-footer-group;
    /// ```
    case tableFooterGroup = "table-footer-group"

    /// Table row (like `<tr>`)
    ///
    /// These elements behave like HTML `<tr>` elements.
    /// ```css
    /// display: table-row;
    /// ```
    case tableRow = "table-row"

    /// Table cell (like `<td>` or `<th>`)
    ///
    /// These elements behave like HTML `<td>` elements.
    /// ```css
    /// display: table-cell;
    /// ```
    case tableCell = "table-cell"

    /// Table column group (like `<colgroup>`)
    ///
    /// These elements behave like HTML `<colgroup>` elements.
    /// ```css
    /// display: table-column-group;
    /// ```
    case tableColumnGroup = "table-column-group"

    /// Table column (like `<col>`)
    ///
    /// These elements behave like HTML `<col>` elements.
    /// ```css
    /// display: table-column;
    /// ```
    case tableColumn = "table-column"

    /// Table caption (like `<caption>`)
    ///
    /// These elements behave like HTML `<caption>` elements.
    /// ```css
    /// display: table-caption;
    /// ```
    case tableCaption = "table-caption"

    // Ruby-related values

    /// Ruby base (like `<rb>`)
    ///
    /// These elements behave like HTML `<rb>` elements.
    /// ```css
    /// display: ruby-base;
    /// ```
    case rubyBase = "ruby-base"

    /// Ruby text (like `<rt>`)
    ///
    /// These elements behave like HTML `<rt>` elements.
    /// ```css
    /// display: ruby-text;
    /// ```
    case rubyText = "ruby-text"

    /// Ruby base container
    ///
    /// Generated as anonymous boxes in ruby layout.
    /// ```css
    /// display: ruby-base-container;
    /// ```
    case rubyBaseContainer = "ruby-base-container"

    /// Ruby text container (like `<rtc>`)
    ///
    /// These elements behave like HTML `<rtc>` elements.
    /// ```css
    /// display: ruby-text-container;
    /// ```
    case rubyTextContainer = "ruby-text-container"
}

/// Provides string conversion for CSS output
extension DisplayInternal: CustomStringConvertible {
    /// Converts the display internal value to its CSS string representation
    ///
    /// This method returns the raw string value for use in CSS properties.
    public var description: String {
        return rawValue
    }
}
