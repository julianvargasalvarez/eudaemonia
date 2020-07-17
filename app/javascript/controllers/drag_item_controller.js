import { Controller } from 'stimulus'
import Rails from "@rails/ujs"

export default class extends Controller {
  dragstart(event) {
    event.dataTransfer.setData("application/drag-element", event.target.outerHTML)
    event.dataTransfer.setData("application/drag-id", event.target.getAttribute("data-candidate-id"))
    event.dataTransfer.effectAllowed = "move"
    event.target.className += ' hold';
    setTimeout(() => (event.target.className = 'invisible'), 0);
  }

  dragover(event) {
    event.preventDefault()
    return true
  }
  
  dragenter(event) {
    event.preventDefault()
    this.element.className += ' hovered'
  }

  dragleave(event) {
    this.element.className = 'drag-item'
  }
  
  drop(event) {
    this.element.className = 'drag-item'
    var data = event.dataTransfer.getData("application/drag-element")
    this.element.insertAdjacentHTML('afterbegin', data)
    let form = this.element.querySelector(".candidate form")
    form.submit()
    event.preventDefault()
  }
  
  dragend(event) {
    event.target.outerHTML = ""
  }
}
