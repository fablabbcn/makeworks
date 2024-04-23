import { Controller } from "stimulus";
export default class extends Controller {
  connect() {
    let originalMatcher = $.fn.select2.defaults.defaults.matcher;
    // This is deeply unsatisfactory, but needed in order to properly normalise
    // the additional aliases when matching, see:
    // https://stackoverflow.com/questions/35557486/select2-custom-matcher-but-keep-stripdiacritics
    let stripDiacritics = undefined;
    $.fn.select2.amd.require(['select2/diacritics'], function (DIACRITICS) {
      stripDiacritics = (text) => {
        function match(a) {
          return DIACRITICS[a] || a;
        }
        return text.replace(/[^\u0000-\u007E]/g, match);
      };
    });
    let aliasMatcher = (params, data) => {
      var alias = data.element.getAttribute("data-aliases");

      if(alias) {
        var aliasNormalised = stripDiacritics(alias).toUpperCase();
        var term = stripDiacritics(params.term).toUpperCase();

        // Check if the text contains the term
        if (aliasNormalised.indexOf(term) > -1) {
          return data;
        }
      }
      return null;
    };

    let combinedMatcher = (params, data) => {
      return originalMatcher(params, data) || aliasMatcher(params, data);
    };

    $(this.element).select2({ width: "100%", matcher: combinedMatcher});
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
