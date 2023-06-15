import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "input", "loading", "searchIcon", "brand", "category", "leftInput", "form" ]

  static values = {
    url: String,
    searchTerm: String,
  };

  connect() {
    this._setInput()
    this._setLeftSearchForm()
  }

  _setInput() {
    if( ["/products", "/products/"].includes(document.location.pathname) ){
      let url = new URL(document.location);

      if ( this.hasInputTarget ){
        this.inputTarget.value = url.searchParams.get("search_term")
      }
    }

  }

  _setLeftSearchForm() {
    if( 
      ["/products", "/products/"].includes(document.location.pathname) 
    ){
      const urlParams = new URLSearchParams(window.location.search);

      this.leftInputTarget.value = urlParams.get('search_term');
      this.categoryTarget.value = urlParams.get('category_id') || "";

      const brandValues = urlParams.getAll('brand_ids[]');
      this.brandTargets.forEach((brandElement) => {
        if (brandValues.includes(brandElement.value)) {
          brandElement.checked = true;
        }
      });
    }
  }
  
  search() {
    clearTimeout(this.timeout)
    this.timeout = setTimeout(() => {
      this.loadingTarget.classList.remove("hidden");
      this.searchIconTarget.classList.add("hidden");
      this.formTarget.requestSubmit();
    }, 700)
  }


  hideSpinner() {
    this.loadingTarget.classList.add("hidden")
    this.searchIconTarget.classList.remove("hidden")
  }
    
}