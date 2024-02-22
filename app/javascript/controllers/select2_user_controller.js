import { Controller } from "stimulus";

export default class extends Controller {
  connect() {
    $(this.element).select2({
      width: "100%",
      placeholder: "Search users",
      allowClear: true,
      ajax: {
        delay: 100,
        url: "/users.json",
        dataType: "json",
        data: function (params) {
          var query = {
            q: {
              first_name_or_last_name_or_slug_cont: params.term,
            },
            page: params.page || 1,
          };
          return query;
        },

        processResults: function (data, params) {
          //console.log(data);
          return {
            results: data,
            pagination: {
              more: data.length > 0,
            },
          };
        },
      },

      templateResult: function (item) {
        //console.log(item)
        var $final = $(
          "<div>" +
            '<img src="' +
            item.avatar +
            '" class="avatar-small mr-2" />' +
            '<span class="ms-2">' +
            item.name +
            "</span> " +
            '<small class="text-muted">@' +
            item.slug +
            "</small>" +
            "</div>"
        );

        return $final;
      },

      templateSelection: function (item) {
        //console.log(item)
        return item.text || item.first_name || "Sea";
      },
    });
  }

  disconnect() {
    $(this.element).select2("destroy");
  }
}
