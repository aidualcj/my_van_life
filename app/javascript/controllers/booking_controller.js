import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="booking"
export default class extends Controller {
  connect() {
  }
  calculateTotalPrice() {

    const startDate = this.startDateTarget.value;
    console.log(startDate);
    const endDate = this.endDateTarget.value;
    const pricePerDay = parseFloat(this.data.get("pricePerDay"));


    if (startDate && endDate) {
      const start = new Date(startDate);
      const end = new Date(endDate);
      const timeDiff = end - start;
      const daysDiff = timeDiff / (1000 * 3600 * 24) + 1;

      if (daysDiff > 0) {
        const totalPrice = daysDiff * pricePerDay;
        this.totalPriceTarget.innerText = `Prix Total: €${totalPrice.toFixed(2)}`;
      } else {
        this.totalPriceTarget.innerText = 'Prix Total: €0';
      }
    }
  }

  updateTotalPrice() {
    this.calculateTotalPrice();
  }
}
