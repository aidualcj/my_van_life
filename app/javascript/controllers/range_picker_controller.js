import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="range-picker"
export default class extends Controller {
  connect() {
    flatpickr(this.element, {
      mode: "range"
    });
  }
}
