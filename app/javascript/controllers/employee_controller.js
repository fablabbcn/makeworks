import { Controller } from "stimulus"
import Rails from "@rails/ujs";

export default class extends Controller {
  static targets = [ "role", "title" ]
  static values = { userid: Number }

  connect() {
    //console.log(this.roleTarget.dataset)
  }

  updateRole(event){
    let data = new FormData()
    data.append("role", this.roleTarget.value)
    data.append("title", this.titleTarget.value)
    data.append("user", this.useridValue)

    Rails.ajax({
      type: "PATCH",
      url: this.data.get("url"),
      data: data,
      success: function(response){
        console.log(response)
      },
      error: function(err){
        console.log(err)
      }
    })
  }

  disconnect() {
    //console.log('disconnect')
  }
}
