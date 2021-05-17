function getRandomColor(){	

    var color = '#' + (Math.random() * 0xFFFFFF << 0).toString(16);
    
    return color;
}


$(document).ready(function()
{
    $("a").hover(function()
    {
        var randomColor = getRandomColor();
        $(this).css('color',randomColor)
    });

    $('a').click(function(){
        $(this).addClass('visited');
    });
});

