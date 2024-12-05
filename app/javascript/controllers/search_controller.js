import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["query"]
  static values = { url: String }

  connect() {
    // Opcional: Puedes agregar inicialización aquí si es necesario
  }

  perform(event) {
    event.preventDefault()
    const query = this.queryTarget.value
    const searchURL = new URL(this.urlValue)
    
    // Agregar el parámetro de búsqueda a la URL
    searchURL.searchParams.set('query', query)

    // Hacer la petición con Turbo
    fetch(searchURL, {
      headers: {
        "Accept": "text/vnd.turbo-stream.html"
      }
    })
    .then(response => response.text())
    .then(html => {
      Turbo.renderStreamMessage(html)
    })
  }

  // Opcional: Búsqueda en tiempo real mientras el usuario escribe
  search(event) {
    clearTimeout(this.timeout)
    this.timeout = setTimeout(() => {
      this.perform(event)
    }, 300)
  }
}