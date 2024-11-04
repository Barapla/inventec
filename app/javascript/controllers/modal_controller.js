// app/javascript/controllers/modal_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    document.body.style.overflow = 'hidden'
  }

  disconnect() {
    document.body.style.overflow = ''
  }

  close() {
    this.element.remove()
  }

  handleSubmit(event) {
    if (event.detail.success) {
      this.close()
    }
  }
}