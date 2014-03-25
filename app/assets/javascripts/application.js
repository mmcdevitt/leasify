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
//= require jquery.turbolinks
//= require turbolinks

//= require bootstrap
//= require bootstrap-wysihtml5
//= require bootstrap-colorpicker
//= require app
//= require jquery.slimscroll.min
//= require_self

$(document).ready(function() {

	// Fade out alerts
	setTimeout(function () {
		$('#alert-fadeout').fadeOut('slow');
	}, 1000);


	

    // Hover edit links in table
    $('.table-edit').hover(function() {
        $(this).toggleClass('hover');
    });

  

   
   

});

    

    function add_fields(link, association, content) {
        var new_id = new Date().getTime();
        var regexp = new RegExp("new_" + association, "g");
        $(link).parent().append(content.replace(regexp, new_id));
        var id = "availability_availability_galleries_attributes_" + new_id + "_availability_image";
        var homepage_id = "theme_option_homepage_galleries_attributes_" + new_id + "_homepage_gallery_image";

        // File submit gets clicked automatically after Add Image btn is clicked on Availability page
        $("#" + id).click();
        // File submit gets clicked automatically after Add image btn is clicked on Homepage Gallery page
        $("#" + homepage_id).click();
        $(".parent > .preview-col:last").hide();
        $(".parent > .preview-col > .fields > .upload-preview:last img").addClass(id);
   

        // Preview image on Availability page before submit
        var preview = $(".upload-preview img." + id);
        // File input change on Availability page
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

        // Preview image on Availability page before submit
        var preview_homepage = $(".upload-preview img." + homepage_id);
        // File input change on Availability page
        $("#" + homepage_id).change(function(event){
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





























