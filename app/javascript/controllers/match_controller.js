import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="match"
export default class extends Controller {
  static targets = ["heart", "next"]
  connect() {
    console.log("Hello, Stimulus!", this.element);
  }

  heart() {
    console.log("Hearted!");
    this.heartTarget.classList.toggle("d-none");

  }

  next(event) {
    console.log(event);
    // if d-none
    //  this.nextTarget.classList.toggle("d-none");
    //  console.log(this.nextTarget);
     console.log(this.nextTarget.classList.contains("d-none"));
     const catId = event.target.dataset.id
     const nextCatId = parseInt(catId) + 1
     console.log(nextCatId);
     console.log(document.getElementById(`${nextCatId}`));
     document.getElementById(`${nextCatId}`).classList.toggle("d-none");
     document.getElementById(`${catId}`).classList.toggle("d-none");
  }
}
