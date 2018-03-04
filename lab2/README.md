# Laboratory Work #2

## Objectives

* Get familiar with MVC pattern.

---

Elixir's Phoenix framework has been used for this laboratory work. While Elixir is a functional language rather than
an object oriented one, it does a very good job at implementing the MVC pattern.

While it wasn't a requirement, the database setup has been done as well as Phoenix does almost all the work for us.

### Models
2 Models have been created:

* **Tab**, in the **library** context. (`lib/lab/library`)
* **User**, in the **auth** context. (`lib/lab/auth`)

Phoenix lets us easily scaffold code for models with `mix phx.gen.html ContextName ModelName PluralModelName FieldName:Type(*)`.
In this laboratory work the focus was put mainly on the **Tab** model. The **User** model was created only because the **Tab** model contains
a field that references the User table.

### Views
As most other MVC frameworks, Phoenix renders pages serverside with `eex` (Embeded Elixir) files.

Views are separate Elixir files where we can define helper functions to aid us in rendering the page.
Views can be found under `lib/lab_web/views`. Each view has a set of `eex` templates corresponding to
it in the `lib/lab_web/templates` folder. The main app layout is in `lib/lab_web/templates/layout/app.html.eex`, it
contains the app footer and other partials such as the navbar and the main body. Other templates are rendered within
a template using the `render()` function:

```eex
<%= render LabWeb.NavView, "nav.html", assigns %>
```

### Controllers
Controllers can be viewed under `lib/lab_web/controllers`. All controllers contain all the default CRUD actions
scaffolded by Phoenix. The user controller actions are only currently accessible by explictily writing the correct
route in the address bar. For example `localhost:4000/users/new` to create a new user. A few of the Tab controller
actions have been put into use, such as the `index`, `new` and `create` actions. A custom clause of the `index` action
was added in order to filter various types of Tabs:

```elixir
def index(conn, %{"type" => type}) do
  tabs = Library.list_tabs_of_type(type)
  render(conn, "index.html", tabs: tabs, type: type)
end
```

This action is accessible at the `/tabs/list/<TYPE>` route. The app is only meant to work for the `guitar`, `piano` and `violin`
types. The page will still render if you try to write some other types in, but there will be no jumbotron background. This will be
handled in the future by a redirect to 404.

Currently, at `/tabs/new`, the user has to input the tab type manually, which might not be something we want. But hey, if you create
a `foreign_type` tab, it will still appear under `/tabs/list/foreign_type`!

## Setup

* [Install Elixir](https://elixir-lang.org/install.html)
* [Install Phoenix](https://hexdocs.pm/phoenix/installation.html)
* [Install Node.js](https://nodejs.org/en/download/)\
  (we need npm to manage static assets such as bootstrap and jquery)
* Clone this repository with `git clone https://github.com/TeeSeal/web-tech-labs.git`
* Change directory `cd web-tech-labs/lab2`
* Install dependencies with `mix deps.get`
* Create and migrate your database with `mix ecto.create && mix ecto.migrate`\
  (Phoenix uses PostgreSQL as database. Make sure to provide your psql username and password in
  `config/dev.exs` beforehand)
* Install Node.js dependencies with `cd assets && npm install`
* Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Conclusion

In this laboratory work I have strengthened my knowledge of the MVC pattern. Phoenix provides a great environment for MVC
web apps. While most of the code is scaffolded in this laboratory work, most of it will probably be removed/rewritten in the
future to fit the needs of the application. The most difficult part of this laboratory work was understanding brunch and getting
the static assets (bootstrap and jquery) to work.
