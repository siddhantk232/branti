import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ["modal", "menu"];
  static values = {
    song: Number
  };

  connect() {}

  click(e) {
    e.preventDefault();
    this.menuTarget.classList.toggle("hidden");
    this.modalTarget.classList.toggle("hidden");
  }

  close() {
    this.modalTarget.classList.toggle("hidden");
  }
}
