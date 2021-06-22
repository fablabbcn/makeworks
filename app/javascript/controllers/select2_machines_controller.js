import { Controller } from "stimulus"

export default class extends Controller {

  connect() {
    console.log('select2machines connect')

    // TODO: use AJAX to search instead of loading all 1500 items.

    $(this.element).select2({
      'width': '100%'
    })
  }

  disconnect() {
    console.log('select2machines destroy')
    $(this.element).select2('destroy')
  }
}
