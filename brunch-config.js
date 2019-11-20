exports.config = {
  // See http://brunch.io/#documentation for docs.
  files: {
    javascripts: {
      joinTo: {
        "js/app.js": /^(assets\/static\/js)|(node_modules)/,
        "js/ex_admin_common.js": ["assets/static/vendor/ex_admin_common.js"],
        "js/admin_lte2.js": ["assets/static/vendor/admin_lte2.js"],
        "js/jquery.min.js": ["assets/static/vendor/jquery.min.js"],
      }
    },
    stylesheets: {
      joinTo: {
        "css/admin_lte2.css": ["assets/static/vendor/admin_lte2.css"],
        "css/active_admin.css.css": ["assets/static/vendor/active_admin.css.css"],
        "css/app.css": /^(assets\/static\/css)/
      },
      order: {
        after: ["assets/static/css/app.css"] // concat app.css last
      }
    },
    templates: {
      joinTo: "js/app.js"
    }
  },

  conventions: {
    // This option sets where we should place non-css and non-js assets in.
    // By default, we set this to "/assets/static/assets". Files in this directory
    // will be copied to `paths.public`, which is "priv/static" by default.
    assets: /^(assets\/static\/assets)/
  },

  // Phoenix paths configuration
  paths: {
    // Dependencies and current project directories to watch
    watched: [
      "assets/static",
      "test/static"
    ],

    // Where to compile files to
    public: "priv/static"
  },

  // Configure your plugins
  plugins: {
    babel: {
      // Do not use ES6 compiler in vendor code
      ignore: [/assets\/static\/vendor/]
    }
  },

  modules: {
    autoRequire: {
      "js/app.js": ["assets/static/js/app"]
    }
  },

  npm: {
    enabled: true
  }
};
