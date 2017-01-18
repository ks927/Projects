//Generate grid
function generateGrid(){

    for(var i=0; i < size*size; i++){
        $('#container').append('<div class="grid"></div>');
}

    //stylize grid
    $(".grid").css({
        'width': '500' / size,
        'height': '500' / size,
                   })
};


    //Create hover effect
    function hover(){
    $(".grid").hover(function(){
    $(this).css({'background-color': '#666'});
})
}

//Handle buttons and call functions
$(document).ready(function(){

    size = 20;

    generateGrid();

    hover();

//on 'clear' click, .grids return to original state
$('input[name="clear"]').on('click', function(){
    $('.grid').css({'background-color': '#FFF'});
})

//
$('input[name="adjust"]').on('click', function(){
    size = prompt("How many squares would you likthe grid?", 20);

    $('#container').empty();
    generateGrid(size);
    console.log($("div.grid").length + " divs generated");
    hover();
})

//Toggle grid outline
$('input[name="toggle"]').on('click', function(){
$('.grid').toggleClass("outline");
})

});
