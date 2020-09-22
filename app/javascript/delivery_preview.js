window.addEventListener("load", () => {

  const deliveryPreview = document.getElementById("delivery-preview");
  const deliveryList = document.getElementById("delivery-list");

  deliveryPreview.addEventListener("mouseover", () => {
    deliveryPreview.setAttribute("style", "background-color: rgb(207, 207, 207);")
  })

  deliveryPreview.addEventListener("mouseout", () => {
    deliveryPreview.removeAttribute("style", "background-color: rgb(207, 207, 207);")
  })

  deliveryPreview.addEventListener("click", () => {
    
    if (deliveryList.getAttribute("style") == "display: block;") {
      deliveryList.removeAttribute("style", "display: block;")
    } else {
      deliveryList.setAttribute("style", "display: block;")
    }
    
  })

})