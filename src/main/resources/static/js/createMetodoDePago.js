const dateInput = document.getElementById("dateInput");

dateInput.addEventListener("input", function (event) {
  const inputValue = event.target.value;

  if (inputValue.length === 2 && !inputValue.includes("/")) {
    event.target.value = inputValue + "/";
  }
});
