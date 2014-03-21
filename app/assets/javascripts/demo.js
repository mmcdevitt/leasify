+function ($) {
  $(function(){
    
    var intro = introJs();

    intro.setOptions({
      steps: [
      {
        element: '.btn-demo',
          intro: '<p class="h4 text-uc"><strong>Create your site</strong></p><p>You can create multiple websites, depending on your account. Click the <b>Create New Site</b> button to get started. Once clicked, you will be taken to a new page to save the properties name and to create your own Leasify URL.</p>',
          position: 'bottom'
        },
     
        {
          element: '.table',
          intro: '<p class="h4 text-uc"><strong>List of Sites</strong></p><p>The information to your newly created site will be listed here.</p>',
          position: 'bottom'
        },
     
        {
          element: '.trash-demo',
          intro: '<p class="h4 text-uc"><strong>Delete your site</strong></p><p>Click this <b>trash icon</b> button if you want to delete your site.</p>',
          position: 'left'
        },
     
        {
          element: '.nav-main',
          intro: '<p class="h4 text-uc"><strong>Site links</strong></p><p>The links to your newly created sites will be listed here. You must click the links in order to edit the contents of the site.</p>',
          position: 'right'
        }
      ],
      showBullets: true,
    });

    intro.start();

  });
}(jQuery);