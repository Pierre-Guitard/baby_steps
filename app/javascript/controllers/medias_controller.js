import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="medias"
export default class extends Controller {
  static targets = ["video"]
  connect() {
    console.log('yo');
    console.log("hello", this.videoTarget);
  }
  videofullscreen(event) {
    console.log(event.currentTarget);
    console.log("hello");
    // if (videoTarget.requestFullscreen) {
    //   videoTarget.requestFullscreen();
    // } else if (videoTarget.webkitRequestFullscreen) { /* Safari */
    //   videoTarget.webkitRequestFullscreen();
    // } else if (videoTarget.msRequestFullscreen) { /* IE11 */
    //   videoTarget.msRequestFullscreen();
    // }
  }
}
