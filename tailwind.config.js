/** @type {import('tailwindcss').Config} */
const colors = require('tailwindcss/colors')

module.exports = {
  content: [
    './app/components/**/*.html.erb',
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  theme: {
    colors: {
      transparent: 'transparent',
      current: 'currentColor',
      black: colors.black,
      white: colors.white,
      gray: colors.gray,
      first: colors.emerald,
      second: colors.indigo,
      third: colors.yellow,
      fourth: colors.slate,
    },
  },
  plugins: [
    require('@tailwindcss/line-clamp'),
  ],
}
