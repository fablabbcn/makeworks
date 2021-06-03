import { Controller } from "stimulus"

export default class extends Controller {

  connect() {
    console.log('select2machines connect')
    /*
      // TODO: use AJAX to search instead of loading all 1500 items.
      // Change packs/application.js to target '.select2' instead of all 'select'?
      // All other select boxes need to specify a '.select2' class
      // Or remove and call a global  'data-controller': 'select2' instead? <--
      // user/form select currency
      //

    */
    $(this.element).select2({
    'width': '100%'
    })
  }

  disconnect() {
    console.log('select2machines destroy')
    $(this.element).select2('destroy')
  }
}
