import { Controller } from "stimulus";
export default class extends Controller {
  static targets = ["showOptionsLink", "hideOptionsLink", "filterOptions"];

  search() {
    this.element.requestSubmit();
  }

  searchWithTimeout() {
    clearTimeout(this.timeout);
    this.timeout = setTimeout(() => {
      this.search();
    }, 200);
  }

  show(event) {
    event.preventDefault();
    event.stopImmediatePropagation();
    this.showOptionsLinkTarget.classList.add("d-none");
    this.hideOptionsLinkTarget.classList.remove("d-none");
    this.filterOptionsTargets.forEach((target) => {
      target.classList.remove("d-none");
    });
  }

  hide(event) {
    event.preventDefault();
    event.stopImmediatePropagation();
    this.showOptionsLinkTarget.classList.remove("d-none");
    this.hideOptionsLinkTarget.classList.add("d-none");
    this.filterOptionsTargets.forEach((target) => {
      target.classList.add("d-none");
    });
  }
}
