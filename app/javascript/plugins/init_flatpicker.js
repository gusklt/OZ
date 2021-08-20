import flatpickr from "flatpickr";

const dateForm = document.getElementById('booking_date')

const calendar = () => {
  if  (dateForm) {
    flatpickr(dateForm, {
      minDate: "today"
    });
  }
}


export { calendar };
