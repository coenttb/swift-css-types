//@namespace
//
//
//Baseline Widely available
//
//
//
//@namespace is an at-rule that defines XML namespaces to be used in a CSS style sheet.
//
//Try it
//CSS Demo: @namespace
//RESET
//CSS
//HTML
//1
//2
//3
//4
//5
//6
//7
//8
//9
//10
//11
//12
//13
//14
//@namespace svg url("http://www.w3.org/2000/svg");
//
//a {
//  color: orangered;
//  text-decoration: underline dashed;
//  font-weight: bold;
//}
//
//svg|a {
//  fill: blueviolet;
//  text-decoration: underline solid;
//  text-transform: uppercase;
//}
//
//OUTPUT
//Syntax
//CSS
//Copy to Clipboard
///* Default namespace */
//@namespace url(XML-namespace-URL);
//@namespace "XML-namespace-URL";
//
///* Prefixed namespace */
//@namespace prefix url(XML-namespace-URL);
//@namespace prefix "XML-namespace-URL";
//Description
//The defined namespaces can be used to restrict the universal, type, and attribute selectors to only select elements within that namespace. The @namespace rule is generally only useful when dealing with documents containing multiple namespaces—such as HTML with inline SVG or MathML, or XML that mixes multiple vocabularies.
//
//Any @namespace rules must follow all @charset and @import rules, and precede all other at-rules and style declarations in a style sheet.
//
//@namespace can be used to define the default namespace for the style sheet. When a default namespace is defined, all universal and type selectors (but not attribute selectors, see note below) apply only to elements in that namespace.
//
//The @namespace rule can also be used to define a namespace prefix. When a universal, type, or attribute selector is prefixed with a namespace prefix, then that selector only matches if the namespace and name of the element or attribute matches.
//
//In HTML, known foreign elements will automatically be assigned namespaces. This means that HTML elements will act as though they are in the XHTML namespace (http://www.w3.org/1999/xhtml), even if there is no xmlns attribute anywhere in the document, and the <svg> and <math> elements will be assigned their proper namespaces (http://www.w3.org/2000/svg and http://www.w3.org/1998/Math/MathML, respectively).
//
//Note: In XML, unless a prefix is defined directly on an attribute (e.g., xlink:href), that attribute has no namespace. In other words, attributes do not inherit the namespace of the element they're on. To match this behavior, the default namespace in CSS does not apply to attribute selectors.
//Formal syntax
//@namespace =
//  @namespace <namespace-prefix>? [ <string> | <url> ] ;
//
//<namespace-prefix> =
//  <ident>
//
//<url> =
//  <url()>  |
//  <src()>
//
//<url()> =
//  url( <string> <url-modifier>* )  |
//  <url-token>
//
//<src()> =
//  src( <string> <url-modifier>* )
//
//Sources: CSS Namespaces Module Level 3, CSS Values and Units Module Level 4
//Examples
//Specifying default and prefixed namespaces
//CSS
//Copy to Clipboard
//@namespace url(http://www.w3.org/1999/xhtml);
//@namespace svg url(http://www.w3.org/2000/svg);
//
///* This matches all XHTML <a> elements, as XHTML is the default unprefixed namespace */
//a {
//}
//
///* This matches all SVG <a> elements */
//svg|a {
//}
//
///* This matches both XHTML and SVG <a> elements */
//*|a {
//}
