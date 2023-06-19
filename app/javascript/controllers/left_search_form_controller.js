import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "form", "category", "priceOrder", "searchTerm", "brand" ]

  connect() {
   this._setLeftSearchForm()  
  }

  _setLeftSearchForm() {
    if( 
      ["/products", "/products/"].includes(document.location.pathname) 
    ){
      const urlParams = new URLSearchParams(window.location.search);

      this.searchTermTarget.value = urlParams.get('search_term');
      this.categoryTarget.value = urlParams.get('category_id') || "";
      this.priceOrderTarget.value = urlParams.get('price_order');

      const brandValues = urlParams.getAll('brand_ids[]');
      this.brandTargets.forEach((brandElement) => {
        if (brandValues.includes(brandElement.value)) {
          brandElement.checked = true;
        }
      });
    }
  }
  
  setPriceOrder(e) {
    this.priceOrderTarget.value = e.target.value
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