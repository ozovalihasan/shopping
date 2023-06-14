import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "category", "form" ]

  static values = {
  
  };

  connect() {
  }
  
  updateCategory(e) {
    this.categoryTarget.value = e.target.value
    this.search()
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