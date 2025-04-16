//@scope
//
//
//Limited availability
//
//
//
//The @scope CSS at-rule enables you to select elements in specific DOM subtrees, targeting elements precisely without writing overly-specific selectors that are hard to override, and without coupling your selectors too tightly to the DOM structure.
//
//In JavaScript, @scope can be accessed via the CSS object model interface CSSScopeRule.
//
//Syntax
//The @scope at-rule contains one or more rulesets (termed scoped style rules) and defines a scope in which to apply them to selected elements. @scope can be used in two ways:
//
//As a standalone block inside your CSS, in which case it includes a prelude section that includes scope root and optional scope limit selectors — these define the upper and lower bounds of the scope.
//CSS
//Copy to Clipboard
//@scope (scope root) to (scope limit) {
//  /* … */
//}
//As inline styles included inside a <style> element in your HTML, in which case the prelude is omitted, and the enclosed ruleset is automatically scoped to the <style> element's enclosing parent element.
//HTML
//Copy to Clipboard
//<parent-element>
//  <style>
//    @scope {
//      rulesets
//    }
//  </style>
//</parent-element>
//It is also possible to combine an inline @scope with a scope limit selector, as in @scope to (scope limit) { ... }.
//Description
//A complex web document might include components such as headers, footers, news articles, maps, media players, ads, and others. As complexity increases, effectively managing the styling for these components becomes more of a concern, and effective scoping of styles helps us manage this complexity. Let's consider the following DOM tree:
//
//body
//└─ article.feature
//   ├─ section.article-hero
//   │  ├─ h2
//   │  └─ img
//   │
//   ├─ section.article-body
//   │  ├─ h3
//   │  ├─ p
//   │  ├─ img
//   │  ├─ p
//   │  └─ figure
//   │     ├─ img
//   │     └─ figcaption
//   │
//   └─ footer
//      ├─ p
//      └─ img
//If you wanted to select the <img> element inside the <section> with a class of article-body, you could do the following:
//
//Write a selector like .feature > .article-body > img. However, that has high specificity so is hard to override, and is also tightly coupled to the DOM structure. If your markup structure changes in the future, you might need to rewrite your CSS.
//Write something less specific like .article-body img. However, that will select all images inside the section.
//This is where @scope is useful. It allows you to define a precise scope inside which your selectors are allowed to target elements. For example, you could solve the above problem using a standalone @scope block like the following:
//
//CSS
//Copy to Clipboard
//@scope (.article-body) to (figure) {
//  img {
//    border: 5px solid black;
//    background-color: goldenrod;
//  }
//}
//The .article-body scope root selector defines the upper bound of the DOM tree scope in which the ruleset will be applied, and the figure scope limit selector defines the lower bound. As a result, only <img> elements inside a <section> with a class of article-body, but not inside <figure> elements, will be selected.
//
//Note: This kind of scoping — with an upper and lower bound — is commonly referred to as a donut scope.
//The scope's upper bound is inclusive and its lower bound is exclusive. To change this behavior, you can combine either selector with a universal child selector. For example, @scope (scope root) to (scope limit > *) would make both bounds inclusive, @scope (scope root > *) to (scope limit) would make both bounds exclusive, while @scope (scope root > *) to (scope limit > *) would give an exclusive upper bound and an inclusive lower bound.
//
//If you want to select all images inside a <section> with a class of article-body, you can omit the scope limit:
//
//CSS
//Copy to Clipboard
//@scope (.article-body) {
//  img {
//    border: 5px solid black;
//    background-color: goldenrod;
//  }
//}
//Or you could include your @scope block inline inside a <style> element, which in turn is inside the <section> with a class of article-body:
//
//HTML
//Copy to Clipboard
//<section class="article-body">
//  <style>
//    @scope {
//      img {
//        border: 5px solid black;
//        background-color: goldenrod;
//      }
//    }
//  </style>
//
//  <!-- ... -->
//</section>
//Note: It is important to understand that, while @scope allows you to isolate the application of selectors to specific DOM subtrees, it does not completely isolate the applied styles to within those subtrees. This is most noticeable with inheritance — properties that are inherited by children (for example color or font-family) will still be inherited, beyond any set scope limit.
//The :scope pseudo-class
//In the context of a @scope block, the :scope pseudo-class represents the scope root — it provides an easy way to apply styles to the scope root itself, from inside the scope:
//
//CSS
//Copy to Clipboard
//@scope (.feature) {
//  :scope {
//    background: rebeccapurple;
//    color: antiquewhite;
//    font-family: sans-serif;
//  }
//}
//In fact, :scope is implicitly prepended to all scoped style rules. If you want, you can explicitly prepend :scope or prepend the nesting selector (&) to get the same effect if you find these representations easier to understand.
//
//The three rules in the following block are all equivalent in what they select:
//
//CSS
//Copy to Clipboard
//@scope (.feature) {
//  img {
//    /* … */
//  }
//
//  :scope img {
//    /* … */
//  }
//
//  & img {
//    /* … */
//  }
//}
//Notes on scoped selector usage
//A scope limit can use :scope to specify a specific relationship requirement between the scope limit and root. For example:
//CSS
//Copy to Clipboard
///* figure is only a limit when it is a direct child of the :scope */
//@scope (.article-body) to (:scope > figure) {
//  /* … */
//}
//A scope limit can reference elements outside the scope root using :scope. For example:
//CSS
//Copy to Clipboard
///* figure is only a limit when the :scope is inside .feature */
//@scope (.article-body) to (.feature :scope figure) {
//  /* … */
//}
//Scoped style rules can't escape the subtree. Selections like :scope + p are invalid because that selection would be outside the subtree.
//It is perfectly valid to define the scope root and limit as a selector list, in which case multiple scopes will be defined. In the following example the styles are applied to any <img> inside a <section> with a class of article-hero or article-body, but not if it is nested inside a <figure>:
//CSS
//Copy to Clipboard
//@scope (.article-hero, .article-body) to (figure) {
//  img {
//    border: 5px solid black;
//    background-color: goldenrod;
//  }
//}
//Specificity in @scope
//Including a ruleset inside a @scope block does not affect the specificity of its selector, regardless of the selectors used inside the scope root and limit. For example:
//
//CSS
//Copy to Clipboard
//@scope (.article-body) {
//  /* img has a specificity of 0-0-1, as expected */
//  img {
//    /* … */
//  }
//}
//However, if you decide to explicitly prepend the :scope pseudo-class to your scoped selectors, you'll need to factor it in when calculating their specificity. :scope, like all regular pseudo-classes, has a specificity of 0-1-0. For example:
//
//CSS
//Copy to Clipboard
//@scope (.article-body) {
//  /* :scope img has a specificity of 0-1-0 + 0-0-1 = 0-1-1 */
//  :scope img {
//    /* … */
//  }
//}
//When using the & selector inside a @scope block, & represents the scope root selector; it is internally calculated as that selector wrapped inside an :is() pseudo-class function. So for example, in:
//
//CSS
//Copy to Clipboard
//@scope (figure, #primary) {
//  & img {
//    /* … */
//  }
//}
//& img is equivalent to :is(figure, #primary) img. Since :is() takes the specificity of its most specific argument (#primary, in this case), the specificity of the scoped & img selector is therefore 1-0-0 + 0-0-1 = 1-0-1.
//
//The difference between :scope and & inside @scope
//:scope represents the matched scope root, whereas & represents the selector used to match the scope root. Because of this, it is possible to chain & multiple times. However, you can only use :scope once — you can't match a scope root inside a scope root.
//
//CSS
//Copy to Clipboard
//@scope (.feature) {
//  /* Selects a .feature inside the matched root .feature */
//  & & {
//    /* … */
//  }
//
//  /* Doesn't work */
//  :scope :scope {
//    /* … */
//  }
//}
//How @scope conflicts are resolved
//@scope adds a new criterion to the CSS cascade: scoping proximity. This states that when two scopes have conflicting styles, the style that has the smallest number of hops up the DOM tree hierarchy to the scope root is applied. Let's look at an example to see what this means.
//
//Take the following HTML snippet, where different-themed cards are nested inside one another:
//
//HTML
//Copy to Clipboard
//<div class="light-theme">
//  <p>Light theme text</p>
//  <div class="dark-theme">
//    <p>Dark theme text</p>
//    <div class="light-theme">
//      <p>Light theme text</p>
//    </div>
//  </div>
//</div>
//If you wrote the theme CSS like so, you'd run into trouble:
//
//CSS
//Copy to Clipboard
//.light-theme {
//  background: #ccc;
//}
//
//.dark-theme {
//  background: #333;
//}
//
//.light-theme p {
//  color: black;
//}
//
//.dark-theme p {
//  color: white;
//}
//The innermost paragraph is supposed to be colored black because it is inside a light theme card. However, it's targeted by both .light-theme p and .dark-theme p. Because the .dark-theme p rule appears later in the source order, it is applied, and the paragraph ends up being wrongly colored white.
//
//To fix this, you can use @scope as follows:
//
//CSS
//Copy to Clipboard
//@scope (.light-theme) {
//  :scope {
//    background: #ccc;
//  }
//  p {
//    color: black;
//  }
//}
//
//@scope (.dark-theme) {
//  :scope {
//    background: #333;
//  }
//  p {
//    color: white;
//  }
//}
//Now the innermost paragraph is correctly colored black. This is because it is only one DOM tree hierarchy level away from the .light-theme scope root, but two levels away from the .dark-theme scope root. Therefore, the light style wins.
//
//Note: Scoping proximity overrules source order but is itself overridden by other, higher-priority criteria such as importance, layers, and specificity.
//Formal syntax
//@scope =
//  @scope [ ( <scope-start> ) ]? [ to ( <scope-end> ) ]? { <block-contents> }
//
//Sources: CSS Cascading and Inheritance Level 6
//Examples
//Basic style inside scope roots
//In this example, we use two separate @scope blocks to match links inside elements with a .light-scheme and .dark-scheme class respectively. Note how :scope is used to select and provide styling to the scope roots themselves. In this example, the scope roots are the <div> elements that have the classes applied to them.
//
//HTML
//
//HTML
//Copy to Clipboard
//Play
//<div class="light-scheme">
//  <p>
//    MDN contains lots of information about
//    <a href="/en-US/docs/Web/HTML">HTML</a>,
//    <a href="/en-US/docs/Web/CSS">CSS</a>, and
//    <a href="/en-US/docs/Web/JavaScript">JavaScript</a>.
//  </p>
//</div>
//
//<div class="dark-scheme">
//  <p>
//    MDN contains lots of information about
//    <a href="/en-US/docs/Web/HTML">HTML</a>,
//    <a href="/en-US/docs/Web/CSS">CSS</a>, and
//    <a href="/en-US/docs/Web/JavaScript">JavaScript</a>.
//  </p>
//</div>
//CSS
//
//CSS
//Copy to Clipboard
//Play
//@scope (.light-scheme) {
//  :scope {
//    background-color: plum;
//  }
//
//  a {
//    color: darkmagenta;
//  }
//}
//
//@scope (.dark-scheme) {
//  :scope {
//    background-color: darkmagenta;
//    color: antiquewhite;
//  }
//
//  a {
//    color: plum;
//  }
//}
//Result
//
//The above code renders like this:
//
//Play
//
//Scope roots and scope limits
//In this example, we have an HTML snippet that matches the DOM structure we talked about earlier in the Description section. This structure represents a typical article summary. The key features to note are the <img> elements, which are nested at various levels in the structure.
//
//The aim of this example is to show how to use a scope root and limit to style <img> elements starting at the top of the hierarchy, but only down as far as (and not including) the <img> inside the <figure> element — in effect creating a donut scope.
//
//HTML
//
//HTML
//Copy to Clipboard
//Play
//<article class="feature">
//  <section class="article-hero">
//    <h2>Article heading</h2>
//    <img alt="image" />
//  </section>
//
//  <section class="article-body">
//    <h3>Article subheading</h3>
//    <p>
//      Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam euismod
//      consectetur leo, nec eleifend quam volutpat vitae. Duis quis felis at
//      augue imperdiet aliquam. Morbi at felis et massa mattis lacinia. Cras
//      pharetra velit nisi, ac efficitur magna luctus nec.
//    </p>
//
//    <img alt="image" />
//
//    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
//
//    <figure>
//      <img alt="image" />
//      <figcaption>My infographic</figcaption>
//    </figure>
//  </section>
//
//  <footer>
//    <p>Written by Chris Mills.</p>
//    <img alt="image" />
//  </footer>
//</article>
//CSS
//
//In our CSS, we have two @scope blocks:
//
//The first @scope block defines its scope root as elements with a class of .feature (in this case, the outer <article> only), demonstrating how @scope can be used to theme a specific HTML subset.
//The second @scope block also defines its scope root as elements with a class of .feature, but also defines a scope limit of figure. This ensures that contained rulesets will only be applied to matching elements within the scope root (<article class="feature"> ... </article> in this case) that are not nested inside descendant <figure> elements. This @scope block contains a single ruleset that styles <img> elements with a thick black border and a golden background color.
//CSS
//Copy to Clipboard
//Play
///* Scoped CSS */
//
//@scope (.feature) {
//  :scope {
//    background: rebeccapurple;
//    color: antiquewhite;
//    font-family: sans-serif;
//  }
//
//  figure {
//    background-color: white;
//    border: 2px solid black;
//    color: black;
//    padding: 10px;
//  }
//}
//
///* Donut scope */
//
//@scope (.feature) to (figure) {
//  img {
//    border: 5px solid black;
//    background-color: goldenrod;
//  }
//}
//Result
//
//In the rendered code, note how all of the <img> elements are styled with the thick border and golden background, except for the one inside the <figure> element (labeled "My infographic").
//
//Play
//
