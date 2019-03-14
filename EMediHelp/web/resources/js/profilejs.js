/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function profile() {
    $('#profile-container-profile-div').show();
    $('#profile-container-appointment-div').hide();
    $('#profile-container-prescrription-div').hide();
    $('#profile-container-feedback-div').hide();
    $('#profile-container-change-pass-div').hide();
}
function appointment() {
    $('#profile-container-profile-div').hide();
    $('#profile-container-appointment-div').show();
    $('#profile-container-prescrription-div').hide();
    $('#profile-container-feedback-div').hide();
    $('#profile-container-change-pass-div').hide();
}
function prescription() {
    $('#profile-container-profile-div').hide();
    $('#profile-container-appointment-div').hide();
    $('#profile-container-prescrription-div').show();
    $('#profile-container-feedback-div').hide();
    $('#profile-container-change-pass-div').hide();
}
function feedback() {
    $('#profile-container-profile-div').hide();
    $('#profile-container-appointment-div').hide();
    $('#profile-container-prescrription-div').hide();
    $('#profile-container-feedback-div').show();
    $('#profile-container-change-pass-div').hide();
}
function changepass() {
    $('#profile-container-profile-div').hide();
    $('#profile-container-appointment-div').hide();
    $('#profile-container-prescrription-div').hide();
    $('#profile-container-feedback-div').hide();
    $('#profile-container-change-pass-div').show();
}
$(function() {
    profile();
    $('#profile').click(function() {
        profile();
        return false;
    }); 
    $('#appointment').click(function() {
        appointment();
        return false;
    });  
    $('#prescription').click(function() {
        prescription();
        return false;
    });
    $('#feedback').click(function() {
        feedback();
        return false;
    });
    $('#changepass').click(function() {
        changepass();
        return false;
    });
    if (location.search=="?profile"){
        profile();
    }
    if (location.search == "?appointment"){
        appointment();
    }
    if (location.search=="?prescription"){
        prescription();
    }
    if (location.search == "?feedback"){
        feedback();
    }
    if (location.search=="?changepass"){
        changepass();
    }
});
