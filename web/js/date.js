jQuery(document).ready(function() {
   
    var eventDates = {};
    eventDates[ new Date( '4/15/2019' )] = new Date( '5/04/2019' );
    eventDates[ new Date( '4/25/2019' )] = new Date( '5/04/2019' );
    eventDates[ new Date( '5/15/2019' )] = new Date( '5/04/2019' );
    eventDates[ new Date( '5/25/2019' )] = new Date( '5/04/2019' );
    eventDates[ new Date( '6/15/2019' )] = new Date( '5/04/2019' );
    eventDates[ new Date( '6/25/2019' )] = new Date( '5/04/2019' );
    eventDates[ new Date( '7/15/2019' )] = new Date( '5/06/2019' );
    eventDates[ new Date( '7/25/2019' )] = new Date( '5/20/2019' );
    eventDates[ new Date( '8/15/2019' )] = new Date( '5/25/2019' );
    eventDates[ new Date( '8/25/2019' )] = new Date( '5/25/2019' );
    eventDates[ new Date( '9/15/2019' )] = new Date( '5/25/2019' );
    eventDates[ new Date( '10/15/2019' )] = new Date( '5/25/2019' );
           
    jQuery('#datepicker').datepicker({
        beforeShowDay: function( date ) {
            var highlight = eventDates[date];
                if( highlight ) {
                     return [true, "event", highlight];
                } else {
                     return [true, '', ''];
                }
             }
        });
    });
    

         