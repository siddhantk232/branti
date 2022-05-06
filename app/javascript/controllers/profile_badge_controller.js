import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="profile-badge"
export default class extends Controller {
  static targets = [ "menu" ];

  connect() {
  }

  click(e) {
    e.preventDefault();
    this.menuTarget.classList.toggle("hidden");
  }
}
