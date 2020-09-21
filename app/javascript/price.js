if (document.URL.match(/new/) || document.URL.match(/edit/)) {

  window.addEventListener("load", () => {
    const priceItem = document.getElementById("item-price");
    const addTaxPrice = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");

    

    priceItem.addEventListener("input", () => {
      const price = document.getElementById("item-price").value
      const price1 = price * 0.05
      const price2 = price * 0.95
      addTaxPrice.innerHTML = Math.floor(price1, 0.1);
      profit.innerHTML = Math.floor(price2, 0.1);
    });
  });
}
