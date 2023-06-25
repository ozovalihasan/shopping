import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "form", "rateOption" ]

  search() {
    this.element.style.opacity = 0.5
    this.formTarget.requestSubmit();
  }

  changeRateOption(e) {
    this.rateOptionTarget.value = e.currentTarget.dataset.productReviewRateValue
    this.search();

  }
    
  removeOpacity(){
    this.element.style.opacity = 1
  }
}