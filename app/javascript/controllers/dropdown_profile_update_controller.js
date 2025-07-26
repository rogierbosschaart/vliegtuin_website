import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dropdown-profile-update"
export default class extends Controller {
  static targets = ["menu"]

  toggle() {
    this.menuTarget.classList.toggle("hidden")
  }

}
