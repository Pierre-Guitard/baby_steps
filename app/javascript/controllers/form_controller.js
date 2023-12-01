import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form"
export default class extends Controller {
  static targets = ["eventfield", "baby", "input"]
  connect() {
  }
  sendBabyId() {
    this.eventfieldTarget.classList.toggle("d-none")
    this.inputTarget.value = this.babyTarget.dataset.baby

  }
}
