import { Controller } from 'stimulus'
import Rails from "@rails/ujs"

export default class extends Controller {
  static targets = ["entries", "pagination"]

  scroll() {
    let next_page = this.paginationTarget.querySelector("a[rel='next']")

    if(next_page == null) { return }

    let url = next_page.url

    var body = document.body,
      html = document.documentElement
    var height = Math.max(body.scrollHeight, body.offsetHeight, html.clientHeight, html.scrollHeight, html.offsetHeight)

    console.log(Math.round(window.pageYOffset), height - window.innerHeight)
    if(Math.round(window.pageYOffset) == height - window.innerHeight) {
      console.log("loading more")
      this.loadMore(url)
    }
  }

  loadMore(url) {
    Rails.ajax({
      type: 'GET',
      url: url,
      dataType: 'json',
      success: (data) => {
        this.entriesTarget.insertAdjacentHTML('beforeend', data.entries)
        this.paginationTarget.innerHTML	= data.pagination
      }
    })
  }
}
