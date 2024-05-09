import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="match"
export default class extends Controller {
  static targets = ["heart", "next"]

  next(event) {
    console.log(event);
    // if d-none
    //  this.nextTarget.classList.toggle("d-none");
    //  console.log(this.nextTarget);
     const catId = event.target.dataset.id
     const nextCatId = parseInt(catId) + 1
     document.getElementById(`${nextCatId}`).classList.toggle("d-none");
     document.getElementById(`${catId}`).classList.toggle("d-none");
  }
}
