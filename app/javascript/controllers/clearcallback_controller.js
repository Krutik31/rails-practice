import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "hideable" ]

  connect() {
  }
  clear() {
    this.hideableTargets.forEach(el => {
      el.hidden = true
    });
  }
}
