import { Controller } from "@hotwired/stimulus"

// This controller automatically submits the form it's attached to
// when an input with a data-action fires an event.
export default class extends Controller {
  submit() {
    this.element.requestSubmit()
  }
}
