import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modals"
export default class extends Controller {
  connect() {
    console.log("Modals controller connected")
  }

  close() {
    this.element.remove()
  }

  preventClose(event) {
    event.stopPropagation()
  }
}
