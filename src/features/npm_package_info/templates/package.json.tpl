{
  "name": "<%= packageName %>",
  "version": "0.0.1",
  "description": "<%= packageName %> is generated by chore-cli.",
  "main": "dist/index.js",
  "module": "dist/<%= packageName %>.esm.js",
  "typings": "dist/index.d.ts",
  "scripts": {
    <% if (hasGitFolder) { %>
    "prepare": "husky install",
    <% } %>

    <% if (useTypeScriptCompiler) { %>
    "start": "tsc --watch",
    "build": "tsc",
    "build:declaration": "tsc --declaration —-declarationDir dist --emitDeclarationOnly src/index.ts",
    <% } %>

    <% if (useWebpack) { %>
    "start": "webpack-dev-server --process --color --config webpack.config.ts",
    "build": "webpack --config webpack.config.ts",
    "build:declaration": "tsc --declaration —-declarationDir dist --emitDeclarationOnly src/index.ts",
    <% } %>

    <% if (useRoolup) { %>
    "build": "rollup -c rollup.config.ts",
    "build:declaration": "tsc --declaration —-declarationDir dist --emitDeclarationOnly src/index.ts",
    <% } %>

    "test": "jest"
  },
  <% if (hasGitFolder) { %>
  "commitlint": {
    "extends": [
      "@commitlint/config-conventional"
    ]
  },
  "lint-staged": {
    "*.{js,ts,jsx,tsx,scss,css,json,md}": [
      "pretty-quick --staged"
    ],
    "*.{js,ts,jsx,tsx}": [
      "eslint --fix"
    ]
  },
  <% } %>
  "repository": {
    "type": "git",
    "url": "git+<%= repoUrl %>.git"
  },
  "keywords": [
    "cli",
    "chore"
  ],
  "author": "<%- author %>",
  "license": "<%= license %>",
  "homepage": "<%= repoUrl %>#readme",
  "bugs": {
    "url": "<%= repoUrl %>/issues"
  }
}
