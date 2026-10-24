# [thornton.phd](https://thornton.phd/)

a personal site. written in markdown, built using Jekyll, hosted on Github Pages.

https://docs.github.com/en/pages

the domain registrar and DNS provider is cloudflare.

## local development (vscode)

open this repo in vscode, then ctrl+shift+p "rebuild and reopen in devcontainer"

once it reloads, you can start the dev server: ctrl+shift+p "run task", then select "Start Server".

then open http://localhost/ in your browser.

as you modify files and save your changes, the browser view will automatically reload.

## local development (docker)

to start the local server:

```
docker compose up -d
```

then open http://localhost/ in your browser.

as you modify files and save your changes, the browser view will automatically reload.

to stop the local server:

```
docker compose down
```

## publishing

commit your modifications and push -- either directly to main, or to a side branch (then merge to main with PR).

when your commit lands on main, it will automatically be built and published. if it fails, you'll see a red X in the commit log on the github web interface (and a green checkmark if it succeeds). you can view the history of builds in the "actions" tab on github.

## repo structure

the actual website contents (pages and posts) live in `site`.

* `Gemfile` and `Gemfile.lock` defines which version of Jekyll (plus themes and plugins) is used.
* `_config.yaml` configures Jekyll and your site. [config docs](https://jekyllrb.com/docs/configuration/options/)
* `.github/workflows` - contains the pipeline that runs when a new commit is pushed to github.
* `container/` - contains scripts used by docker to set up jekyll.
* `.devcontainer/` - dev container config; wraps `compose.yaml`.
* `.vscode/` - VS Code tasks to start and stop the server inside the dev container.

the structure of the `site` directory can be summarized as:

* any files/directories starting with an underscore have special treatment, or get ignored.
* the `_posts` directory is for if you want to use it like a blog or newsletter.
  * posts have timestamps and authors and last-edit date, etc.
* any markdown files get converted to html; html files get published directly.
* markdown and html files can include metadata at the top called "front matter".
* the `_layouts` directory can define custom templates with embedded build-time python.

more details in the [Jekyll docs](https://jekyllrb.com/docs/)

## maintenance notes

if you update the Jekyll gem to a newer version (via `Gemfile` then re-locking), the docker compose image tag should also move. and the `.ruby-version` file (which is used by the "steup-ruby" action in the pipeline) should be updated to match the ruby version used in the new docker image. and if ruby was updated, the "setup-ruby" action (in the github workflow) might need to be updated to a new tag.
