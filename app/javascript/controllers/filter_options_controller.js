import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "input", "option" ]

  handleInput() {
    this.optionTargets.forEach((option) => {
      if (this.inputTarget.value === "" || option.checked || option.labels[0].textContent.toLowerCase().includes(this.inputTarget.value.toLowerCase())){
        option.parentElement.classList.remove("hidden");
      } else {
        option.parentElement.classList.add("hidden");
      }
    })  
    
  }
}