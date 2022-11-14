import { Controller } from "@hotwired/stimulus";
import { get } from '@rails/request.js'

export default class extends Controller {
  static values = {
    url: String,
    page: Number,
    maxPage: Number,
    request: Boolean,
    searchTerm: String,
    category: Number,
  };

  static targets = [ "loading" ]

  initialize() {
    this.scroll = this.scroll.bind(this);
    this.pageValue = this.pageValue || 1;
  }

  connect() {
    document.addEventListener("scroll", this.scroll);
  }

  disconnect(){
    document.removeEventListener("scroll", this.scroll);
  }

  scroll() {
    
    if (!this.requestValue && this.pageValue <= this.maxPageValue && this.scrollReachedEnd ) {
      this._fetchNewPage();
    }
  }

  async _fetchNewPage() {
    const url = new URL(this.urlValue);
    url.searchParams.set('page', this.pageValue)
    if (this.searchTermValue){
      url.searchParams.set('search_term', this.searchTermValue)
    }
    if (this.categoryValue){
      url.searchParams.set('category', this.categoryValue)
    }
 
    this.requestValue = true;
    await get(url.toString(), {
      responseKind: 'turbo-stream'
    });
    if ( this.pageValue === this.maxPageValue ){
      this.loadingTarget.classList.add("hidden");  
    }
    
    this.requestValue = false;
    
    this.pageValue += 1;

  }
    

  get scrollReachedEnd() {
      const { scrollHeight, scrollTop, clientHeight } = document.documentElement;
      const distanceFromBottom = scrollHeight - scrollTop - clientHeight;
      return distanceFromBottom < 50;
  }
}