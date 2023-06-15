import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "category", "form", "searchTerm" ]

  static values = {
  
  };

  connect() {
    this._updateInput()
  }

  _updateInput() {
    if( ["/products", "/products/"].includes(document.location.pathname) ){
      const urlParams = new URLSearchParams(window.location.search);

      this.searchTermTarget.value = urlParams.get('search_term');
      this.categoryTarget.value = urlParams.get('category_id');

      const brandIds = urlParams.getAll('brand_ids[]');
      brandIds.forEach((brandId) => {
        const brandInput = document.getElementById(`brand_ids_${brandId}`);
        if (brandInput) {
          brandInput.checked = true;
        }
      });
    }
  }
  
  updateCategory(e) {
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