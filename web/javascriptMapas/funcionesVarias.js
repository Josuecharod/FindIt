/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function goToByScroll(id){
    $('html,body').animate({scrollTop:$("#"+id).offset().top},'slow');
}