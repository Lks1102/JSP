/**
 * 
 */
$(function(){

    $('.showPopup').click(function(e){
        //e.preventDefault();
        
        const tr = $(this).parent().parent();
        const orderNo = tr.find('.drderNo').text();
        
        let detaildata = document.getElementById('detailOrder').getAttribute('data-value');
        
        $('#orderPopup').show();
    });

    $('#orderPopup .btnClose').click(function(){
        $('#orderPopup').hide();
    });

});

$(function(){

    $('.showPopup').click(function(e){
        e.preventDefault();
        $('#userPopup').show();
    });

    $('#userPopup .btnClose').click(function(){
        $('#userPopup').hide();
    });

});