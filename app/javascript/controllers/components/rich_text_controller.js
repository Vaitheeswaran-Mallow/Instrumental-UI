import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = [""];

  static values = {};

  connect() {
    var fa_style = "fa-solid";

    var field_container = this.element.closest(".rich-text-container");
    var trix_toolbar = field_container.querySelector("trix-toolbar");

    var button_bold = trix_toolbar.querySelector(".trix-button--icon-bold");
    button_bold.innerHTML = "<i class='" + fa_style + " fa-bold'></i>";

    var button_italic = trix_toolbar.querySelector(".trix-button--icon-italic");
    button_italic.innerHTML = "<i class='" + fa_style + " fa-italic'></i>";

    var button_strike = trix_toolbar.querySelector(".trix-button--icon-strike");
    button_strike.innerHTML =
      "<i class='" + fa_style + " fa-strikethrough'></i>";

    var button_link = trix_toolbar.querySelector(".trix-button--icon-link");
    button_link.innerHTML = "<i class='" + fa_style + " fa-link'></i>";

    var button_heading = trix_toolbar.querySelector(
      ".trix-button--icon-heading-1"
    );
    button_heading.innerHTML = "<i class='" + fa_style + " fa-heading'></i>";

    var button_quote = trix_toolbar.querySelector(".trix-button--icon-quote");
    button_quote.innerHTML = "<i class='" + fa_style + " fa-quote-left'></i>";

    var button_code = trix_toolbar.querySelector(".trix-button--icon-code");
    button_code.innerHTML = "<i class='" + fa_style + " fa-code'></i>";

    var button_bullet_list = trix_toolbar.querySelector(
      ".trix-button--icon-bullet-list"
    );
    button_bullet_list.innerHTML = "<i class='" + fa_style + " fa-list'></i>";

    var button_number_list = trix_toolbar.querySelector(
      ".trix-button--icon-number-list"
    );
    button_number_list.innerHTML =
      "<i class='" + fa_style + " fa-list-ol'></i>";

    var button_decrease_nesting = trix_toolbar.querySelector(
      ".trix-button--icon-decrease-nesting-level"
    );
    button_decrease_nesting.innerHTML =
      "<i class='" + fa_style + " fa-outdent'></i>";

    var button_increase_nesting = trix_toolbar.querySelector(
      ".trix-button--icon-increase-nesting-level"
    );
    button_increase_nesting.innerHTML =
      "<i class='" + fa_style + " fa-indent'></i>";

    var button_attach = trix_toolbar.querySelector(".trix-button--icon-attach");
    button_attach.innerHTML = "<i class='" + fa_style + " fa-paperclip'></i>";

    var button_undo = trix_toolbar.querySelector(".trix-button--icon-undo");
    button_undo.innerHTML = "<i class='" + fa_style + " fa-rotate-left'></i>";

    var button_redo = trix_toolbar.querySelector(".trix-button--icon-redo");
    button_redo.innerHTML = "<i class='" + fa_style + " fa-rotate-right'></i>";
  }

  focus(event) {
    var compact_container = event.target.closest(".compact-rich-text");
    if (compact_container) {
      compact_container.classList.add("focused");
    }
  }

  unfocus(event) {
    var compact_container = event.target.closest(".compact-rich-text");
    if (compact_container) {
      compact_container.classList.remove("focused");
    }
  }
}
