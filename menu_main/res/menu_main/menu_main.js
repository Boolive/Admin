/**
 * Created by Vladimir on 16.08.2015.
 */
(function($, WidgetJS, undefined) {
    WidgetJS.define('menu_main', 'Widget', {

        buttons: null,

        create: function () {
            this._super('Widget').create.call(this);
            var self = this;
            self.buttons = self.$element.find('.menu_main__popup');
            self.buttons.on('click', function(e){
                // Show menu
                var pos = $(this).offset();
                pos.left += $(this).width();
                self.emit('showObjectOperations', [{
                    object:$(this).attr('data-object'),
                    pos: pos
                }], true);

                $(this).addClass('menu_main__popup_active');

                e.preventDefault();
                e.stopPropagation();
            });
        },

        on: {
            /**
             * Deactivate buttons
             * @param info
             */
            hideObjectOperations: function(info){
                this.buttons.removeClass('menu_main__popup_active');
            }
        }
    });
})(jQuery, WidgetJS);