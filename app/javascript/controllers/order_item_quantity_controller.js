import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "increaseButton", "decreaseButton"]

  static values = {
    max: Number,
  };

  connect() {
    this._checkButtons();
  }

  increase(e) {
    e.preventDefault();
    this.inputTarget.stepUp();
    this._submit();
    this._checkButtons();
  }

  submitForm(e){
    this._submit();
    this._checkButtons();
  }
  
  decrease(e) {
    e.preventDefault();
    this.inputTarget.stepDown();
    this._submit();
    this._checkButtons();
  }

  _updateQuantity(val) {
    this.inputTarget.value = parseInt(val);
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
    if (parseInt(this.inputTarget.value) >= this.maxValue ){
      this.increaseButtonTarget.disabled = true
    } else {
      this.increaseButtonTarget.disabled = false
    };
  }

  _checkDecreaseButton() {
    if (parseInt(this.inputTarget.value) <= 1 ){
      this.decreaseButtonTarget.disabled = true
    } else {
      this.decreaseButtonTarget.disabled = false
    };
  }
}