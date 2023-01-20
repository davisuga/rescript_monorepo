let render = makeContainer => {
  open A
  // All 4 examples.
  ReactDOM.render(
    <BlinkingGreeting> {React.string("Hello!")} </BlinkingGreeting>,
    makeContainer("Blinking Greeting"),
  )

  ReactDOM.render(<ReducerFromReactJSDocs />, makeContainer("Reducer From ReactJS Docs"))

  ReactDOM.render(<FetchedDogPictures />, makeContainer("Fetched Dog Pictures"))

  ReactDOM.render(<ReasonUsingJSUsingReason />, makeContainer("Reason Using JS Using Reason"))
}
