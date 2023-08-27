window.addEventListener('DOMContentLoaded', () => {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const profitDom = document.getElementById("profit");

  priceInput.addEventListener('input', () => {

    const price = parseFloat(priceInput.value);

    const tax = price * 0.1;

    const profitValue = price - tax;

    addTaxDom.innerHTML = Math.floor(tax);
    profitDom.innerHTML = Math.floor(profitValue);
  });
});