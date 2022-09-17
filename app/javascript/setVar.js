import colors from "tailwindcss/colors"

window.setVar = color => {
  const root = document.querySelector(':root');

  localStorage.setItem("selected-color", color)

  const selectedColor = localStorage.getItem("selected-color");

  ["50", "100", "200", "300", "400", "500", "600", "700", "800", "900"].forEach(num => {
    root.style.setProperty(`--first-${num}`, colors[selectedColor][num]);  
  });
}

window.setVar(localStorage.getItem("selected-color") || "yellow")