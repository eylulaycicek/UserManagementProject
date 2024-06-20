// app/javascript/controllers/modal_controller.js
import { Controller } from "stimulus";
import { Modal } from "bootstrap";

export default class extends Controller {
  static targets = ["modal"];

  closeModal() {
    const modal = new Modal(this.modalTarget);
    modal.hide();
  }
}
