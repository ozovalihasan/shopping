import { Controller } from "@hotwired/stimulus";
import { get } from '@rails/request.js'

export default class extends Controller {
  static values = {
    url: String,
    currentPage: Number,
    maxPage: Number,
    request: Boolean,
    searchTerm: String,
    categoryId: Number,
    priceOrder: String,
  };

  static targets = [ "loading" ]

  connect() {
    this.scroll = this.scroll.bind(this)
    document.addEventListener("scroll", this.scroll);

    this.currentPageValue = this.currentPageValue || 1;
    if ( this.currentPageValue === this.maxPageValue ){
      this.loadingTarget.classList.add("hidden");  
    }
  }

  disconnect(){
    document.removeEventListener("scroll", this.scroll);
  }

  scroll() {
    
    if (!this.requestValue && this.currentPageValue < this.maxPageValue && this.scrollReachedEnd ) {
      this._fetchNewPage();
    }
  }

  async _fetchNewPage() {
    const url = new URL(this.urlValue);
    url.searchParams.set('page', this.currentPageValue + 1)
    url.searchParams.set('search_term', this.searchTermValue)
    url.searchParams.set('category', this.categoryIdValue)
    url.searchParams.set('price_order', this.priceOrderValue)
 
    this.requestValue = true;
    await get(url.toString(), {
      responseKind: 'turbo-stream'
    });
    this.requestValue = false;
    this.currentPageValue += 1;

    if ( this.currentPageValue >= this.maxPageValue ){
      this.loadingTarget.classList.add("hidden");  
    }
    
    
    

  }
    

  get scrollReachedEnd() {
      const { scrollHeight, scrollTop, clientHeight } = document.documentElement;
      const distanceFromBottom = scrollHeight - scrollTop - clientHeight;
      return distanceFromBottom < 50;
  }
}