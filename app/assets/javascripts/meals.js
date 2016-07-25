$(function () {

    info = $('#ratyInfo').data();
    
    $('.star-rating').raty({
        starOff: info.starOff,
        starOn: info.starOn,
        starHalf: info.starHalf,
        path: '',
        readOnly: true,
        score: function() {
            return $(this).attr('data-score');
        }
    });
    
    // Form the review form
    $('#star-rating').raty({
        starOff: info.starOff,
        starOn: info.starOn,
        starHalf: info.starHalf,
        path: '',
        scoreName: 'meal_review[rating]'
    });

    $('[data-toggle="tooltip"]').tooltip();
    
});