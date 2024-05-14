import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="rate"
export default class extends Controller {
  static targets = ["rate"]
  connect() {
     console.log("Hello from rate_controller.js");
  }
}
