// Shows the error messages above the form.
// Shows the error messages above the form (Bootstrap alert style).
function showErrors(form, errors) {
    let box = form.parentElement.querySelector('.js-errors');
    if (!box) {
        box = document.createElement('div');
        box.className = 'js-errors alert alert-danger';
        form.parentElement.insertBefore(box, form);
    }
    box.innerHTML = '';
    const ul = document.createElement('ul');
    ul.className = 'mb-0 ps-3';
    errors.forEach(function (msg) {
        const li = document.createElement('li');
        li.textContent = msg;
        ul.appendChild(li);
    });
    box.appendChild(ul);
}

// Register form
const registerForm = document.getElementById('register-form');
if (registerForm) {
    registerForm.addEventListener('submit', function (e) {
        const name = registerForm.name.value.trim();
        const email = registerForm.email.value.trim();
        const password = registerForm.password.value;
        const confirm = registerForm.confirm_password.value;
        const errors = [];

        if (name === '') errors.push('Name is required');
        if (email === '') errors.push('Email is required');
        if (password === '') errors.push('Password is required');
        if (confirm === '') errors.push('Confirm password is required');
        if (password !== '' && confirm !== '' && password !== confirm) {
            errors.push('Passwords do not match');
        }

        if (errors.length > 0) {
            e.preventDefault();          // stop the form from being sent
            showErrors(registerForm, errors);
        }
    });
}

// Login form
const loginForm = document.getElementById('login-form');
if (loginForm) {
    loginForm.addEventListener('submit', function (e) {
        const email = loginForm.email.value.trim();
        const password = loginForm.password.value;
        const errors = [];

        if (email === '') errors.push('Email is required');
        if (password === '') errors.push('Password is required');

        if (errors.length > 0) {
            e.preventDefault();
            showErrors(loginForm, errors);
        }
    });
}

// To-do forms (Add and Edit): every form with class "title-form"
document.querySelectorAll('.title-form').forEach(function (form) {
    form.addEventListener('submit', function (e) {
        const title = form.title.value.trim();
        const errors = [];

        if (title === '') {
            errors.push('Title is required');
        } else if (title.length > 200) {
            errors.push('Title is too long (200 characters at most)');
        }

        if (errors.length > 0) {
            e.preventDefault();
            showErrors(form, errors);
        }
    });
});