const hoverImages = document.querySelectorAll(".hover-image");

hoverImages.forEach((image) => {
  const originalSrc = image.getAttribute("src");
  const hoverSrc = image.getAttribute("data-hover-src");

  image.addEventListener("mouseover", () => {
    image.setAttribute("src", hoverSrc);
  });

  image.addEventListener("mouseout", () => {
    image.setAttribute("src", originalSrc);
  });
});
