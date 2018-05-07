# Laboratory Work #4

## Objectives

### Goals
* Understand how authentification and authorization works;
* Get more familiar with MVC pattern;

### Main requirements
* [x] Basic authentification system (basically, the autentificated user can do anything);

### Bonus Points
* 2 or more roles are defined and they have different actions defined and each role has well defined permissions; `2pt`

**Total:** `2 pts`

---

In this laboratory work the main focus was the implementation of authentication and authorization for the users of the platform.

Visitors can visit the `/register` endpoint or click the "Register" link in the navbar) endpoint in order to create a new account which they can later use
to login at the `/login` endpoint. Authorized users can view and create new tabs. Users can also edit and delete tabs they create, but not ones created by
other users. There are also "superusers" which have a higher level of permissions than regular users which have access to modify and delete resources created
by other users.

In order to see if a user has write access to a tab or not, the foreign key `user_id` in the tab model is compared against the user's ID. Obviously, superusers
bypass this check.

Dependencies used for implementation:
*  [comeonin](https://github.com/riverrun/comeonin) - for password encryption
*  [bcrypt](https://github.com/riverrun/bcrypt_elixir) - addon to comeonin
*  [guardian](https://github.com/ueberauth/guardian) for handling sessions and the auth flow

## Setup

See in [lab2](https://github.com/TeeSeal/web-tech-labs/tree/master/lab2). You might also have to run `mix deps.get` again if you had already followed the steps in lab2 in order to fetch the new dependencies for the authentication.

## Conclusion

In this laboratory work I have learned how to correctly handle authorization by creating and keeping sessions, encrypting passwords and limiting permissions for users.
I have also learned how to work with migrations in Phoenix, as I needed to modify the user model in order to add a permission level field to it for checking whether the
user is a superuser or not.
The most tricky part about this laboratory work was limiting permissions to endpoints. At first I thought I would have to make user checks for all controller actions I want
to limit, but phoenix controllers make use of `plugs`, which are functions that the connection has to run through before accessing the endpoint. The situation was simply handled
by adding `plug :check_access when action in [:edit, :update, :delete]` and then implementing the needed checks inside the `check_access` function in the same module.
