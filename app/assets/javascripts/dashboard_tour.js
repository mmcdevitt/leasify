+function ($) {
  $(function(){
    
    var intro = introJs();

    intro.setOptions({
      steps: [
      {
        element: '.alert-tour',
          intro: '<p class="h4 text-uc"><strong>Let\'s fill in content</strong></p><p>This is the required information that you must complete in order to have a fully functional website.</p>',
          position: 'bottom'
        },
     
        {
          element: '.nav.nav-main',
          intro: '<p class="h4 text-uc"><strong>Your sites main menu</strong></p><p>These links will allow you to create availabilities, pages, contacts, choose templates, and fill in property information.</p>',
          position: 'right'
        },
     
        {
          element: '.site-link-tour',
          intro: '<p class="h4 text-uc"><strong>Link to your site</strong></p><p>Click this link to view your site.</p>',
          position: 'right'
        },
     
        {
          element: '.allsite-link-tour',
          intro: '<p class="h4 text-uc"><strong>Link to your main dashboard</strong></p><p>Click this link to go back to your main dashboard.</p>',
          position: 'right'
        },
     
        {
          element: '.dashboard-link-tour',
          intro: '<p class="h4 text-uc"><strong>Link to this sites dashboard</strong></p><p>Click this link to go back to this sites dashboard.</p>',
          position: 'left'
        }
      ],
      showBullets: true,
    });

    intro.start();

  });
}(jQuery);