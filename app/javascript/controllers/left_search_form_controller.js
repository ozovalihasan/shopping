import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "form", "category" ]

  connect() {
   this._setCategory()  
  }

  _setCategory() {
    this.categoryTarget.value = ""
  }
  
  search() {
    clearTimeout(this.timeout)
    this.timeout = setTimeout(() => {
      this.element.style.opacity = 0.5
      this.formTarget.requestSubmit();
    }, 700)
  }

  removeOpacity(){
    this.element.style.opacity = 1
  }
}