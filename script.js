document.addEventListener("DOMContentLoaded", function () {
    var header = document.getElementById("sticky-header");
    var sticky = header.offsetTop;
  
    function handleScroll() {
      if (window.pageYOffset > sticky) {
        header.classList.add("fixed");
      } else {
        header.classList.remove("fixed");
      }
    }
  
    window.onscroll = function () {
      handleScroll();
    };
  });
  