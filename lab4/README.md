# Laboratory Work #3

## Objectives

### Goals
* Understand what is an ORM and how to use it;
* Get more familiar with MVC pattern;
* Understand BusinessLogic pattern.

### Main requirements
* [x] Define one model;
* [x] Implement basic Create, Read, Update, Delete operations for the defined model.

### Bonus Points
* [x] 2 or more models are defined and there are some relations between them (FK, MtM...); `2pt`
* [x] Define and ImageField or something related in a model. Display the uploaded image in detail view; `1pt`
* [x] On the list view, implement some basic filtering (search field, etc...). `1pt`

**Total:** `4 pts`

---

As the models had already been created in the 2nd laboratory work, this one mainly focused on the CRUD actions.

There are currently 2 models: `User` and `Tab`. The `User` model have a one to many relationship with the `Tab` model, as in:
a user can create multiple tabs while a tab can only have one creator.

There is also an authentication system in place, made possible using [comeonin](https://github.com/riverrun/comeonin) and [bcrypt](https://github.com/riverrun/bcrypt_elixir) for password encryption, and [guardian](https://github.com/ueberauth/guardian) for handling sessions and the auth flow. The navbar items change based on whether the user is logged in or not. Users can create new accounts at the `/register` path, and then login with the created account at `/login`.

While the authentication is present and there is a restriction for viewing resourced for unauthorized users, there are currently no restrictions for logged in users:
They can view, edit and delete resources created by other users and such. In the future there will be superuser accounts which still have no restrictions, but regular users will be able to meddle only with resources they create themselves and will only be able to view resources created by other users.

The `show` action for tabs leads to a page where tab details can be viewed. If a valid album image URL is supplied upon tab creation, the image is rendered on this page.
Also, we have 3 types of tabs but only 1 database table but the following pages filter the tabs to only show the ones relevant to them:
* `/tabs/list/guitar`
* `/tabs/list/piano`
* `/tabs/list/violin`

## Setup

See in [lab2](https://github.com/TeeSeal/web-tech-labs/tree/master/lab2). You might also have to run `mix deps.get` again if you had already followed the steps in lab2 in order to fetch the new dependencies for the authentication.

## Conclusion

In this laboratory work I have learned how to correctly create relations between models and manipulate data according to the application's business logic. The most challenging, yet interesting, part was creating the authentication system, it was something completely new for me. Besides that, everything done in this laboratory work was something I already knew how to do and didn't prove to be very difficult.
