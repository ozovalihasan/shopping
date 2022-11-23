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
  };

  static targets = [ "loading" ]

  initialize() {
    this.scroll = this.scroll.bind(this);
    this.currentPageValue = this.currentPageValue || 1;
  }

  connect() {
    document.addEventListener("scroll", this.scroll);
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
    if (this.searchTermValue){
      url.searchParams.set('search_term', this.searchTermValue)
    }
    if (this.categoryIdValue){
      url.searchParams.set('category', this.categoryIdValue)
    }
 
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