import { Controller } from "@hotwired/stimulus"
import { Turbo } from "@hotwired/turbo-rails";

export default class extends Controller {
  static targets = [ "navbar"]

  connect() {
    this._setScrollMarginTop();
    document.addEventListener("turbo:visit", this.scrollNow)
  }

  _setScrollMarginTop() {
    this.element.style.setProperty("scroll-margin-top", `${this.navbarTarget.offsetHeight + 50}px`);  
  }

  scrollNow(e){
    if (!(e.type === "turbo:visit") || Turbo.navigator.currentVisit.action === "advance"){
      e.target.scrollIntoView({behavior: "smooth", block: "start"});
    }
  }
}