# Laboratory Work #1

## Objectives

- Get to know the base concepts of front-end development.
- Achieve some basic Bootstrap knowledge.

---

In this laboratory work I used HTML, CSS and JavaScript to build a very basic website layout.
The Bootstrap framework was used to style elements, and jQuery to animate them. Both plugins can be found
under the `plugins` folder in the root directory of this repository.

Bootstrap and jQuery were imported into our HTML templates using the following code:
```html
  <link rel="stylesheet" href="../plugins/bootstrap.css">
  <!--...-->
  <script src="../plugins/jquery.js"></script>
  <script src="../plugins/bootstrap.js"></script>
```

There is also an `index.css` file, where I have put some custom CSS rules.

---

Bootstrap uses a 12 column grid system. We can use the grid system to specify various widths for our elements.
To do so we add classes such as: `col-md-6`, `col-xs-9` to our elements.

Here's an example of how elements can be arranged:
```html
  <div class="row">
    <div class="col-md-3">Spans 3 columns.</div>
    <div class="col-md-4">Spans 4 columns.</div>
    <div class="col-md-5">Spans 5 columns.</div>
  </div>
```

---

The navbar links the user to 4 different pages. The pages only have filler content currently.
