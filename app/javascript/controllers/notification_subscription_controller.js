import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable";
// Connects to data-controller="notification-subscription"
export default class extends Controller {
  static values = { notificationId: Number, currentUserId: Number }
  static targets = ["heart"]
  connect() {
    console.log(createConsumer().subscriptions)
     this.subscription = createConsumer().subscriptions.create(
       { channel: "NotificationChannel", id: this.currentUserIdValue },
       { received: (data) => {
        console.log(data);
        // console.log(document)
        document.querySelector("body").insertAdjacentHTML("beforeend", data);
        this.heartTarget.classList.add("red");
       }}
     );
        console.log(
          `Subscribe to the notification ${this.notificationIdValue}.`
        );
  }

  disconnect() {
    this.subscription.unsubscribe()
  }

}
