window.onload = function() {
    if (( /pointer/gi ).test( window.location.search )) {
        /*
        My pointer sends up/down keys for navigation,
        So I set then do prev/next
         */
        Reveal.configure({
            keyboard: {
                //up
                38: 'prev',
                //down
                40: 'next'
            }
        });
    }
}
