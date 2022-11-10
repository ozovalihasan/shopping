import { Controller } from "@hotwired/stimulus"
import { get } from '@rails/request.js'

export default class extends Controller {
  static targets = [ "input", "category", "loading", "searchIcon" ]

  static values = {
    url: String,
    searchTerm: String,
  };

  connect() {
    this._updateCategory()
  }

  _updateCategory() {
    if( ["/products", "/products/"].includes(document.location.pathname) ){
      let url = new URL(document.location);

      this.categoryTarget.value = url.searchParams.get("category") || ""
      this.inputTarget.value = url.searchParams.get("search_term")
    }

  }
  
  search() {
    
    
    clearTimeout(this.timeout)
    this.timeout = setTimeout(() => {
      this.loadingTarget.classList.remove("hidden");
      this.searchIconTarget.classList.add("hidden");
      this.element.requestSubmit();
    }, 700)
  }


  hideSpinner() {
    this.loadingTarget.classList.add("hidden")
    this.searchIconTarget.classList.remove("hidden")
  }
    
}