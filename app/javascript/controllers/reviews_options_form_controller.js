import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "form" ]

  search() {
    this.element.style.opacity = 0.5
    this.formTarget.requestSubmit();
  }
    
  removeOpacity(){
    this.element.style.opacity = 1
  }
}