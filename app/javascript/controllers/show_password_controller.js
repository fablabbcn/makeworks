import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "password", "theicon" ]

  connect() {
    //console.log('connected')
    //console.log(this.passwordTarget)
  }

  toggle(e) {
    //console.log(e)
    this.theiconTarget.classList.toggle('bi-eye-slash');
    this.theiconTarget.classList.toggle('bi-eye');

    if (this.passwordTarget.type === "password") {
      this.passwordTarget.type = "text";
    } else {
      this.passwordTarget.type = "password";
    }

  }
}
