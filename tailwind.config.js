/** @type {import('tailwindcss').Config} */
const colors = require('tailwindcss/colors')

const setVar = (str) => {

  return {
    50: `var(--${str}-50)`,
   100: `var(--${str}-100)`,
   200: `var(--${str}-200)`,
   300: `var(--${str}-300)`,
   400: `var(--${str}-400)`,
   500: `var(--${str}-500)`,
   600: `var(--${str}-600)`,
   700: `var(--${str}-700)`,
   800: `var(--${str}-800)`,
   900: `var(--${str}-900)`
  }
}

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
      slate: colors.slate,
      white: colors.white,
      gray: colors.gray,
      first: setVar("first"),
      second: colors.indigo,
      third: colors.yellow,
      fourth: colors.slate,
      danger: colors.red,
    },
  },
  plugins: [
    require('@tailwindcss/line-clamp'),
  ],
}
