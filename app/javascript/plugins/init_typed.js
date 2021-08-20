import Typed from 'typed.js';

const is_root = location.pathname == "/"

const typedJs = () => {
  if (is_root) {
    const options_baseline = {
      strings: ['Let the magic happen...'],
      typeSpeed: 80
    };
    const baseline = document.getElementById("baseline");
    const typed_baseline = new Typed(baseline, options_baseline);

    const options_title = {
      strings: ['WELCOME TO OZ'],
      typeSpeed: 80
    };
    const main_title = document.getElementById("main-title");
    const typed_title = new Typed(main_title, options_title);

  }
}


export { typedJs };
