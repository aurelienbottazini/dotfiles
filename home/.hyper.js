module.exports = {
  config: {
    // default font size in pixels for all tabs
    // normal
    // fontSize: 14,
    // presentation
    fontSize: 18,

    // font family with optional fallbacks
    fontFamily:
      '"PragmataPro Liga", "Operator Mono", Menlo, "DejaVu Sans Mono", "Lucida Console", monospace',

    // terminal cursor background color and opacity (hex, rgb, hsl, hsv, hwb or cmyk)
    // cursorColor: "rgba(148, 191, 243, 0.7)",
    // cursorColor: 'transparent',

    // `BEAM` for |, `UNDERLINE` for _, `BLOCK` for █
    cursorShape: "BLOCK",

    // color of the text
    foregroundColor: "#000000",

    // terminal background color
    backgroundColor: "#ffffff",

    // border color (window, tabs)
    borderColor: "#777",

    // custom css to embed in the main window
    css: ".term_fit { padding: 0.1em 0.1em !important }",

      webGLRenderer: false,
    // custom css to embed in the terminal window
    termCSS:
      `
  x-screen x-row {
    font-variant-ligatures: initial;
  }
`,

    // custom padding (css format, i.e.: `top right bottom left`)
    padding: "12px 14px",

    // the full list. if you're going to provide the full color palette,
    // including the 6 x 6 color cubes and the grayscale map, just provide
    // an array here instead of a color map object
    colors: {
      black: "#505050",
      red: "#c91b00",
      green: "#00c200",
      yellow: "#c7c400",
      blue: "#0225c7",
      magenta: "#ca30c7",
      cyan: "#00c5c7",
      white: "#c7c7c7",
      lightBlack: "#686868",
      lightRed: "#ff6e67",
      lightGreen: "#4ac250",
      lightYellow: "#ffa94a",
      lightBlue: "#6871ff",
      lightMagenta: "#ff77ff",
      lightCyan: "#3c9e9f",
      lightWhite: "#ffffff"
    },

    // ffffff shell to run when spawning a new session (i.e. /usr/local/bin/fish)
    // if left empty, your system's login shell will be used by default
    shell: "",

    // for setting shell arguments (i.e. for using interactive shellArgs: ['-i'])
    // by default ['--login'] will be used
    shellArgs: ["--login"],

    // for environment variables
    env: {},

    // set to false for no bell
    bell: "SOUND",

    // if true, selected text will automatically be copied to the clipboard
    copyOnSelect: false,

    // URL to custom bell
    // bellSoundURL: 'http://example.com/bell.mp3',

    // for advanced config flags please refer to https://hyperterm.org/#cfg

    modifierKeys: {
      cmdIsMeta: true,
      altIsMeta: false
    },

    hypertermCrosshair: {
      color: "rgba(255, 255, 255, 0.1)"
    }
  },

  // a list of plugins to fetch and install from npm
  // format: [@org/]project[#version]
  // examples:
  //   `hyperpower`
  //   `@company/project`
  //   `project#1.0.1`
  plugins: ['hyper-font-ligatures']

  // in development, you can create a directory under
  // `~/.hyperterm_plugins/local/` and include it here
  // to load it and avoid it being `npm install`ed
  // localPlugins: ['hyperterm-crosshair']
  // localPlugins: []
};
