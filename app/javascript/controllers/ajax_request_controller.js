import { Controller } from "stimulus"
import Rails from "@rails/ujs";

/*
 *
 * Usage:
 * <form data-controller="ajax-request" data-ajax-request-url="/sample-path">
 *   <button data-action="click->ajax-request#makeRequest">Make Request</button>
 * </form>
 *
 */
export default class extends Controller {
  makeRequest() {
    Rails.ajax({
      type: "post",
      url: this.data.get('url'),
      data: new FormData(this.element)
    })
  }
}
