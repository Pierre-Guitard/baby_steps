import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="sidebar"
export default class extends Controller {
  static targets = ["sidenav"]
  connect() {
    console.log('hello from connect');
  }
  open() {
    console.log('hello from open');
    this.sidenavTarget.style.width = "100%"
    this.sidenavTarget.classList.remove("d-none")
  }
  close() {
    this.sidenavTarget.style.width = "0"
    this.sidenavTarget.classList.add("d-none")
  }
}
