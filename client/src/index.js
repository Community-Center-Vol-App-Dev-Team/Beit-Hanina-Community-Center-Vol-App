import React from "react";
import { createRoot } from "react-dom/client";
// import { BrowserRouter } from "react-router-dom"; 
import "./App.css";
// import App from "./App";
import { I18nextProvider } from "react-i18next";
import i18n from "./config/i18n";
import AppRouter from "./AppRouter";
import { ThemeProvider } from "./config/options/Colors";

const container = document.getElementById("root");
const root = createRoot(container);

root.render(
  <React.StrictMode>
    <I18nextProvider i18n={i18n}>
      <ThemeProvider>
        <AppRouter />
      </ThemeProvider>
    </I18nextProvider>
  </React.StrictMode>
);

// Register the service worker
if ("serviceWorker" in navigator) {
  window.addEventListener("load", () => {
    navigator.serviceWorker
      .register("/service-worker.cjs")
      .then((registration) => {
        console.log("SW registered: ", registration);
      })
      .catch((registrationError) => {
        console.log("SW registration failed: ", registrationError);
      });
  });
}
