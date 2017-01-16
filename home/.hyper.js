module.exports = {
  config: {
    // default font size in pixels for all tabs
    fontSize: 14,

    // font family with optional fallbacks
    fontFamily: '"OperatorMono-Medium", PragmataPro, Menlo, "DejaVu Sans Mono", "Lucida Console", monospace',

    // terminal cursor background color and opacity (hex, rgb, hsl, hsv, hwb or cmyk)
    cursorColor: 'rgba(148, 191, 243, 0.7)',
    // cursorColor: 'transparent',

    // `BEAM` for |, `UNDERLINE` for _, `BLOCK` for █
    cursorShape: 'BLOCK',

    // color of the text
    foregroundColor: '#f8f5ed',

    // terminal background color
    backgroundColor: '#3d3d3d',

    // border color (window, tabs)
    borderColor: '#777',

    // custom css to embed in the main window
    css: '.term_fit { padding: 0.1em 0.1em !important }',

    // custom css to embed in the terminal window
    termCSS: '.cursor-node[focus=false] { background-color: transparent !important} x-screen x-row { font-variant-ligatures: initial } span[style="color: rgb(186, 144, 189);"], span[style*="italic"]{ font-family: "Operator Mono"; font-style: italic;}',

    // custom padding (css format, i.e.: `top right bottom left`)
    padding: '12px 14px',

    // the full list. if you're going to provide the full color palette,
    // including the 6 x 6 color cubes and the grayscale map, just provide
    // an array here instead of a color map object
    colors: {
      black: '#505050',
      red: '#d7a5a4',
      green: '#91ad91',
      yellow: '#e8d7b9',
      blue: '#c6eaff',
      magenta: '#ba90bd',
      cyan: '#96ad6d9',
      white: '#f3f1d9',
      lightBlack: '#7f7f7f',
      lightRed: '#e4b3b2',
      lightGreen: '#d4e894',
      lightYellow: '#eff0a5',
      lightBlue: '#6996bf',
      lightMagenta: '#dcbecd',
      lightCyan: '#9ad6d9',
      lightWhite: '#f8f5ed'
    },

    // ffffff shell to run when spawning a new session (i.e. /usr/local/bin/fish)
    // if left empty, your system's login shell will be used by default
    shell: '',

    // for setting shell arguments (i.e. for using interactive shellArgs: ['-i'])
    // by default ['--login'] will be used
    shellArgs: ['--login'],

    // for environment variables
    env: {},

    // set to false for no bell
    bell: 'SOUND',

    // if true, selected text will automatically be copied to the clipboard
    copyOnSelect: false,

    // URL to custom bell
    // bellSoundURL: 'http://example.com/bell.mp3',

    // for advanced config flags please refer to https://hyperterm.org/#cfg

    modifierKeys: {
      cmdIsMeta: true,
      altIsMeta: false,
    },

    hypertermCrosshair: {
      color: 'rgba(255, 255, 255, 0.1)',
    },
  },

  // a list of plugins to fetch and install from npm
  // format: [@org/]project[#version]
  // examples:
  //   `hyperpower`
  //   `@company/project`
  //   `project#1.0.1`
  plugins: [],

  // in development, you can create a directory under
  // `~/.hyperterm_plugins/local/` and include it here
  // to load it and avoid it being `npm install`ed
  // localPlugins: ['hyperterm-crosshair']
  // localPlugins: []
};
