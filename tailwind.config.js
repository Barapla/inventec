module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  theme: {
    extend: {
      colors: {
            'midnight-blue': {
            '50': '#eff8ff',
            '100': '#daf0ff',
            '200': '#bee5ff',
            '300': '#91d6ff',
            '400': '#5dbdfd',
            '500': '#379efa',
            '600': '#2180ef',
            '700': '#1969dc',
            '800': '#1b55b2',
            '900': '#1c4a8c',
            '950': '#1b396a',
        },
      }
    }
  },
}
