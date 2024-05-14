import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = ["icon"];
  connect() {
    if (this.isCurrentPage()) {
      this.highlightIcon();
    }
  }
  isCurrentPage() {
    return window.location.pathname === this.element.dataset.path;
  }

  highlightIcon() {
    this.iconTarget.classList.add("active");
  }
}
