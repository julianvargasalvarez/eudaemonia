import { Controller } from 'stimulus'
import Rails from "@rails/ujs"

export default class extends Controller {
  static targets = ["entries", "pagination"]

  scroll() {
    let next_page = this.paginationTarget.querySelector("a[rel='next']")

    if(next_page == null) { return }

    let url = next_page.href

    const { scrollTop, scrollHeight, clientHeight, offsetHeight } = this.element

    if(Math.round(scrollTop) == scrollHeight - clientHeight) {
      this.loadMore(url)
    }
  }

  loadMore(url) {
    Rails.ajax({
      type: 'GET',
      url: url,
      dataType: 'json',
      success: (data) => {
        console.log(this.data.get("entities"), data)
        this.entriesTarget.insertAdjacentHTML('beforeend', data[this.data.get("entities")].entries)
        this.paginationTarget.innerHTML	= data[this.data.get("entities")].pagination
      }
    })
  }
}
