console.log("Hello, D3.js!");

const svg = document.querySelector("svg");
const namespace = "http://www.w3.org/2000/svg";

const rect = document.createElementNS(namespace, "rect");
const height = 40;
const gap = 10;

for (let i = 0; i < 5; i++) {
    rect.setAttribute("x", 10);
    rect.setAttribute("y", gap + (height + gap) * i);
    rect.setAttribute("width", 600);
    rect.setAttribute("height", height);
    svg.appendChild(rect.cloneNode());
}