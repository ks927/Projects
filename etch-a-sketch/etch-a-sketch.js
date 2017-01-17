//Generate grid
function generateGrid(){
    var container = 500;
    var squares = 20;
    
    for(var i=0; i < squares * squares; i++){
        $('#container').append('<div class="grid"></div>');
}
    console.log($("div.grid").length + " divs generated")
    
    //stylize container
    $('#container').css({
    'width': container,
    'height': container,
    'margin': 'auto',
    'outline': '1px solid black',               
                       })
    console.log($("#container").width())
    
    //stylize grid
    $(".grid").css({
        'width': container / squares,
        'height': container / squares,
        'float': 'left',
        'display': 'inline-block'
                   })
};
 generateGrid();

//Create hover effect
$(document).ready(function(){
    
$(".grid").hover(function(){
    $(this).css({'background-color': '#666'});
})

//on 'clear' click, .grids return to original state
$('input[name="clear"]').on('click', function(){
    $(".grid").css({'background-color': '#fff'});
})

$('input[name="adjust"]').on('click', function(){
  var size = prompt("How many squares would you like the grid?", 20);
  
})


});