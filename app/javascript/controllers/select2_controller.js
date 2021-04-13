import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
    $(this.element).select2({'width': '100%'})
  }

  disconnect() {
    $(this.element).select2('destroy')
  }
}
