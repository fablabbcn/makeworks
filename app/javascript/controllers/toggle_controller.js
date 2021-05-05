import { Controller } from "stimulus"

/*
 *
 * Usage:
 *
 * <a href="#" data-controller="toggle" data-action="click->toggle#toggle" data-toggle-css-class="active">
 *   Toggle
 * </a>
 */
export default class extends Controller {
  toggle(e) {
    e.preventDefault();
    this.element.classList.toggle(this.cssClass);
  }

  get cssClass() {
    return this.data.get("cssClass");
  }
}
