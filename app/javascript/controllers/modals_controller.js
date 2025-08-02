import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modals"
export default class extends Controller {
  connect() {
    console.log("Modals controller connected")
  }

  close(event) {
  console.log("Close method was called!")
  event.preventDefault()
  this.element.closest("turbo-frame").innerHTML = ""

}

  // preventClose(event) {
  //   event.stopPropagation()
  // }
}
