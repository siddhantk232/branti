module.exports = {
  content: [
    "./app/views/**/*.html.erb",
    "./app/helpers/**/*.rb",
    "./app/assets/stylesheets/**/*.css",
    "./app/javascript/**/*.js",
  ],
  theme: {
    extend: {
      colors: {
        accent: {
          200: "#ed7e65",
          400: "#ee6c4d",
        },
        dark: "#212121",
      },
      fontFamily: {
        rowdies: ["Rowdies", "cursive"],
        montsterrat: ["Montserrat", "sans-serif"],
      },
    },
  },
};
