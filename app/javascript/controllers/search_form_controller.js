import { Controller } from "@hotwired/stimulus"
import { get } from '@rails/request.js'

export default class extends Controller {
  static targets = [ "input", "category", "loading", "searchIcon" ]

  static values = {
    url: String,
    searchTerm: String,
  };

  connect() {
    addEventListener("turbo:before-render", (event) => {
      this._updateCategory()
    });

  }

  _updateCategory() {
    if( ["/products", "/products/"].includes(document.location.pathname) ){
      let url = new URL(document.location);

      if(url.searchParams.get("category")){
        this.categoryTarget.value = url.searchParams.get("category")
      } else {
        this.categoryTarget.value = ""
      }
    }

  }
  
  search() {
    this.loadingTarget.classList.remove("hidden")
    this.searchIconTarget.classList.add("hidden")
    clearTimeout(this.timeout)
    this.timeout = setTimeout(() => {
      this._fetchNewPage();
    }, 700)
  }

    
  async _fetchNewPage() {
    const url = new URL(this.urlValue);

    if (this.inputTarget.value){
      url.searchParams.set('search_term', this.inputTarget.value)
    }

    if (this.categoryTarget.value) {
      url.searchParams.set('category', this.categoryTarget.value)
    }
    
    await get(url.toString(), {
      responseKind: 'turbo-stream'
    });
    this.loadingTarget.classList.add("hidden")
    this.searchIconTarget.classList.remove("hidden")
    history.replaceState(history.state, '', url);
  }
    
}