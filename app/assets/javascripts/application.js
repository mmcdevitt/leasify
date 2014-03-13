// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require app
//= require jquery.slimscroll.min


$(document).ready(function() {

	// Fade out alerts
	setTimeout(function () {
		$('#alert-fadeout').fadeOut('slow');
	}, 1000);


	// Image preview before upload
	// var preview = $(".upload-preview img");
	// $("#lefile").change(function(event){
 //     var input = $(event.currentTarget);
 //     var file = input[0].files[0];
 //     var reader = new FileReader();
 //     reader.onload = function(e){
 //         image_base64 = e.target.result;
 //         preview.attr("src", image_base64);
 //     };
 //     reader.readAsDataURL(file);
 //     $('#uploadimage').css('width', '90px').css('height', '90px');     
 //    });

    $('.table-edit').hover(function() {
        $(this).toggleClass('hover');
    });

    $('input[type="submit"').click(function() {
        $(this).addClass("disabled");
    });
	

});

    

    function add_fields(link, association, content) {
        var new_id = new Date().getTime();
        var regexp = new RegExp("new_" + association, "g");
        $(link).parent().append(content.replace(regexp, new_id));
        var id = "availability_availability_galleries_attributes_" + new_id + "_availability_image";

        // File submit gets clicked automatically after Add Image btn is clicked
        $("#" + id).click();
        $(".parent > .preview-col:last").hide();
        $(".parent > .preview-col > .fields > .upload-preview:last img").addClass(id);
   
        var preview = $(".upload-preview img." + id);

        $("#" + id).change(function(event){
            var input = $(event.currentTarget);
            var file = input[0].files[0];
            var reader = new FileReader();

            reader.onload = function(e){
                image_base64 = e.target.result;
                preview.attr("src", image_base64);
            };

            reader.readAsDataURL(file);  

            preview.addClass('preview-img-border');
           $(".parent > .preview-col:last").show();
        });     

    }





























