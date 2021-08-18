import flatpickr from "flatpickr";

const calendar = () => {
  const dateForm = document.getElementById('booking_date')
  console.log(dateForm);
  flatpickr(dateForm, {
    minDate: "today",
  });
}

export { calendar };
