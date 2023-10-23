document.addEventListener("DOMContentLoaded", function () {
  const submitButton = document.getElementById("subscribebutton");
  const form = document.getElementById("subscribeform");
  submitButton.addEventListener("click", (event) => {
    const subscriberEmail = document.getElementById("subscriberEmail").value;
    event.preventDefault();
    $.ajax({
      type: "POST",
      url: "/validation/subscribedEmail",
      data: {
        email: subscriberEmail,
      },
      dataType: "json",
      success: function (response) {
        if (response) {
          swal(
            "Error",
            "Your email is already subscribed to our newsletter!",
            "error"
          );
        } else {
          swal("Success", "Subscribed to our newsletter!", "success");
        }
      },
      error: function () {
        swal("Error", "Error at the moment of checkinssg name!", "error");
      },
    });
  });
});

// document
//   .getElementById("subscribeform")
//   .addEventListener("submit", function (event) {
//     event.preventDefault();
//     const subscriberEmail = document.getElementById("subscriberEmail").value;

//     $.ajax({
//       type: "POST",
//       url: "/validation/subscribedEmail",
//       data: {
//         email: subscriberEmail,
//       },
//       dataType: "json",
//       success: function (response) {
//         if (response) {
//           Swal.fire("Error", "The title is already on use!", "error");
//         } else if (titleValue.length < 5 || titleValue.length > 20) {
//           Swal.fire(
//             "Error",
//             "Title size must have 5 to 20 characters.",
//             "error"
//           );
//         } else if (genreValue.length < 5 || genreValue.length > 20) {
//           Swal.fire(
//             "Error",
//             "Genre size must have 5 to 20 characters.",
//             "error"
//           );
//         } else if (lyricsValue.length < 5 || totalCharactersOfLyrics > 250) {
//           Swal.fire(
//             "Error",
//             "Lyrics size must have 5 to 250 characters.",
//             "error"
//           );
//         } else {
//           event.target.submit();
//         }
//       },
//       error: function () {
//         Swal.fire("Error", "Error at the moment of checking name!", "error");
//       },
//     });
//   });
