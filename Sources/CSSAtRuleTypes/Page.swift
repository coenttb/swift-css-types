//@page
//
//
//Baseline 2024 *
//NEWLY AVAILABLE
//
//
//
//The @page at-rule is a CSS at-rule used to modify different aspects of printed pages. It targets and modifies the page's dimensions, orientation, and margins. The @page at-rule can be used to target all pages in a print-out or a subset using its various pseudo-classes.
//
//Syntax
//CSS
//Copy to Clipboard
///* Targets all the pages */
//@page {
//  size: 8.5in 9in;
//  margin-top: 4in;
//}
//
///* Targets all even-numbered pages */
//@page :left {
//  margin-top: 4in;
//}
//
///* Targets all odd-numbered pages */
//@page :right {
//  size: 11in;
//  margin-top: 4in;
//}
//
///* Targets all selectors with `page: wide;` set */
//@page wide {
//  size: a4 landscape;
//}
//
//@page {
//  /* margin box at top right showing page number */
//  @top-right {
//    content: "Page " counter(pageNumber);
//  }
//}
//Page properties
//The @page at-rule can contain only page descriptors and margin at-rules. The following descriptors have been implemented by at least one browser:
//
//margin
//Specifies the page margins. Individual margin properties margin-top, margin-right, margin-bottom, and margin-left can also be used.
//
//page-orientation
//Specifies the orientation of the page. This does not affect the layout of the page; the rotation is applied after the layout in the output medium.
//
//size
//Specifies the target size and orientation of the page box's containing block. In the general case, where one page box is rendered onto one page sheet, it also indicates the size of the destination page sheet.
//
//The specification mentions following CSS properties to be applicable to page boxes via @page at-rule. But these have not been supported by any user agent yet.
//
//Remaining page properties
//Description
//The @page rule defines properties of the page box. The @page at-rule can be accessed via the CSS object model interface CSSPageRule.
//
//Note: The W3C is discussing how to handle viewport-related <length> units, vh, vw, vmin, and vmax. Meanwhile do not use them within a @page at-rule.
//Related properties
//The @page at-rule, allows the user to assign a name to the rule, which is then called in a declaration using the page property.
//
//page
//Allows a selector to use a user defined named page
//
//Formal syntax
//@page =
//  @page <page-selector-list>? { <declaration-rule-list> }
//
//<page-selector-list> =
//  <page-selector>#
//
//<page-selector> =
//  [ <ident-token>? <pseudo-page>* ]!
//
//<pseudo-page> =
//  : [ left | right | first | blank ]
//
//Sources: CSS Paged Media Module Level 3
//Where the <page-body> includes:
//
//page-properties
//page-margin properties
//and <pseudo-page> represents these pseudo-classes:
//
//:blank
//:first
//:left
//:right
//Margin at-rules
//The margin at-rules are used inside of the @page at-rule. They each target a different section of the document printed page, styling the area of the printed page based on the property values set in the style block:
//
//CSS
//Copy to Clipboard
//@page {
//  @top-left {
//    /* page-margin-properties */
//  }
//}
//@top-left targets the top-left of the document and applies the changes based on the page-margin-properties set.
//
//Other margin-at rules include:
//
//CSS
//Copy to Clipboard
//@top-left-corner
//@top-left
//@top-center
//@top-right
//@top-right-corner
//@bottom-left-corner
//@bottom-left
//@bottom-center
//@bottom-right
//@bottom-right-corner
//@left-top
//@left-middle
//@left-bottom
//@right-top
//@right-middle
//@right-bottom
//Page-margin properties
//The page-margin properties are the set of CSS properties can be set in any individual margin at-rule. They include:
//
//Page-margin properties
//Named pages
//Named pages enable performing per-page layout and adding page-breaks in a declarative manner when printing.
//
//Named pages can be applied using the page property. This allows the user to create different page configurations for use in print layouts.
//
//An example of this can be found on the page examples.
//
//Examples
//Using the size property to change the page orientation
//This example shows how to split the <section>s into individual pages in landscape format with each page having a 20% margin when printed. Clicking the print button will launch a print dialog with the HTML sections split into individual pages.
//
//HTML
//Copy to Clipboard
//Play
//<button>Print page</button>
//<article>
//  <section>
//    <h2>Header one</h2>
//    <p>Paragraph one.</p>
//  </section>
//  <section>
//    <h2>Header two</h2>
//    <p>Paragraph two.</p>
//  </section>
//  <section>
//    <h2>Header three</h2>
//    <p>Paragraph three.</p>
//  </section>
//</article>
//JS
//Copy to Clipboard
//Play
//const button = document.querySelector("button");
//
//button.addEventListener("click", () => {
//  window.print();
//});
//CSS
//Copy to Clipboard
//Play
//@page {
//  size: landscape;
//  margin: 2cm;
//}
//
//section {
//  page-break-after: always;
//  break-after: page;
//}
//
//@media print {
//  button {
//    display: none;
//  }
//}
//Play
//
//@page pseudo-class examples
//See the various pseudo-classes of @page for examples.
//
//:blank
//:first
//:left
//:right
