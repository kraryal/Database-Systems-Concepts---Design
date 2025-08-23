document.addEventListener('DOMContentLoaded', function() {
    var pageReloaded = false;// Function to reload the page only once
    function reloadPageOnce() {
        if (!pageReloaded) {
            pageReloaded = true;
            location.reload();
        }
    };

    setTimeout(reloadPageOnce, 1000)
})
