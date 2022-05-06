import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="playlist"
export default class extends Controller {
  connect() {}

  submit() {
    console.log("submit");
    this.element.submit();
  }
}
