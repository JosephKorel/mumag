import type { Config } from "tailwindcss";

const config: Config = {
  content: [
    "./src/pages/**/*.{js,ts,jsx,tsx,mdx}",
    "./src/components/**/*.{js,ts,jsx,tsx,mdx}",
    "./src/app/**/*.{js,ts,jsx,tsx,mdx}",
  ],
  theme: {
    extend: {
      backgroundImage: {
        "gradient-radial": "radial-gradient(var(--tw-gradient-stops))",
        "gradient-conic":
          "conic-gradient(from 180deg at 50% 50%, var(--tw-gradient-stops))",
      },
    },
  },
  daisyui: {
    themes: [
      {
        mytheme: {
          primary: "#dc2832",

          secondary: "#00bc00",

          accent: "#00d9ff",

          neutral: "#090c08",

          "base-100": "#f2ffff",

          info: "#00a0ff",

          success: "#7fa400",

          warning: "#d5a600",

          error: "#ff748f",
        },
      },
    ],
  },
  plugins: [require("daisyui")],
};

export default config;
