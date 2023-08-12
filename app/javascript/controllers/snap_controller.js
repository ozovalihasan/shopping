import { Controller } from "@hotwired/stimulus"
import { Turbo } from "@hotwired/turbo-rails";

export default class extends Controller {
  static targets = ["previousButton","container", "nextButton"]

  connect() {
    this.scroll = this.scroll.bind(this);

    this.containerTarget.addEventListener("scroll", this.scroll);
    this.scroll();
  }

  disconnect(){
    this.containerTarget.removeEventListener("scroll", this.scroll);
  }

  scroll() {
    if(this.containerTarget.scrollLeft === 0){
      this.previousButtonTarget.classList.add("hidden")
    } else {
      this.previousButtonTarget.classList.remove("hidden")
    }

  }

  goToNextPart() {
    if(this.containerTarget.scrollLeft === this.containerTarget.scrollLeftMax){
      this.containerTarget.scrollLeft = 0
    } else {
      this.containerTarget.scrollLeft += this.containerTarget.clientWidth
    }
  }

  goToPreviousPart() {
    this.containerTarget.scrollLeft -= this.containerTarget.clientWidth
  }

}