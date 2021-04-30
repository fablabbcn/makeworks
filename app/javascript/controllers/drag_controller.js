import { Controller } from "stimulus"
import Sortable from "sortablejs"
import Rails from "@rails/ujs";

export default class extends Controller {

  connect() {
    this.sortable = Sortable.create(this.element, {
      group: 'shared',
      animation: 150,
      onEnd: this.end.bind(this)
    })
  }

  end(event) {
    let id = event.item.dataset.id
    let data = new FormData()
    data.append("position", event.newIndex + 1)
    data.append("user", event.item.dataset.employeeUseridValue)

    Rails.ajax({
      type: "patch",
      url: this.data.get("url"),
      data: data
    })
  }

}
