import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable";
// Connects to data-controller="notification-subscription"
export default class extends Controller {
  static values = { notificationId: Number, currentUserId: Number }
  static targets = ["heart"]
  connect() {
     this.subscription = createConsumer().subscriptions.create(
       { channel: "NotificationChannel", id: this.currentUserIdValue },
       { received: (data) => {
        this.heartTarget.classList.add("red");
       }}
     );
        console.log(
          `Subscribe to the notifcation ${this.notificationIdValue}.`
        );
  }
}
