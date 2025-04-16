//@starting-style
//
//
//Baseline 2024
//NEWLY AVAILABLE
//
//
//
//The @starting-style CSS at-rule is used to define starting values for properties set on an element that you want to transition from when the element receives its first style update, i.e., when an element is first displayed on a previously loaded page.
//
//Syntax
//The @starting-style at rule can be used in two ways:
//
//As a standalone block, in which case it contains one or more rulesets defining starting style declarations and selecting the elements they apply to:
//CSS
//Copy to Clipboard
//@starting-style {
//  /* rulesets */
//}
//Nested within an existing ruleset, in which case it contains one or more declarations defining starting property values for the elements already selected by that ruleset:
//CSS
//Copy to Clipboard
//selector {
//  /* existing ruleset */
//  /* ... */
//
//  @starting-style {
//    /* declarations */
//  }
//}
//Description
//To avoid unexpected behavior, CSS transitions are by default not triggered on an element's initial style update, or when its display type changes from none to another value. To enable first-style transitions, @starting-style rules are needed. They provide starting styles for elements that do not have a previous state, defining the property values to transition from.
//
//@starting-style is especially useful when creating entry and exit transitions for elements displayed in the top layer (such as popovers and modal <dialog>s), elements that are changing to and from display: none, and elements when first added to or removed from the DOM.
//
//Note: @starting-style is only relevant to CSS transitions. When using CSS animations to implement such effects, @starting-style is not needed. See Using CSS animations for an example.
//There are two ways to use @starting-style: as a standalone rule or nested within a ruleset.
//
//Let's consider a scenario where we want to animate a popover when shown (that is, when added to the top layer). The "original rule" specifying the styles for the open popover could look something like this (see the popover example below):
//
//CSS
//Copy to Clipboard
//[popover]:popover-open {
//  opacity: 1;
//  transform: scaleX(1);
//}
//To specify the starting values of the popover's properties that will be animated using the first method, you include a standalone @starting-style block in your CSS:
//
//CSS
//Copy to Clipboard
//@starting-style {
//  [popover]:popover-open {
//    opacity: 0;
//    transform: scaleX(0);
//  }
//}
//Note: The @starting-style at-rule and the "original rule" have the same specificity. To ensure that starting styles get applied, include the @starting-style at-rule after the "original rule". If you specify the @starting-style at-rule before the "original rule", the original styles will override the starting styles.
//To specify the starting style for the popover using the nested method, you can nest the @starting-style block inside the "original rule":
//
//CSS
//Copy to Clipboard
//[popover]:popover-open {
//  opacity: 1;
//  transform: scaleX(1);
//
//  @starting-style {
//    opacity: 0;
//    transform: scaleX(0);
//  }
//}
//When exactly are starting styles used?
//It is important to understand that an element will transition from its @starting-style styles when it is first rendered in the DOM, or when it transitions from display: none to a visible value. When it transitions back from its initial visible state, it will no longer use the @starting-style styles as it is now visible in the DOM. Instead, it will transition back to whatever styles exist for that element's default state.
//
//In effect, there are three style states to manage in these situations — starting-style state, transitioned state, and default state. It is possible for the "to" and "from" transitions to be different in such cases. You can see a proof of this in our Demonstration of when starting styles are used example, below.
//
//Formal syntax
//@starting-style =
//  @starting-style { <rule-list> }
//
//Examples
//Basic @starting-style usage
//Transition an element's background-color from transparent to green when it is initially rendered:
//
//CSS
//Copy to Clipboard
//#target {
//  transition: background-color 1.5s;
//  background-color: green;
//}
//
//@starting-style {
//  #target {
//    background-color: transparent;
//  }
//}
//Transition the opacity of an element when it changes its display value to or from none:
//
//CSS
//Copy to Clipboard
//#target {
//  transition-property: opacity, display;
//  transition-duration: 0.5s;
//  display: block;
//  opacity: 1;
//  @starting-style {
//    opacity: 0;
//  }
//}
//
//#target.hidden {
//  display: none;
//  opacity: 0;
//}
//Demonstration of when starting styles are used
//In this example, a button is pressed to create a <div> element, give it a class of showing, and add it to the DOM.
//
//showing is given a @starting-style of background-color: red and a style of background-color: blue to transition to. The default div ruleset contains background-color: yellow, and is also where the transition is set.
//
//When the <div> is first added to the DOM, you'll see the background transition from red to blue. After a timeout, we remove the showing class from the <div> via JavaScript. At that point it transitions from blue back to yellow, not red. This proves that the starting styles are only used when the element is first rendered in the DOM. Once it has appeared, the element transitions back to the default style set on it.
//
//After another timeout, we then remove the <div> from the DOM altogether, resetting the initial state of the example so it can be run again.
//
//HTML
//
//HTML
//Copy to Clipboard
//Play
//<button>Display <code>&lt;div&gt;</code></button>
//CSS
//
//CSS
//Copy to Clipboard
//Play
//div {
//  background-color: yellow;
//  transition: background-color 3s;
//}
//
//div.showing {
//  background-color: skyblue;
//}
//
//@starting-style {
//  div.showing {
//    background-color: red;
//  }
//}
//JavaScript
//
//JS
//Copy to Clipboard
//Play
//const btn = document.querySelector("button");
//
//btn.addEventListener("click", () => {
//  btn.disabled = true;
//  const divElem = document.createElement("div");
//  divElem.classList.add("showing");
//  document.body.append(divElem);
//
//  setTimeout(() => {
//    divElem.classList.remove("showing");
//
//    setTimeout(() => {
//      divElem.remove();
//      btn.disabled = false;
//    }, 3000);
//  }, 3000);
//});
//Result
//
//The code renders as follows:
//
//Play
//
//Animating a popover
//In this example, a popover is animated using CSS transitions. Basic entry and exit animations are provided using the transition property.
//
//HTML
//
//The HTML contains a <div> element declared as a popover using the popover attribute and a <button> element designated as the popover's display control using its popovertarget attribute.
//
//HTML
//Copy to Clipboard
//Play
//<button popovertarget="mypopover">Show the popover</button>
//<div popover="auto" id="mypopover">I'm a Popover! I should animate.</div>
//CSS
//
//In this example, we want to animate two properties, opacity and transform (specifically, a horizontally scaling transform), to make the popover fade in and out as well as grow and shrink horizontally.
//
//CSS
//Copy to Clipboard
//Play
//html {
//  font-family: Arial, Helvetica, sans-serif;
//}
//
//[popover]:popover-open {
//  opacity: 1;
//  transform: scaleX(1);
//}
//
//[popover] {
//  font-size: 1.2rem;
//  padding: 10px;
//
//  /* Final state of the exit animation */
//  opacity: 0;
//  transform: scaleX(0);
//
//  transition:
//    opacity 0.7s,
//    transform 0.7s,
//    overlay 0.7s allow-discrete,
//    display 0.7s allow-discrete;
//  /* Equivalent to
//  transition: all 0.7s allow-discrete; */
//}
//
///* Include after the [popover]:popover-open rule */
//@starting-style {
//  [popover]:popover-open {
//    opacity: 0;
//    transform: scaleX(0);
//  }
//}
//
///* Transition for the popover's backdrop */
//[popover]::backdrop {
//  background-color: rgb(0 0 0 / 0%);
//  transition:
//    display 0.7s allow-discrete,
//    overlay 0.7s allow-discrete,
//    background-color 0.7s;
//  /* Equivalent to
//  transition: all 0.7s allow-discrete; */
//}
//
//[popover]:popover-open::backdrop {
//  background-color: rgb(0 0 0 / 25%);
//}
//
///* Nesting (&) is not supported for pseudo-elements
//so specify a standalone starting-style block. */
//@starting-style {
//  [popover]:popover-open::backdrop {
//    background-color: rgb(0 0 0 / 0%);
//  }
//}
//To achieve this, we have set a starting state for these properties on the default hidden state of the popover element (selected via [popover]), and an ending state on the open state of the popover (selected via the :popover-open pseudo-class).
//
//We then set a transition property to animate between the two states. A starting state for the animation is included inside a @starting-style at-rule to enable the entry animation.
//
//Because the animated element is being promoted to the top layer when shown and removed from the top layer when hidden (with display: none), some extra steps are required to ensure the animation works in both directions:
//
//display is added to the list of transitioned elements to ensure the animated element is visible (set to display: block or another visible display value) throughout both the entry and exit animations. Without this, the exit animation would not be visible; in effect, the popover would just disappear. Note that the transition-behavior: allow-discrete value is also set in the shorthand to activate the animation.
//overlay is added to the list of transitioned elements to ensure that the removal of the element from the top layer is deferred until the animation ends. This doesn't make a huge difference for animations such as this one, but in more complex cases, not doing this can result in the element being removed from the overlay too quickly, meaning the animation is not smooth or effective. Again, transition-behavior: allow-discrete is required in this case for the animation to occur.
//Note: We've also included a transition on the ::backdrop that appears behind the popover when it opens, to provide a nice darkening animation. [popover]:popover-open::backdrop is used to select the backdrop when the popover is open.
//Result
//
//The code renders as follows:
//
//Play
//
//Note: Because popovers change from display: none to display: block each time they are shown, the popover transitions from its @starting-style styles to its [popover]:popover-open styles every time the entry transition occurs. When the popover closes, it transitions from its [popover]:popover-open state to the default [popover] state.
//Note: You can find an example that demonstrates transitioning a <dialog> element and its backdrop as it is shown and hidden on the <dialog> reference page — see Transitioning dialog elements.
//Transitioning elements on DOM addition and removal
//This example contains a button which, when pressed, appends new elements to a <section> container. Each element, in turn, contains a nested button, which when pressed, removes the element. This example demonstrates how to use transitions to animate elements when they are added to or removed from the DOM.
//
//HTML
//
//HTML
//Copy to Clipboard
//Play
//<button>Create new column</button>
//<section></section>
//JavaScript
//
//JavaScript enables the addition and removal of elements:
//
//JS
//Copy to Clipboard
//Play
//const btn = document.querySelector("button");
//const sectionElem = document.querySelector("section");
//
//btn.addEventListener("click", createColumn);
//
//function randomColor() {
//  function randomNum() {
//    return Math.floor(Math.random() * 255);
//  }
//
//  return `rgb(${randomNum()} ${randomNum()} ${randomNum()})`;
//}
//
//function createColumn() {
//  const divElem = document.createElement("div");
//  divElem.style.backgroundColor = randomColor();
//
//  const closeBtn = document.createElement("button");
//  closeBtn.textContent = "✖";
//  closeBtn.setAttribute("aria-label", "close");
//  divElem.append(closeBtn);
//  sectionElem.append(divElem);
//
//  closeBtn.addEventListener("click", () => {
//    divElem.classList.add("fade-out");
//
//    setTimeout(() => {
//      divElem.remove();
//    }, 1000);
//  });
//}
//When the "Create new column" button is clicked, the createColumn() function is called. This creates a <div> element with a randomly generated background color and a <button> element to close the <div>. It then appends the <button> to the <div> and the <div> to the <section> container.
//
//We then add an event listener to the close button via addEventListener(). Clicking the close button does two things:
//
//Adds the fade-out class to the <div>. Adding the class triggers the exit animation set on that class.
//Removes the <div> after a 1000ms delay. The setTimeout() delays removal of the <div> from the DOM (via Element.remove()) until after the animation ends.
//CSS
//
//We include a transition that animates the opacity and scale of each column as they are added and removed:
//
//CSS
//Copy to Clipboard
//Play
//div {
//  flex: 1;
//  border: 1px solid gray;
//  position: relative;
//  background: linear-gradient(
//    to right,
//    rgb(255 255 255 / 0%),
//    rgb(255 255 255 / 50%)
//  );
//  opacity: 1;
//  scale: 1 1;
//
//  transition:
//    opacity 0.7s,
//    scale 0.7s,
//    display 0.7s allow-discrete,
//    all 0.7s allow-discrete;
//  /* Equivalent to
//  transition: all 0.7s allow-discrete; */
//}
//
///* Include after the `div` rule */
//@starting-style {
//  div {
//    opacity: 0;
//    scale: 1 0;
//  }
//}
//
//.fade-out {
//  opacity: 0;
//  display: none;
//  scale: 1 0;
//}
//
//div > button {
//  font-size: 1.6rem;
//  background: none;
//  border: 0;
//  text-shadow: 2px 1px 1px white;
//  border-radius: 15px;
//  position: absolute;
//  top: 1px;
//  right: 1px;
//  cursor: pointer;
//}
//To animate the opacity and scale of each <div> as it is added to the DOM and then reverse the animation as it is removed from the DOM, we:
//
//Specify the ending state of the properties we want to transition on the div { ... } rule.
//Specify the starting state from which to transition the properties inside a @starting-style block.
//Specify the exit animation inside the .fade-out rule — this is the class that the JavaScript assigns to the <div> elements when their close buttons are pressed. Besides setting the opacity and scale ending states, we also set display: none on the <div>s — we want them to become immediately unavailable when removed from the UI.
//Specify the transition list inside the div { ... } rule to animate opacity, scale, and display. Note that for display, the transition-behavior: allow-discrete value is also set in the shorthand so that it will animate.
//Result
//
//The final result looks like this:
//
