import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["quantity", "increaseButton", "decreaseButton"]

  connect() {
    _checkButtons();
  }

  increase(e) {
    e.preventDefault();
    this.quantityTarget.stepUp();
    this._submit();
    this._checkButtons();
  }

  submitForm(e){
    this._submit();
    this._checkButtons();
  }
  
  decrease(e) {
    e.preventDefault();
    this.quantityTarget.stepDown();
    this._submit();
    this._checkButtons();
  }

  _updateQuantity(val) {
    this.quantityTarget.value = parseInt(val);
  }
  
  _submit() {
    clearTimeout(this.timeout);
    this.timeout = setTimeout(() => {
      this.element.requestSubmit()
    }, 700);
  }

  _checkButtons() {
    this._checkDecreaseButton();
    this._checkIncreaseButton();
  }

  _checkIncreaseButton() {
    if (parseInt(this.quantityTarget.value) >= parseInt(this.quantityTarget.attributes.max.nodeValue)){
      this.increaseButtonTarget.disabled = true
    } else {
      this.increaseButtonTarget.disabled = false
    };
  }

  _checkDecreaseButton() {
    if (parseInt(this.quantityTarget.value) <= 1 ){
      this.decreaseButtonTarget.disabled = true
    } else {
      this.decreaseButtonTarget.disabled = false
    };
  }
}