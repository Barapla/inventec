import { Controller } from "@hotwired/stimulus"
import { Chart } from 'chart.js/auto'

export default class extends Controller {
  static targets = ["canvas"]
  static values = {
    data: Object
  }
  
  connect() {
    const ctx = this.canvasTarget.getContext('2d')
    const chartData = this.dataValue
    new Chart(ctx, {
      type: 'bar',
      data: chartData
      // ... resto de la configuración
    })
  }
}