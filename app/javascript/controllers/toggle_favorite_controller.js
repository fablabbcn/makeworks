import { Controller } from "stimulus"

export default class extends Controller {
  toggle(e) {
    e.preventDefault();
    this.element.classList.toggle('bi-star');
    this.element.classList.toggle('bi-star-fill');
  }
}
