import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form"
export default class extends Controller {
  static targets = ["eventfield", "baby", "input"]
  connect() {
  }
  sendBabyId(event) {
    this.eventfieldTarget.classList.toggle("d-none")
    console.log("BabyTarget", event.target.dataset.baby);
    this.inputTarget.value = event.target.dataset.baby
    console.log("inputTargetValue", this.inputTarget.value);
  }
}
