document.addEventListener('DOMContentLoaded', function () {
    const addToCartButtons = document.querySelectorAll('.add-to-cart');

    addToCartButtons.forEach(button => {
        button.addEventListener('click', function () {
            const bookId = this.dataset.id;

            fetch('add_to_cart.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ bookId: bookId })
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    alert('Book added to cart!');
                } else {
                    alert('Error adding book to cart');
                }
            });
        });
    });
});