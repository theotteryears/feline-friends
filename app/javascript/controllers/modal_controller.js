import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ["modal"]
  connect() {
  }
    open(event) {
    event.preventDefault();
    this.modalTarget.showModal();
  }
  close(event) {
    event.preventDefault();
    this.modalTarget.close();
  }
}
