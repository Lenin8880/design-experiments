# Design Experiments Plugin

⚠️ **This plugin is not intended for use on a production site.**

A simple plugin to prototype design ideas in WP-Admin. This repository is intended to be a quick way for designers to try out ideas and minor CSS updates. Quick, messy code is encouraged to get ideas across.

## To try an experiment: 

1. Install the [Design Experiments plugin](https://wordpress.org/plugins/design-experiments/) from the WordPress Plugins Directory
2. Activate the plugin.
3. Visit `Settings > Design Experiments` to activate an experiment.

## To build your own quick experiment:

1. First, [fork the repository](https://help.github.com/en/articles/fork-a-repo). 
2. [Clone](https://help.github.com/en/articles/cloning-a-repository) your fork. If possible, place your local copy in the Plugins folder of your local dev site. Then you'll be able to activate the plugin directly from your WP Admin dashboard (If this isn't possible, you'll need to manually create a zip of the repository and upload it to your site to install the plugin after you've made changes).
3. For simple CSS updates, you can either edit `css/default.css` directly, or edit `sass/default.scss` and compile using the method described below. If you'd like to add a new CSS file, you can enqueue it by following steps 4 and 5 below. 

## To submit an experiment for inclusion in the plugin: 

1. [Fork the repository](https://help.github.com/en/articles/fork-a-repo). 
2. [Clone](https://help.github.com/en/articles/cloning-a-repository) your fork. If possible, place your local copy in the Plugins folder of your local dev site. Then you'll be able to activate the plugin directly from your WP Admin dashboard (If this isn't possible, you'll need to manually create a zip of the repository and upload it to your site to install the plugin after you've made changes).
3. If you're using Sass, create new SASS stylesheet in the `sass` directory, and run `npm run build` to compile it. Otherwise, just add a new CSS file to the `css` directory. Experiments are expected to use a single css file. 
4. Begin your CSS file with the following file header, adjusting the values of each field to best describe your experiment (All fields are optional):

	```
	/*
	Title: Your Experiment Title
	Description: A description of your experiment.
	PR: https://
	*/
	```

5. When your stylesheet is ready, visit `Settings > Design Experiments`. Select your experiment to activate it and view your changes.
6. The settings screen now supports a real-time interactive preview. Selecting an experiment applies it immediately for your current admin session so you can evaluate it before saving.
7. Once you're ready to share your experiment, [open a PR](https://help.github.com/en/articles/creating-a-pull-request) and share it here. 

### To compile CSS:

1. Run `npm install` to install dependencies (You'll only have to do this once).
2. Run `npm run build` to compile the CSS once, or `npm run watch` to have it compile changes whenever you modify a sass file. 

## Questions or Improvements?

If you'd like to propose improvements to this plugin, feel free to open an [issue](https://github.com/WordPress/design-experiments/issues) or PR. Also feel free to ask in the [#design channel on WordPress.org Slack](http://wordpress.slack.com/messages/design/). 

## Sample automated deployment

This repository now includes a sample GitHub Actions workflow at `.github/workflows/sample-deploy.yml` that packages the plugin on every push to `main`, on version tags (`v*`), or when manually triggered.

### What it does

1. Installs npm dependencies and runs `npm run build`.
2. Packages the plugin into a versioned zip with `scripts/package-plugin.sh`.
3. Uploads the zip as a workflow artifact.
4. Optionally deploys to a staging WordPress environment over SSH when you run the workflow manually and choose `staging-via-ssh`.

### Configure secrets for staging deploy

To use the optional SSH deployment job, add these repository secrets:

- `WP_STAGING_HOST`
- `WP_STAGING_USER`
- `WP_STAGING_SSH_KEY`
- `WP_STAGING_PORT` (optional, defaults to `22`)
- `WP_STAGING_TMP_DIR` (temporary directory on the server)
- `WP_PATH` (path to your WordPress installation for WP-CLI)

If these are not set, you can still run `artifact-only` mode to generate a zip and install it manually for testing.
