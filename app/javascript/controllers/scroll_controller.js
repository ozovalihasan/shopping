import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "navbar", "tab"]

  scrollNow(){
    this.tabTarget.style.setProperty("scroll-margin-top", `${this.navbarTarget.offsetHeight}px`);  
    this.tabTarget.scrollIntoView({behavior: "smooth", block: "start"});
  }
    
}