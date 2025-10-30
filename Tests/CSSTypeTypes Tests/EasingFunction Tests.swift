//
//  EasingFunction Tests.swift
//
//
//  Created on 04/02/2025.
//

import CSSTypeTypes
import Testing

@Suite("EasingFunction Tests")
struct EasingFunctionTests {

  @Test("Predefined easing functions render correctly")
  func testPredefinedEasingFunctions() {
    #expect(EasingFunction.linear.description == "linear")
    #expect(EasingFunction.ease.description == "ease")
    #expect(EasingFunction.easeIn.description == "ease-in")
    #expect(EasingFunction.easeOut.description == "ease-out")
    #expect(EasingFunction.easeInOut.description == "ease-in-out")
    #expect(EasingFunction.stepStart.description == "step-start")
    #expect(EasingFunction.stepEnd.description == "step-end")
  }

  @Test("Cubic bezier easing functions render correctly")
  func testCubicBezierFunction() {
    let bezier = EasingFunction.cubicBezier(0.42, 0, 0.58, 1)
    #expect(bezier.description == "cubic-bezier(0.42, 0, 0.58, 1)")

    let bezier2 = EasingFunction.cubicBezier(0.25, 0.1, 0.25, 1)
    #expect(bezier2.description == "cubic-bezier(0.25, 0.1, 0.25, 1)")
  }

  @Test("Steps easing functions render correctly")
  func testStepsFunction() {
    let steps1 = EasingFunction.steps(4, nil)
    #expect(steps1.description == "steps(4)")

    let steps2 = EasingFunction.steps(3, .start)
    #expect(steps2.description == "steps(3, start)")

    let steps3 = EasingFunction.steps(2, .jumpNone)
    #expect(steps3.description == "steps(2, jump-none)")

    let steps4 = EasingFunction.steps(5, .jumpBoth)
    #expect(steps4.description == "steps(5, jump-both)")
  }

  @Test("Linear points easing functions render correctly")
  func testLinearPointsFunction() {
    let points = [
      LinearPoint(value: 0),
      LinearPoint(value: 0.5, percentage: Percentage(50)),
      LinearPoint(value: 1),
    ]

    let linearPoints = EasingFunction.linearPoints(points)
    #expect(linearPoints.description == "linear(0, 0.5 50%, 1)")
  }

  @Test("StepPosition enum values render correctly")
  func testStepPositionValues() {
    #expect(StepPosition.start.description == "start")
    #expect(StepPosition.end.description == "end")
    #expect(StepPosition.jumpStart.description == "jump-start")
    #expect(StepPosition.jumpEnd.description == "jump-end")
    #expect(StepPosition.jumpNone.description == "jump-none")
    #expect(StepPosition.jumpBoth.description == "jump-both")
  }

  @Test("LinearPoint struct works correctly")
  func testLinearPoint() {
    let point1 = LinearPoint(value: 0.5)
    #expect(point1.value == 0.5)
    #expect(point1.percentage == nil)

    let point2 = LinearPoint(value: 0.75, percentage: Percentage(75))
    #expect(point2.value == 0.75)
    #expect(point2.percentage?.value == 75)
  }

  @Test("EasingFunction conforms to Hashable")
  func testHashable() {
    #expect(EasingFunction.linear == EasingFunction.linear)
    #expect(EasingFunction.ease != EasingFunction.easeIn)
    #expect(
      EasingFunction.cubicBezier(0.42, 0, 0.58, 1) == EasingFunction.cubicBezier(0.42, 0, 0.58, 1)
    )
    #expect(
      EasingFunction.cubicBezier(0.42, 0, 0.58, 1) != EasingFunction.cubicBezier(0.25, 0.1, 0.25, 1)
    )
    #expect(EasingFunction.steps(4, .end) == EasingFunction.steps(4, .end))
    #expect(EasingFunction.steps(4, .end) != EasingFunction.steps(4, .start))
  }

  @Test("EasingFunction is used in CSS transition/animation context")
  func testUsageInCSSContext() {
    // Create sample CSS property strings using EasingFunction
    let transition = "transition-timing-function: \(EasingFunction.easeInOut)"
    #expect(transition == "transition-timing-function: ease-in-out")

    let animation = "animation-timing-function: \(EasingFunction.cubicBezier(0.42, 0, 0.58, 1))"
    #expect(animation == "animation-timing-function: cubic-bezier(0.42, 0, 0.58, 1)")
  }
}
