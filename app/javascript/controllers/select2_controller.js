import { Controller } from "stimulus";

export default class extends Controller {
  connect() {
    $(this.element).select2({ width: "100%" });
    $(this.element).on("select2:select", function () {
      let event = new Event("change", { bubbles: true }); // fire a native event
      this.dispatchEvent(event);
    });
    $(this.element).on("select2:unselect", function () {
      let event = new Event("change", { bubbles: true }); // fire a native event
      this.dispatchEvent(event);
    });
    $(this.element).on("select2:clear", function () {
      let event = new Event("change", { bubbles: true }); // fire a native event
      this.dispatchEvent(event);
    });
  }

  disconnect() {
    $(this.element).select2("destroy");
  }
}
